Profile: ATELGALabComposition
Parent: $CompositionEuLab
Id: at-elga-lab-composition
Title: "AT ELGA Laboratory Report Composition"
Description: """Composition profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory Report Composition with Austrian-specific requirements:
- Subject SHALL reference an AT ELGA Lab Patient
- Author SHALL reference an AT ELGA Lab Practitioner, PractitionerRole, or Organization
- Custodian SHALL reference an AT ELGA Lab Organization (the responsible GDA)
- Austrian language requirement (de-AT preferred)

The Composition acts as the clinical document header for the laboratory report and links
to the DiagnosticReport containing the structured results."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-composition"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Language: Austrian German preferred
* language MS
* language ^short = "Language of the report (de-AT preferred for Austrian reports)"
* language ^comment = "Use 'de-AT' for Austrian German language reports."

// Title is mandatory in Austrian ELGA context
* title 1..1 MS
* title ^short = "Human-readable label (e.g., 'Laboratoriumsbefund')"

// Status
* status 1..1 MS

// Subject SHALL be an AT ELGA Lab Patient
* subject 1..1 MS
* subject only Reference(ATELGALabPatient)
* subject ^short = "The Austrian patient this laboratory report is about"

// Author: Austrian practitioner, practitioner role, or organization
* author MS
* author only Reference(ATELGALabPractitioner or ATELGALabPractitionerRole or ATELGALabOrganization or Device or RelatedPerson or Patient)
* author ^short = "Author of the laboratory report (GDA or responsible practitioner)"

// Custodian: the GDA responsible for the report
* custodian MS
* custodian only Reference(ATELGALabOrganization)
* custodian ^short = "Austrian GDA (Gesundheitsdiensteanbieter) responsible for this report"

// Date of the report
* date 1..1 MS
* date ^short = "Date the composition was created or last updated"
