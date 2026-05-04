Profile: ATELGALabOrganization
Parent: $ATCoreOrganization
Id: at-elga-lab-organization
Title: "AT ELGA Laboratory Organization"
Description: """Organization profile for Austrian ELGA Laboratory Reports.

Derives from the HL7 Austria Core Organization profile and adds laboratory-specific requirements:
- Organization type SHALL include a laboratory type code
- GDA-OID identifier is strongly recommended
- Austrian hospital number (Krankenanstaltennummer / KANR) or VPNR for contracted labs

This profile covers both hospital laboratories (Krankenhauslabors) and
independent medical laboratories (Selbstständige Ambulatorien / Labore)."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-organization"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// -------------------------------------------------------
// Inherited AT Core Organization identifier slices
// (GDA-OID, VPNR, VKZ, KANR) — re-stated for clarity
// -------------------------------------------------------
* identifier MS
* identifier ^short = "Austrian organization identifiers"

// GDA-OID is the primary identifier for ELGA-registered laboratories
* identifier[GDA-OID] MS
* identifier[GDA-OID] ^short = "ELGA GDA OID — primary identifier for Austrian laboratories"
* identifier[GDA-OID] ^comment = """Every laboratory registered with ELGA SHALL provide
its GDA OID here. The value SHALL be expressed as an OID URI
(e.g., 'urn:oid:1.2.40.0.34.99.x.y.z')."""

// KANR: for hospital laboratories
* identifier[KANR] MS
* identifier[KANR] ^short = "Krankenanstaltennummer (KANR) for hospital laboratories"

// VPNR: for contracted laboratories
* identifier[VPNR] MS
* identifier[VPNR] ^short = "Vertragspartnernummer (VPNR) for contracted labs"

// -------------------------------------------------------
// Name: required for all lab organisations
// -------------------------------------------------------
* name 1..1 MS
* name ^short = "Name of the laboratory organization"
* name ^comment = "The official registered name of the laboratory."

// -------------------------------------------------------
// Type: laboratory classification
// -------------------------------------------------------
* type MS
* type ^short = "Type of laboratory organization (e.g., hospital lab, independent lab)"

// -------------------------------------------------------
// Address: AT Core Address
// -------------------------------------------------------
* address MS
* address ^short = "Address of the laboratory"
* address ^comment = "At least one address SHOULD be provided for the laboratory."

// -------------------------------------------------------
// Telecom
// -------------------------------------------------------
* telecom MS
* telecom ^short = "Contact details of the laboratory (phone, fax, email)"
