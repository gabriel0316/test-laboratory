Profile: ATELGALabSpecimen
Parent: $SpecimenEuLab
Id: at-elga-lab-specimen
Title: "AT ELGA Laboratory Specimen"
Description: """Specimen profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory Specimen profile with Austrian-specific requirements:
- subject SHALL reference an AT ELGA Lab Patient
- Collection performed by an AT ELGA Lab Practitioner or PractitionerRole
- Accession identifier using the receiving laboratory's OID namespace

Covers all specimen types used in in-vitro diagnostic laboratory testing in Austria."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-specimen"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Accession identifier: assigned by the laboratory on receipt
* accessionIdentifier MS
* accessionIdentifier ^short = "Laboratory accession number (Probennummer)"
* accessionIdentifier ^comment = """The accession number assigned by the performing laboratory
to this specimen. The system SHALL be the laboratory's GDA OID URI."""
* accessionIdentifier.system 1..1 MS
* accessionIdentifier.system ^short = "GDA OID URI of the assigning laboratory"
* accessionIdentifier.value 1..1 MS
* accessionIdentifier.value ^short = "Accession number value"

// Status
* status MS
* status ^short = "available | unavailable | unsatisfactory | entered-in-error"

// Type: specimen type (SNOMED CT preferred)
* type MS
* type ^short = "Type of specimen (e.g., venous blood, urine)"
* type ^comment = "SNOMED CT codes SHALL be used for cross-border interoperability."

// Subject: AT ELGA Lab Patient
* subject 1..1 MS
* subject only Reference(ATELGALabPatient)
* subject ^short = "The Austrian patient from whom the specimen was collected"

// Received time: when the laboratory received the specimen
* receivedTime MS
* receivedTime ^short = "Date/time the specimen was received by the laboratory"

// Collection details
* collection MS
* collection ^short = "Specimen collection details"
* collection.collected[x] MS
* collection.collected[x] ^short = "Date/time of specimen collection"
* collection.collector MS
* collection.collector only Reference(ATELGALabPractitioner or ATELGALabPractitionerRole)
* collection.collector ^short = "Practitioner who collected the specimen"
* collection.bodySite MS
* collection.bodySite ^short = "Body site from which the specimen was collected"
* collection.method MS
* collection.method ^short = "Collection method (e.g., venipuncture)"

// Processing details
* processing MS
* processing ^short = "Processing and storage details"

// Container details
* container MS
* container ^short = "Container holding the specimen"
* container.type MS
* container.type ^short = "Container type (e.g., EDTA tube, serum tube)"

// Notes
* note MS
* note ^short = "Comments about the specimen (e.g., haemolytic, lipemic)"

// Request: the order this specimen was collected for
* request MS
* request only Reference(ATELGALabServiceRequest)
* request ^short = "The laboratory order for which this specimen was collected"
