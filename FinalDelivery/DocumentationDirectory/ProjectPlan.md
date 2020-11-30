_This is the template for your project plan. The parts in italics are concise explanations of what should go in the corresponding sections and should not appear in the final document._

# Project Plan

**Author**: Team 22

## 1 Introduction

Inferno is an open-source testing tool for HL7 FHIR which helps developers create and implement standards. Inferno is used as a certification tool for the Office of National Coordinator's Health IT Certification Program and also provides dynamic testing and validation capabilities for based on FHIR specifications. Today, Inferno is focused on server-side FHIR implementation guide conformance testing. We have received several requests for client-side FHIR implementation guide conformance testing. Client-side FHIR implementation guide conformance testing would allow app developers to dynamically / automatically check whether their client meets the requirements described in FHIR implementation guides. Help us make client-side FHIR implementation guide conformance testing a reality!

## 2 Process Description

_Process description as a set of activities; for each activity, provide the following:_

- _Activity name (verb or verb phrase) - Dynamically-generated server with read-only capabilities _
- _Activity description (concise paragraph) - Dynamically-generated server with read-only capabilities based on implementation guide (IG) JSON Capability Statement (can use US Core IG 3.1.1 as example) Server populated with example data from IGs (can use US Core IG 3.1.1 as example) _
- _Activity name (verb or verb phrase) - Dynamically-generated server with search capabilities _
- _Activity description (concise paragraph) - Dynamically-generated server with search capabilities based on implementation guide JSON Capability Statement (can use US Core IG 3.1.1 as example). Make search responses match the requested patient, etc. _
- _Activity name (verb or verb phrase) - Populate Synthea data _
- \*Activity description (concise paragraph) - Ability to populate server with dynamically generated data (with Synthea, can use US Core IG 3.1.1 as example)Start with “garbage” data valid to implementation guide requirements.
- _Activity name (verb or verb phrase) - Add server create capabilities _
- _Activity description (concise paragraph) - Add server create capabilities based on implementation guide (can use US Core IG 3.1.1 as example) _
- _Activity name (verb or verb phrase) - Add other server create capabilities _
- _Activity description (concise paragraph) - Add other capabilities based on implementation guide (create, update, delete, etc.) _

## 3 Team

- Mehul Kamlesh Bhuva, Santha Kumar Bobbili, Joshua Metcalf, Poonyaporn Nanthakijjar
- Project Manager (Develops timelines, coordinates work distribution, and is the point-person for presentations and papers), Developer (Builds, Runs, and Deploys code; Provides comments in code; Provides written descriptions of code as needed), QA (Builds and Runs Tests for developers' code; Provides documents describing tests and results; Provides written descriptions of tests as needed), Jack of All Trades (Provides miscellaneous support to all other roles)

| Name                    | Primary Role        | Secondary Role (Optional) |
| ----------------------- | ------------------- | ------------------------- |
| Mehul Kamlesh Bhuva     | Project Manager     | Developer                 |
| Santha Kumar Bobbili    | Back-end Developer  | N/A                       |
| Joshua Metcalf          | Back-end Developer  | N/A                       |
| Poonyaporn Nanthakijjar | Front-end Developer | N/A                       |
