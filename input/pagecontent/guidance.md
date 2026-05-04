# Implementation Guidance

This page provides practical guidance for implementing the AT ELGA Laboratory Report IG.

---

## 1. Document Structure

An ELGA laboratory report is a FHIR **document Bundle** containing exactly one Composition and one DiagnosticReport, plus all referenced resources.

```
Bundle (ATELGALabBundle)
├── Composition (ATELGALabComposition)       ← document header, sections
├── DiagnosticReport (ATELGALabDiagnosticReport) ← results container
├── Patient (ATELGALabPatient)
├── Organization (ATELGALabOrganization)     ← performing laboratory
├── Practitioner / PractitionerRole          ← ordering physician, signing pathologist
├── ServiceRequest (ATELGALabServiceRequest) ← laboratory order
├── Specimen (ATELGALabSpecimen)
└── Observation(s) (ATELGALabObservation)    ← individual results
```

The Bundle is the unit of exchange to and from the ELGA infrastructure.

---

## 2. Patient Identification

Austrian patients SHOULD be identified by at least one of the following:

| Identifier | System OID | When to use |
|-----------|-----------|-------------|
| SVNR (Sozialversicherungsnummer) | `urn:oid:1.2.40.0.10.1.4.3.1` | Always preferred; uniquely identifies the patient in the Austrian social insurance system |
| bPK (bereichsspezifisches Personenkennzeichen) | `urn:oid:1.2.40.0.10.2.1.1.149` | When ELGA bPK-GH is available (health sector bPK) |
| Lokale Patientennummer | GDA-specific OID URI | Always include local ID alongside national identifiers |

**SVNR format:** 10 digits — 3-digit sequence number + 6-digit birthdate (DDMMYY) + 1 check digit.

**Example:**
```json
{
  "identifier": [
    {
      "type": { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/v2-0203", "code": "SS" }] },
      "system": "urn:oid:1.2.40.0.10.1.4.3.1",
      "value": "1234240195",
      "assigner": { "display": "Dachverband der österreichischen Sozialversicherungsträger" }
    }
  ]
}
```

---

## 3. Organization (GDA) Identification

Every laboratory MUST be identified by its **GDA-OID** — the Object Identifier assigned by ELGA GmbH or the registering authority.

| Identifier | System | Note |
|-----------|--------|------|
| GDA-OID | `urn:ietf:rfc:3986` | Value is a URN OID, e.g., `urn:oid:1.2.40.0.34.99.x.y.z` |
| KANR (Krankenanstaltennummer) | `urn:oid:1.2.40.0.34.4.10` | Hospital labs only |
| VPNR (Vertragspartnernummer) | `urn:oid:1.2.40.0.10.1.4.3.2` | Contracted labs |

---

## 4. Laboratory Test Codes

Test codes SHALL be provided using **LOINC** as the primary coding system for interoperability with the EU Lab IG and MyHealth@EU.

Additional local codes MAY be provided as supplementary codings:

```json
{
  "code": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "718-7",
        "display": "Hemoglobin [Mass/volume] in Blood"
      },
      {
        "system": "https://fhir.hl7.at/elga-labor/CodeSystem/at-lab-local-cs",
        "code": "AT-LAB-001",
        "display": "Hämoglobin (lokal)"
      }
    ],
    "text": "Hämoglobin"
  }
}
```

---

## 5. Units of Measure

All quantitative results SHALL use **UCUM** codes for units. Common Austrian laboratory units:

| Unit | UCUM Code | Example |
|------|-----------|---------|
| g/dL | `g/dL` | Hemoglobin |
| 10⁹/L | `10*9/L` | Leukocytes, Thrombocytes |
| 10¹²/L | `10*12/L` | Erythrocytes |
| % | `%` | Hematocrit |
| µmol/L | `umol/L` | Bilirubin |
| U/L | `U/L` | Enzymes (ALT, AST, GGT) |
| mg/dL | `mg/dL` | Glucose, Creatinine |
| mmol/L | `mmol/L` | Electrolytes |

---

## 6. Result Status

The `status` element on `Observation` SHALL reflect the lifecycle of the result:

| Status | German | When |
|--------|--------|------|
| `preliminary` | Vorläufig | Result available but not yet verified |
| `final` | Endgültig | Result verified and signed off |
| `corrected` | Korrigiert | Previously final result has been corrected |
| `cancelled` | Storniert | Result cancelled (e.g., invalid specimen) |

In ELGA, only `final` or `corrected` results SHOULD be submitted to the ELGA infrastructure.

---

## 7. Reference Ranges

Reference ranges SHALL be provided for all quantitative results where applicable. They SHOULD be patient-context-specific (age, sex, unit), not universal.

```json
{
  "referenceRange": [
    {
      "low": { "value": 4.0, "unit": "10*9/L", "system": "http://unitsofmeasure.org", "code": "10*9/L" },
      "high": { "value": 10.5, "unit": "10*9/L", "system": "http://unitsofmeasure.org", "code": "10*9/L" },
      "appliesTo": [{ "coding": [{ "system": "http://snomed.info/sct", "code": "248153007", "display": "Male" }] }],
      "text": "4,0 – 10,5 × 10⁹/L (Männer, Erwachsene)"
    }
  ]
}
```

---

## 8. Language and Localisation

- All report text fields (titles, conclusions, notes) SHOULD use **Austrian German** (`de-AT`)
- Set `Bundle.language = #de-AT` and `Composition.language = #de-AT`
- The `Composition.title` SHOULD be a human-readable German title, e.g., `"Laboratoriumsbefund — Großes Blutbild"`
- Use Austrian number formatting in text: decimal comma (`,`), thousands separator (`.`)

---

## 9. Human-Readable PDF

ELGA requires that laboratory reports include a human-readable representation. Provide a PDF as:

```json
{
  "presentedForm": [
    {
      "contentType": "application/pdf",
      "language": "de-AT",
      "data": "<base64-encoded-PDF>",
      "title": "Laboratoriumsbefund"
    }
  ]
}
```

---

## 10. Terminology Servers

Austrian terminology resources are managed via the **Austrian Terminology Server** (using TerminoloGit):
- Austrian Terminology Server: contact HL7 Austria or ELGA GmbH for access details
- International codes (LOINC, SNOMED CT, UCUM): use the FHIR R4 terminology server or the EU Lab expansion parameters

---

## 11. Conformance Checklist

Before submitting an ELGA laboratory report:

- [ ] Bundle has exactly one Composition and one DiagnosticReport
- [ ] Patient has at least one Austrian identifier (SVNR preferred)
- [ ] Organization has a GDA-OID identifier
- [ ] All Observations have `status = #final` (or `#corrected`)
- [ ] All quantitative values use UCUM codes
- [ ] All test codes use LOINC (primary) 
- [ ] A PDF representation is included in `DiagnosticReport.presentedForm`
- [ ] Bundle language is set to `de-AT`
- [ ] Bundle identifier uses the laboratory's GDA OID namespace
