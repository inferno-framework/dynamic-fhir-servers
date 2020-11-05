SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: resource_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.resource_status AS ENUM (
    'created',
    'updated',
    'deleted',
    'recreated'
);


--
-- Name: _resource; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public._resource AS (
	id text,
	txid bigint,
	ts timestamp with time zone,
	resource_type text,
	status public.resource_status,
	resource jsonb
);


--
-- Name: _fhirbase_to_resource(public._resource); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public._fhirbase_to_resource(x public._resource) RETURNS jsonb
    LANGUAGE sql
    AS $$
 select x.resource || jsonb_build_object(
  'resourceType', x.resource_type,
  'id', x.id,
  'meta', coalesce(x.resource->'meta', '{}'::jsonb) || jsonb_build_object(
    'lastUpdated', x.ts,
    'versionId', x.txid::text
  )
 );
$$;


--
-- Name: fhirbase_create(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_create(resource jsonb) RETURNS jsonb
    LANGUAGE sql
    AS $$
   SELECT fhirbase_create(resource, nextval('transaction_id_seq'));
$$;


--
-- Name: fhirbase_create(jsonb, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_create(resource jsonb, txid bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $_$
DECLARE
  _sql text;
  rt text;
  rid text;
  result jsonb;
BEGIN
    rt   := resource->>'resourceType';
    rid  := coalesce(resource->>'id', fhirbase_genid());
    _sql := format($SQL$
      WITH archived AS (
        INSERT INTO %s (id, txid, ts, status, resource)
        SELECT id, txid, ts, status, resource
        FROM %s
        WHERE id = $2
        RETURNING *
      ), inserted AS (
         INSERT INTO %s (id, ts, txid, status, resource)
         VALUES ($2, current_timestamp, $1, 'created', $3)
         ON CONFLICT (id)
         DO UPDATE SET
          txid = $1,
          ts = current_timestamp,
          status = 'recreated',
          resource = $3
         RETURNING *
      )

      select _fhirbase_to_resource(i.*) from inserted i

      $SQL$,
      rt || '_history', rt, rt, rt);

  EXECUTE _sql
  USING txid, rid, (resource - 'id')
  INTO result;

  return result;

END
$_$;


--
-- Name: fhirbase_delete(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_delete(resource_type text, id text) RETURNS jsonb
    LANGUAGE sql
    AS $$
   SELECT fhirbase_delete(resource_type, id, nextval('transaction_id_seq'));
$$;


--
-- Name: fhirbase_delete(text, text, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_delete(resource_type text, id text, txid bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $_$
DECLARE
  _sql text;
  rt text;
  rid text;
  result jsonb;
BEGIN
    rt   := resource_type;
    rid  := id;
    _sql := format($SQL$
      WITH archived AS (
        INSERT INTO %s (id, txid, ts, status, resource)
        SELECT id, txid, ts, status, resource
        FROM %s WHERE id = $2
        RETURNING *
      ), deleted AS (
         INSERT INTO %s (id, txid, ts, status, resource)
         SELECT id, $1, current_timestamp, status, resource
         FROM %s WHERE id = $2
         RETURNING *
      ), dropped AS (
         DELETE FROM %s WHERE id = $2 RETURNING *
      )
      select _fhirbase_to_resource(i.*) from archived i

      $SQL$,
      rt || '_history', rt, rt || '_history', rt, rt);

  EXECUTE _sql
  USING txid, rid
  INTO result;

  return result;

END
$_$;


--
-- Name: fhirbase_genid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_genid() RETURNS text
    LANGUAGE sql
    AS $$
  select gen_random_uuid()::text
$$;


--
-- Name: fhirbase_read(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_read(resource_type text, id text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $_$
DECLARE
  _sql text;
  result jsonb;
BEGIN
  _sql := format($SQL$
    SELECT _fhirbase_to_resource(row(r.*)::_resource) FROM %s r WHERE r.id = $1
  $SQL$,
  resource_type
  );

  EXECUTE _sql USING id INTO result;

  return result;
END
$_$;


--
-- Name: fhirbase_update(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_update(resource jsonb) RETURNS jsonb
    LANGUAGE sql
    AS $$
   SELECT fhirbase_update(resource, nextval('transaction_id_seq'));
$$;


--
-- Name: fhirbase_update(jsonb, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.fhirbase_update(resource jsonb, txid bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $_$
DECLARE
  _sql text ;
  rt text;
  rid text;
  result jsonb;
BEGIN
    rt   := resource->>'resourceType';
    rid  := resource->>'id';

    CASE WHEN (rid IS NULL) THEN
      RAISE EXCEPTION 'Resource does not have and id' USING HINT = 'Resource does not have and id';
    ELSE
    END CASE;

    _sql := format($SQL$
      WITH archived AS (
        INSERT INTO %s (id, txid, ts, status, resource)
        SELECT id, txid, ts, status, resource
        FROM %s
        WHERE id = $2
        RETURNING *
      ), inserted AS (
         INSERT INTO %s (id, ts, txid, status, resource)
         VALUES ($2, current_timestamp, $1, 'created', $3)
         ON CONFLICT (id)
         DO UPDATE SET
          txid = $1,
          ts = current_timestamp,
          status = 'updated',
          resource = $3
         RETURNING *
      )

      select _fhirbase_to_resource(i.*) from inserted i

      $SQL$,
      rt || '_history', rt, rt, rt);

  EXECUTE _sql
  USING txid, rid, (resource - 'id')
  INTO result;

  return result;

END
$_$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: allergyintolerance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.allergyintolerance (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'AllergyIntolerance'::text,
    status text DEFAULT 'created'::text,
    resource jsonb NOT NULL
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bundle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bundle (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Bundle'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: capabilitystatement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capabilitystatement (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'CapabilityStatement'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: careplan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.careplan (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'CarePlan'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: careteam; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.careteam (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'CareTeam'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: codesystem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.codesystem (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'CodeSystem'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: conceptmap; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.conceptmap (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ConceptMap'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: condition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.condition (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Condition'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: device; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.device (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Device'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: diagnosticreport; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diagnosticreport (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'DiagnosticReport'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: documentreference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documentreference (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'DocumentReference'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: encounter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.encounter (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Encounter'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: goal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Goal'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: immunization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.immunization (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Immunization'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: implementationguide; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.implementationguide (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ImplementationGuide'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name character varying,
    done boolean,
    todo_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Location'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: medication; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medication (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Medication'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);

--
-- Name: medicationrequest; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medicationrequest (
                                   id text NOT NULL,
                                   txid bigint NOT NULL,
                                   ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
                                   resource_type text DEFAULT 'MedicationRequest'::text,
                                   status public.resource_status NOT NULL,
                                   resource jsonb NOT NULL
);


--
-- Name: observation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.observation (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Observation'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: operationdefinition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.operationdefinition (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'OperationDefinition'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Organization'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: patient; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patient (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Patient'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: practitioner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.practitioner (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Practitioner'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: procedure; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.procedure (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'Procedure'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: searchparameter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.searchparameter (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'SearchParameter'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: structuredefinition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.structuredefinition (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'StructureDefinition'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource jsonb
);


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: valueset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.valueset (
    id text NOT NULL,
    txid bigint NOT NULL,
    ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    resource_type text DEFAULT 'ValueSet'::text,
    status public.resource_status NOT NULL,
    resource jsonb NOT NULL
);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: allergyintolerance allergyintolerance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.allergyintolerance
    ADD CONSTRAINT allergyintolerance_pkey PRIMARY KEY (id);


--
-- Name: bundle bundle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bundle
    ADD CONSTRAINT bundle_pkey PRIMARY KEY (id, txid);


--
-- Name: capabilitystatement capabilitystatement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capabilitystatement
    ADD CONSTRAINT capabilitystatement_pkey PRIMARY KEY (id);


--
-- Name: careplan careplan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.careplan
    ADD CONSTRAINT careplan_pkey PRIMARY KEY (id);


--
-- Name: careteam careteam_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.careteam
    ADD CONSTRAINT careteam_pkey PRIMARY KEY (id);


--
-- Name: codesystem codesystem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codesystem
    ADD CONSTRAINT codesystem_pkey PRIMARY KEY (id);


--
-- Name: conceptmap conceptmap_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.conceptmap
    ADD CONSTRAINT conceptmap_pkey PRIMARY KEY (id);


--
-- Name: condition condition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condition
    ADD CONSTRAINT condition_pkey PRIMARY KEY (id);


--
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- Name: diagnosticreport diagnosticreport_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diagnosticreport
    ADD CONSTRAINT diagnosticreport_pkey PRIMARY KEY (id);


--
-- Name: documentreference documentreference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documentreference
    ADD CONSTRAINT documentreference_pkey PRIMARY KEY (id);


--
-- Name: encounter encounter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.encounter
    ADD CONSTRAINT encounter_pkey PRIMARY KEY (id);


--
-- Name: goal goal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT goal_pkey PRIMARY KEY (id);


--
-- Name: immunization immunization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.immunization
    ADD CONSTRAINT immunization_pkey PRIMARY KEY (id);


--
-- Name: implementationguide implementationguide_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.implementationguide
    ADD CONSTRAINT implementationguide_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: medication medication_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medication
    ADD CONSTRAINT medication_pkey PRIMARY KEY (id);

--
-- Name: medicationrequest medicationrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medicationrequest
    ADD CONSTRAINT medicationrequest_pkey PRIMARY KEY (id);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (id);


--
-- Name: operationdefinition operationdefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.operationdefinition
    ADD CONSTRAINT operationdefinition_pkey PRIMARY KEY (id);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: practitioner practitioner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.practitioner
    ADD CONSTRAINT practitioner_pkey PRIMARY KEY (id);


--
-- Name: procedure procedure_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procedure
    ADD CONSTRAINT procedure_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: searchparameter searchparameter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.searchparameter
    ADD CONSTRAINT searchparameter_pkey PRIMARY KEY (id);


--
-- Name: structuredefinition structuredefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.structuredefinition
    ADD CONSTRAINT structuredefinition_pkey PRIMARY KEY (id);


--
-- Name: valueset valueset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.valueset
    ADD CONSTRAINT valueset_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;



