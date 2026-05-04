# Change Log

## Version 0.1.0 (CI Build — Initial Draft)

**Release Date:** 2024  
**Status:** Draft

### Initial content

- Created IG scaffold based on HL7 EU Laboratory IG v0.1.1
- Defined 10 core FHIR profiles:
  - `ATELGALabBundle` — document bundle profile
  - `ATELGALabComposition` — clinical document header
  - `ATELGALabDiagnosticReport` — structured results container
  - `ATELGALabObservation` — individual laboratory result
  - `ATELGALabPatient` — patient with Austrian identifiers (SVNR, bPK)
  - `ATELGALabPractitioner` — practitioner with GDA-OID, VPNR, vbPK
  - `ATELGALabPractitionerRole` — practitioner role
  - `ATELGALabOrganization` — laboratory organization (GDA-OID, KANR, VPNR)
  - `ATELGALabServiceRequest` — laboratory order
  - `ATELGALabSpecimen` — specimen with accession identifier
- Defined terminology resources:
  - 5 Value Sets (lab codes, org types, specialties, specimen types, interpretations)
  - 3 Code Systems (local lab codes, org types, specialties)
- Added complete blood count (Großes Blutbild) example instances
- Added Implementation Guidance page

### Known issues and planned changes

- Terminology bindings will be tightened in a future version once the Austrian Terminology Server publishes the lab code value sets
- Microbiology-specific profiles (susceptibility testing, culture results) are planned for a future version
- Pathology sub-domain profiles are out of scope for this version
- The `ATLabLocalCS` code system is a placeholder; actual Austrian laboratory codes will be sourced from ÖQUASTA/AGES
- Package IDs for dependencies (`hl7.fhir.eu.laboratory`, `hl7.fhir.at.core`) should be verified against the FHIR package registry before building

---

## Planned: Version 0.2.0

- Microbiology report profiles (Antibiogramm)
- Allergy and immunology sub-domain profiles  
- Tightened terminology bindings (Austrian Terminology Server integration)
- ELGA XDS metadata mapping guidance
- Additional worked examples (Urinstatus, Gerinnung, Mikrobiologie)
