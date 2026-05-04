Profile: ATELGALabPatient
Parent: $PatientEuLab
Id: at-elga-lab-patient
Title: "AT ELGA Laboratory Patient"
Description: """Patient profile for Austrian ELGA Laboratory Reports.

Extends the HL7 Europe Laboratory Patient profile with Austrian-specific identifiers
and extensions as defined in the HL7 Austria Core R4 profiles:

**Austrian Identifiers:**
- Sozialversicherungsnummer (SVNR) — Austrian social security number
- Bereichsspezifisches Personenkennzeichen (bPK) — sector-specific personal identifier
- Lokale Patientennummer — local patient identifier assigned by the GDA

**Austrian Extensions (from AT Core):**
- Patient religion (PatientenReligion)
- Administrative gender addition (for official Austrian gender categories)

**Address:**
- Address SHALL use the AT Core Address profile (with street, street number, municipality code)"""

* ^url = "https://fhir.hl7.at/elga-labor/StructureDefinition/at-elga-lab-patient"
* ^status = #draft
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// -------------------------------------------------------
// Austrian identifier slices
// Sliced by identifier type code (pattern on type.coding)
// -------------------------------------------------------
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Austrian patient identifier slices"
* identifier ^short = "Patient identifiers"

* identifier contains
    socialSecurityNumber 0..1 MS and
    bPK 0..* MS and
    localPatientId 0..1 MS

// --- Social Security Number (Sozialversicherungsnummer / SVNR) ---
* identifier[socialSecurityNumber] ^short = "Austrian Social Security Number (Sozialversicherungsnummer)"
* identifier[socialSecurityNumber] ^definition = """The Austrian social security number (SVNR).
10-digit number: 3 digits sequence number + 6 digits date-of-birth (DDMMYY) + 1 check digit."""
* identifier[socialSecurityNumber].use MS
* identifier[socialSecurityNumber].type 1..1 MS
* identifier[socialSecurityNumber].type = $v2-0203#SS "Social Security Number"
* identifier[socialSecurityNumber].system 1..1 MS
* identifier[socialSecurityNumber].system = $OidSVNR (exactly)
* identifier[socialSecurityNumber].system ^short = "OID for the Austrian social security number system"
* identifier[socialSecurityNumber].value 1..1 MS
* identifier[socialSecurityNumber].value ^short = "10-digit SVNR value"
* identifier[socialSecurityNumber].assigner MS
* identifier[socialSecurityNumber].assigner ^short = "Dachverband der österreichischen Sozialversicherungsträger"

// --- bPK (Bereichsspezifisches Personenkennzeichen) ---
* identifier[bPK] ^short = "Austrian sector-specific personal identifier (bPK)"
* identifier[bPK] ^definition = """The Austrian sector-specific personal identifier (bPK) used in the
health sector (GH = Gesundheit). Managed by the Federal Ministry of the Interior."""
* identifier[bPK].type 1..1 MS
* identifier[bPK].type = $v2-0203#NI "National unique individual identifier"
* identifier[bPK].system 1..1 MS
* identifier[bPK].system = $OidBPK (exactly)
* identifier[bPK].system ^short = "OID for the bPK system"
* identifier[bPK].value 1..1 MS
* identifier[bPK].value ^short = "bPK value"
* identifier[bPK].assigner MS
* identifier[bPK].assigner ^short = "Bundesministerium für Inneres"

// --- Local patient identifier (Lokale Patientennummer) ---
* identifier[localPatientId] ^short = "Local patient identifier assigned by the GDA"
* identifier[localPatientId] ^definition = """A patient identifier assigned locally by the
Gesundheitsdiensteanbieter (GDA). The system SHALL be an OID or URI identifying the GDA."""
* identifier[localPatientId].type 1..1 MS
* identifier[localPatientId].type = $v2-0203#PI "Patient internal identifier"
* identifier[localPatientId].system 1..1 MS
* identifier[localPatientId].system ^short = "GDA-specific identifier namespace (OID URI)"
* identifier[localPatientId].value 1..1 MS
* identifier[localPatientId].value ^short = "Local patient number"

// -------------------------------------------------------
// Core demographic elements (must-support)
// -------------------------------------------------------
* name 1..* MS
* name ^short = "Patient name"
* name.family MS
* name.given MS

* birthDate 1..1 MS
* birthDate ^short = "Date of birth (required for ELGA)"

* gender 1..1 MS
* gender ^short = "Administrative gender"

// AT Core: administrative gender addition extension on gender element
* gender.extension contains $ATExtGenderAdd named genderAddition 0..1 MS
* gender.extension[genderAddition] ^short = "Austrian administrative gender addition (e.g., 'divers', 'inter')"

// -------------------------------------------------------
// Address: use AT Core Address profile
// -------------------------------------------------------
* address MS
* address ^short = "Austrian patient address (using AT Core Address profile)"

// -------------------------------------------------------
// AT Core extensions
// -------------------------------------------------------
* extension contains $ATExtReligion named religion 0..1 MS
* extension[religion] ^short = "Patient's registered religion/confession (Religionsbekenntnis)"
* extension[religion] ^comment = """In Austria, the religion/confession is often included in
patient registration data from health insurance carriers."""
