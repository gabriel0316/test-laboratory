Profile: ATELGALabBundle
Parent: $BundleEuLab
Id: at-elga-lab-bundle
Title: "AT ELGA Laboratory Report Bundle"
Description: """FHIR Bundle for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory Report Bundle with Austrian-specific requirements:
- Mandatory Austrian business identifier using the GDA (Gesundheitsdiensteanbieter) OID namespace
- Entries referencing Austrian-profiled resources (AT ELGA Lab profiles)

This bundle represents a legally signable, self-contained laboratory report document."""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-bundle"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// The bundle SHALL carry a globally unique identifier that can be used as a persistent
// reference to this specific version of the laboratory report.
* identifier 1..1 MS
* identifier ^short = "Persistent identifier for this laboratory report bundle"
* identifier ^definition = """A persistent identifier assigned by the originating system.
SHALL use the GDA OID as the assigning authority (identifier.system = 'urn:ietf:rfc:3986'
with an OID URI, or another stable Austrian namespace)."""
* identifier.system 1..1 MS
* identifier.value 1..1 MS

* timestamp 1..1 MS
* timestamp ^short = "Date/time the bundle was assembled"

// Restrict bundle type to document (inherited from EU Lab bundle, re-stated for clarity)
* type = #document (exactly)
* type MS
