Profile: ATELGALabPractitioner
Parent: $PractitionerEuLab
Id: at-elga-lab-practitioner
Title: "AT ELGA Laboratory Practitioner"
Description: """Practitioner profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory Practitioner profile with Austrian-specific identifiers
as defined in the HL7 Austria Core R4 profiles:

**Austrian Identifiers:**
- GDA-OID — OID identifying the practitioner as a Gesundheitsdiensteanbieter
- VPNR (Vertragspartnernummer) — contract partner number assigned by health insurance carriers
- vbPK (Verschlüsseltes bereichsspezifisches Personenkennzeichen) — encrypted sector-specific identifier

**Extensions:**
- Administrative gender addition (for official Austrian gender categories)"""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-practitioner"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// -------------------------------------------------------
// Austrian identifier slices (aligned with AT Core Practitioner)
// Sliced by value:system
// -------------------------------------------------------
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Austrian practitioner identifier slices"

* identifier contains
    GDA-OID 0..1 MS and
    VPNR    0..* MS and
    vbPK    0..1 MS

// --- GDA-OID ---
* identifier[GDA-OID] ^short = "OID identifying this practitioner as a GDA"
* identifier[GDA-OID] ^definition = """An OID (Object Identifier) assigned to the practitioner
as a Gesundheitsdiensteanbieter (GDA) in Austria. Expressed as a URI (e.g., urn:oid:1.2.40.0.34...)."""
* identifier[GDA-OID].system 1..1 MS
* identifier[GDA-OID].system = "urn:ietf:rfc:3986" (exactly)
* identifier[GDA-OID].system ^short = "System for OID-based identifiers"
* identifier[GDA-OID].value 1..1 MS
* identifier[GDA-OID].value ^short = "OID URI (e.g., urn:oid:1.2.40.0.34.99.x.y.z)"
* identifier[GDA-OID].assigner MS
* identifier[GDA-OID].assigner ^short = "ELGA GmbH or registering authority"

// --- VPNR (Vertragspartnernummer) ---
* identifier[VPNR] ^short = "Vertragspartnernummer (VPNR)"
* identifier[VPNR] ^definition = """The VPNR assigned by Austrian social insurance carriers
to contracted healthcare providers."""
* identifier[VPNR].system 1..1 MS
* identifier[VPNR].system = $OidVPNR (exactly)
* identifier[VPNR].system ^short = "OID for the VPNR system"
* identifier[VPNR].value 1..1 MS
* identifier[VPNR].value ^short = "VPNR value"

// --- vbPK ---
* identifier[vbPK] ^short = "Encrypted sector-specific personal identifier (vbPK)"
* identifier[vbPK] ^definition = """The encrypted sector-specific personal identifier (vbPK)
for the practitioner."""
* identifier[vbPK].system 1..1 MS
* identifier[vbPK].system = $OidVbPK (exactly)
* identifier[vbPK].system ^short = "OID for the vbPK system"
* identifier[vbPK].value 1..1 MS
* identifier[vbPK].value ^short = "vbPK value"

// -------------------------------------------------------
// Core elements (must-support)
// -------------------------------------------------------
* name 1..* MS
* name ^short = "Practitioner name"
* name.family MS
* name.given MS
* name.prefix MS
* name.prefix ^short = "Academic title or professional title (e.g., 'Dr.')"

* gender MS
// AT Core: administrative gender addition extension
* gender.extension contains $ATExtGenderAdd named genderAddition 0..1 MS
* gender.extension[genderAddition] ^short = "Austrian administrative gender addition"

* address MS
* address only $ATCoreAddress
* address ^short = "Practitioner address (AT Core Address profile)"

* qualification MS
* qualification ^short = "Qualification/specialisation of the practitioner"
* qualification ^comment = """For Austrian practitioners, the qualification SHOULD include
the medical specialty (Sonderfach) using Austrian qualification codes."""
