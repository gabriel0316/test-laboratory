Profile: ATELGALabPractitionerRole
Parent: $PractRoleEuLab
Id: at-elga-lab-practitionerrole
Title: "AT ELGA Laboratory PractitionerRole"
Description: """PractitionerRole profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory PractitionerRole profile and aligns with the
HL7 Austria Core PractitionerRole profile:
- practitioner SHALL reference an AT ELGA Lab Practitioner
- organization SHALL reference an AT ELGA Lab Organization
- Austrian specialty codes (Sonderfachbezeichnungen)"""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-practitionerrole"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Practitioner: must reference AT ELGA Lab Practitioner
* practitioner MS
* practitioner only Reference(ATELGALabPractitioner)
* practitioner ^short = "The Austrian practitioner in this role"

// Organization: must reference AT ELGA Lab Organization
* organization MS
* organization only Reference(ATELGALabOrganization)
* organization ^short = "The Austrian GDA organisation where this role is performed"

// Specialty: Austrian medical specialties
* specialty MS
* specialty from ATLabPractitionerSpecialtyVS (preferred)
* specialty ^short = "Austrian medical specialty (Sonderfach)"
* specialty ^comment = """Use Austrian medical specialty codes where available.
SNOMED CT codes MAY be used for cross-border interoperability."""

// Code: role type
* code MS
* code ^short = "Role of the practitioner (e.g., laboratory physician, pathologist)"

// Active
* active MS
* active ^short = "Whether this practitioner role record is in active use"

// Period
* period MS
* period ^short = "The period during which the practitioner is authorized to perform in this role"
