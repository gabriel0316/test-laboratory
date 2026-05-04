Profile: ATELGALabServiceRequest
Parent: $ServiceReqEuLab
Id: at-elga-lab-servicerequest
Title: "AT ELGA Laboratory ServiceRequest (Order)"
Description: """ServiceRequest profile for Austrian ELGA Laboratory Orders (Laboraufträge).

Extends the HL7 Europe Laboratory Order ServiceRequest with Austrian-specific requirements:
- subject SHALL reference an AT ELGA Lab Patient
- requester SHALL reference an AT ELGA Lab Practitioner, PractitionerRole, or Organization
- performer SHALL reference an AT ELGA Lab Organization (the laboratory)
- Austrian order identifier using the ordering GDA's OID namespace

This profile represents the laboratory order placed by an ordering physician (Einsender)
to a performing laboratory (auftragnehmende Labor)."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-servicerequest"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Identifier: Austrian lab order number
* identifier MS
* identifier ^short = "Laboratory order identifier (Laborauftragsnummer)"
* identifier ^comment = """The identifier SHALL use the ordering GDA's OID as the system.
Include both the ordering system's number and any accession number assigned by the laboratory."""

// Status
* status 1..1 MS
* status ^short = "active | completed | entered-in-error"

// Intent
* intent 1..1 MS
* intent ^short = "order (always 'order' for laboratory requests)"

// Code: what is ordered
* code MS
* code from ATLabCodeVS (preferred)
* code ^short = "Laboratory test or panel ordered (LOINC preferred)"

// Subject: AT ELGA Lab Patient
* subject 1..1 MS
* subject only Reference(ATELGALabPatient)
* subject ^short = "The Austrian patient for whom the laboratory order is placed"

// Authored on: date of the order
* authoredOn MS
* authoredOn ^short = "Date/time the laboratory order was placed"

// Requester: ordering physician (Einsender)
* requester MS
* requester only Reference(ATELGALabPractitioner or ATELGALabPractitionerRole or ATELGALabOrganization or Patient or RelatedPerson or Device)
* requester ^short = "The ordering physician (Einsender) or GDA placing the order"

// Performer: the laboratory (Auftragnehmer)
* performer MS
* performer only Reference(ATELGALabOrganization or ATELGALabPractitioner or ATELGALabPractitionerRole or CareTeam or HealthcareService or Patient or Device or RelatedPerson)
* performer ^short = "The Austrian laboratory (GDA) performing the tests"

// Specimen: if already known at order time
* specimen MS
* specimen only Reference(ATELGALabSpecimen)
* specimen ^short = "Specimen(s) included with the order"

// Note: clinical information / reason for ordering
* note MS
* note ^short = "Clinical information provided to the laboratory (Klinische Angaben)"

// Reason: clinical indication
* reasonCode MS
* reasonCode ^short = "Clinical reason / indication for the laboratory order"
