Profile: ATELGALabDiagnosticReport
Parent: $DiagRepEuLab
Id: at-elga-lab-diagnosticreport
Title: "AT ELGA Laboratory DiagnosticReport"
Description: """DiagnosticReport profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory DiagnosticReport with Austrian-specific requirements:
- Subject SHALL reference an AT ELGA Lab Patient
- Performer SHALL reference an AT ELGA Lab Organization or Practitioner
- basedOn SHOULD reference an AT ELGA Lab ServiceRequest
- Austrian lab report identifier using GDA OID namespace"""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-diagnosticreport"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Identifier: Austrian lab report number
* identifier MS
* identifier ^short = "Austrian laboratory report identifier"
* identifier ^comment = """Use the GDA OID as the assigning system for the identifier.
The identifier SHALL be unique within the assigning organization."""

// Status
* status 1..1 MS

// Code: type of laboratory report
* code 1..1 MS
* code ^short = "Type of laboratory report (LOINC preferred)"

// Subject: AT ELGA Lab Patient
* subject 1..1 MS
* subject only Reference(ATELGALabPatient)
* subject ^short = "The Austrian patient this report concerns"

// Effective date/time
* effective[x] MS
* effective[x] ^short = "Clinically relevant time/period for the report"

// Issued: date/time the report was issued
* issued MS
* issued ^short = "DateTime the report was issued (e.g., signed off by the laboratory)"

// Performer: Austrian organization or practitioner
* performer MS
* performer only Reference(ATELGALabOrganization or ATELGALabPractitioner or ATELGALabPractitionerRole or CareTeam)
* performer ^short = "Austrian laboratory (GDA) or practitioner responsible for the report"

// Results interpreter
* resultsInterpreter MS
* resultsInterpreter only Reference(ATELGALabPractitioner or ATELGALabPractitionerRole or ATELGALabOrganization or CareTeam)
* resultsInterpreter ^short = "Practitioner who interpreted the results"

// Based on: laboratory order
* basedOn MS
* basedOn only Reference(ATELGALabServiceRequest)
* basedOn ^short = "The laboratory order (Laborauftrag) this report fulfils"

// Result observations
* result MS
* result only Reference(ATELGALabObservation)
* result ^short = "Observations that are part of this report"

// Specimen
* specimen MS
* specimen only Reference(ATELGALabSpecimen)
* specimen ^short = "Specimens used for this report"

// Presented form: PDF representation of the report (common in Austrian ELGA)
* presentedForm MS
* presentedForm ^short = "PDF or other rendered form of the laboratory report for human display"
* presentedForm ^comment = """In ELGA, a human-readable PDF representation of the
laboratory report SHOULD be provided as presentedForm to ensure readability
across all ELGA portals."""
