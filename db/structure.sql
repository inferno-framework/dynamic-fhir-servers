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
-- Name: allresourcetype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.allresourcetype (
                                           id text NOT NULL,
                                           txid bigint NOT NULL,
                                           ts timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
                                           resource_type text NOT NULL,
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
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
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: allergyintolerance allergyintolerance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.allresourcetype
    ADD CONSTRAINT allresourcetype_pkey PRIMARY KEY (resource_type, id);

--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);

--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;



