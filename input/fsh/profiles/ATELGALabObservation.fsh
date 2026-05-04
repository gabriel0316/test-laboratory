Profile: ATELGALabObservation
Parent: $ObsEuLab
Id: at-elga-lab-observation
Title: "AT ELGA Laboratory Observation"
Description: """Observation profile for Austrian ELGA Laboratory Results.

Extends the HL7 Europe Laboratory Observation with Austrian-specific requirements:
- Subject SHALL reference an AT ELGA Lab Patient
- Performer SHALL reference an AT ELGA Lab Organization or Practitioner
- Specimen SHOULD reference an AT ELGA Lab Specimen
- Binding to Austrian laboratory code value set (extends EU Lab codes with Austrian-specific codes)

This profile covers in-vitro diagnostic laboratory test results including clinical
biochemistry, haematology, microbiology, and immunology."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-observation"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Status
* status 1..1 MS
* status ^short = "final | preliminary | registered | cancelled | entered-in-error"
* status ^comment = "For ELGA, results SHALL be in 'final' status when included in the laboratory report bundle."

// Category: laboratory (inherited from EU Lab, re-stated for clarity)
* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open

// Code: test code (LOINC preferred, Austrian codes as supplement)
* code 1..1 MS
* code from ATLabCodeVS (preferred)
* code ^short = "Laboratory test code (LOINC preferred)"
* code ^comment = """LOINC codes are preferred for interoperability with MyHealth@EU.
Austrian-specific local codes MAY be provided as additional codings."""

// Subject: AT ELGA Lab Patient
* subject 1..1 MS
* subject only Reference(ATELGALabPatient)
* subject ^short = "The Austrian patient this observation is about"

// Effective date/time
* effective[x] 1..1 MS
* effective[x] ^short = "Date/time the specimen was collected or the observation was made"

// Performer
* performer 1..* MS
* performer only Reference(ATELGALabPractitioner or ATELGALabPractitionerRole or ATELGALabOrganization or CareTeam or RelatedPerson or Patient)
* performer ^short = "Austrian laboratory or practitioner responsible for this result"

// Value: the result
* value[x] MS
* value[x] ^short = "Laboratory result value"

// Interpretation: Austrian binding (extensible, allows local codes)
* interpretation MS
* interpretation ^short = "High/Low/Normal interpretation"
* interpretation ^comment = "Austrian laboratories SHALL use the HL7 observation interpretation codes."

// Reference range
* referenceRange MS
* referenceRange ^short = "Reference range for the result"

// Specimen
* specimen MS
* specimen only Reference(ATELGALabSpecimen)
* specimen ^short = "Specimen used for this observation"

// Has member: panel results
* hasMember MS
* hasMember only Reference(ATELGALabObservation or QuestionnaireResponse or MolecularSequence)
* hasMember ^short = "Child observation (panel result)"

// Data absent reason
* dataAbsentReason MS
* dataAbsentReason ^short = "Why the result is absent (e.g., specimen unsatisfactory)"

// Note: free-text comment on the result
* note MS
* note ^short = "Laboratory comment on the result (Befundbeschreibung)"
