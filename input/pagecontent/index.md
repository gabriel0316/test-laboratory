# HL7 Austria ELGA Laboratory Report R4 — Implementation Guide

**Version:** 0.1.0 (CI Build)
**Status:** Draft
**Realm:** Austria (AT)
**FHIR Version:** R4 (4.0.1)

---

## Overview

This FHIR R4 Implementation Guide (IG) defines the Austrian **ELGA Laboratory Report** (Laboratoriumsbefund) standard. It enables structured, interoperable exchange of in-vitro diagnostic laboratory results within the Austrian Electronic Health Record system (**ELGA — Elektronische Gesundheitsakte**) and supports cross-border exchange via **MyHealth@EU**.

The IG is derived from the **[HL7 Europe Laboratory Report IG (v0.1.1)](https://hl7.eu/fhir/laboratory/)** and aligns with the **[HL7 Austria Core R4 profiles (v2.0.0)](https://fhir.hl7.at/HL7-AT-FHIR-Core-R4/)**, combining European harmonisation with Austrian national requirements.

---

## Scope

This IG covers **in-vitro diagnostic laboratory domains** including:

| Domain | Beispiel |
|--------|---------|
| Clinical Biochemistry | Blutchemie, Elektrolyte, Enzyme |
| Haematology | Großes/Kleines Blutbild, Gerinnungsdiagnostik |
| Microbiology | Bakteriologie, Virologie, Parasitologie |
| Immunology & Serology | Antikörper, Autoimmundiagnostik |
| Toxicology | Medikamenten-Monitoring, Drogen-Screening |
| Molecular Diagnostics | PCR, genetische Untersuchungen |

> **Out of scope:** Histopathology, cytology, radiology, and other non-laboratory diagnostics.

---

## Relationship to Parent IGs

```
FHIR R4 Core
    └── HL7 EU Laboratory IG (v0.1.1)          ← European harmonisation
            └── AT ELGA Laboratory IG (this IG)  ← Austrian national profiles
                    ↑
        HL7 AT Core R4 (v2.0.0)               ← Austrian core profiles (co-applied)
```

### What this IG inherits from the EU Lab IG

- Bundle/Composition/DiagnosticReport/Observation structure for laboratory reports
- EU-harmonised value sets (LOINC, SNOMED CT, UCUM, NPU)
- MyHealth@EU cross-border interoperability constraints
- Legal signing capability via the Bundle document paradigm

### What this IG adds (Austrian-specific)

| Feature | Detail |
|---------|--------|
| Patient identifiers | SVNR (Sozialversicherungsnummer), bPK (bereichsspezifisches Personenkennzeichen) |
| Organization identifiers | GDA-OID, KANR (Krankenanstaltennummer), VPNR (Vertragspartnernummer), VKZ |
| Practitioner identifiers | GDA-OID, VPNR, vbPK |
| Address | AT Core Address profile (Straße, Hausnummer, Gemeindekennziffer) |
| Extensions | Patient religion, administrative gender addition |
| Terminology | Austrian laboratory code supplements, Austrian specialty codes |
| Language | Austrian German (de-AT) as primary language for report content |

---

## Core Profiles

### Laboratory Report Resources

| Profile | Base (EU Lab) | Purpose |
|---------|--------------|---------|
| [ATELGALabBundle](StructureDefinition-at-elga-lab-bundle.html) | Bundle-eu-lab | Document bundle for the complete lab report |
| [ATELGALabComposition](StructureDefinition-at-elga-lab-composition.html) | Composition-eu-lab | Clinical document header |
| [ATELGALabDiagnosticReport](StructureDefinition-at-elga-lab-diagnosticreport.html) | DiagnosticReport-eu-lab | Structured test results and interpretation |
| [ATELGALabObservation](StructureDefinition-at-elga-lab-observation.html) | Observation-resultslab-eu-lab | Individual laboratory test result |

### Participant Resources

| Profile | Base | Purpose |
|---------|------|---------|
| [ATELGALabPatient](StructureDefinition-at-elga-lab-patient.html) | Patient-eu-lab + AT Core | Patient with Austrian identifiers |
| [ATELGALabPractitioner](StructureDefinition-at-elga-lab-practitioner.html) | Practitioner-eu-lab + AT Core | Practitioner with Austrian identifiers |
| [ATELGALabPractitionerRole](StructureDefinition-at-elga-lab-practitionerrole.html) | PractitionerRole-eu-lab + AT Core | Practitioner in a role at an organization |
| [ATELGALabOrganization](StructureDefinition-at-elga-lab-organization.html) | AT Core Organization | Laboratory organization |

### Supporting Resources

| Profile | Base (EU Lab) | Purpose |
|---------|--------------|---------|
| [ATELGALabServiceRequest](StructureDefinition-at-elga-lab-servicerequest.html) | ServiceRequest-eu-lab | Laboratory order |
| [ATELGALabSpecimen](StructureDefinition-at-elga-lab-specimen.html) | Specimen-eu-lab | Specimen details |

---

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `hl7.fhir.eu.laboratory` | 0.1.1 | HL7 Europe Laboratory IG (parent) |
| `hl7.fhir.at.core` | 2.0.0 | HL7 Austria Core R4 profiles |
| `hl7.terminology.r4` | 6.2.0 | HL7 terminology resources |
| `hl7.fhir.uv.extensions.r4` | 5.1.0 | FHIR extensions pack |

---

## Authors and Contributors

This IG is developed and maintained by **HL7 Austria TC FHIR** in collaboration with ELGA GmbH and Austrian laboratory stakeholders.

- **Publisher:** HL7 Austria — [https://www.hl7.at](https://www.hl7.at)
- **Contact:** [office@hl7.at](mailto:office@hl7.at)

---

## Licence

Copyright © 2024+ HL7 Austria. Licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).

> LOINC® is copyright © 1995–2024 Regenstrief Institute, Inc. Used under the LOINC license.
> SNOMED CT® is copyright © 2002+ SNOMED International. Used under the SNOMED CT affiliate license.
> UCUM is copyright © 1999–2013 Regenstrief Institute, Inc. Used under the UCUM license.
