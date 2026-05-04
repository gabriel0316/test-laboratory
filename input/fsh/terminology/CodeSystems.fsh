// ============================================================
// Code Systems for the AT ELGA Laboratory IG
// ============================================================

// ------------------------------------------------------------
// Austrian Laboratory Local Code System
// Placeholder for national AT lab codes managed by AGES/ÖQUASTA
// ------------------------------------------------------------
CodeSystem: ATLabLocalCS
Id: at-lab-local-cs
Title: "AT ELGA Laboratory Local Code System"
Description: """Local code system for Austrian laboratory test codes not covered by LOINC or NPU.
These codes are managed by the Austrian laboratory quality assurance authority (ÖQUASTA/AGES)
and should be used only when no suitable LOINC or NPU code exists.

Note: This code system is a placeholder. Implementers should reference the current
Austrian laboratory code catalogue published by the relevant Austrian authority."""

* ^url = "https://fhir.hl7.at/elga-labor/CodeSystem/at-lab-local-cs"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #fragment
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"
* ^valueSet = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-code-vs"

// Example local codes (replace with actual AT codes)
* #AT-LAB-001 "Lokaler Laborcode (Beispiel)" "Beispiel für einen lokalen österreichischen Laborcode"

// ------------------------------------------------------------
// Austrian Laboratory Practitioner Specialty Code System
// Local specialty codes for Austrian medical practitioners
// ------------------------------------------------------------
CodeSystem: ATLabSpecialtyCS
Id: at-lab-specialty-cs
Title: "AT ELGA Laboratory Practitioner Specialty Code System"
Description: """Austrian medical specialty codes (Sonderfachbezeichnungen) relevant to
laboratory medicine, based on the Austrian Ärztegesetz (ÄrzteG 1998)."""

* ^url = "https://fhir.hl7.at/elga-labor/CodeSystem/at-lab-specialty-cs"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

* #labormedizin            "Labormedizin (Medizinische und Chemische Labordiagnostik)"
                           "Sonderfach Medizinische und Chemische Labordiagnostik"
* #mikrobiologie           "Hygiene und Mikrobiologie"
                           "Sonderfach Hygiene und Mikrobiologie"
* #pathologie              "Pathologie"
                           "Sonderfach Pathologie"
* #molekular               "Medizinische Genetik"
                           "Sonderfach Medizinische Genetik (molekulare Diagnostik)"
* #transfusion             "Blutgruppenserologie und Transfusionsmedizin"
                           "Sonderfach Blutgruppenserologie und Transfusionsmedizin"
* #pharmakologie           "Pharmakologie und Toxikologie"
                           "Sonderfach Pharmakologie und Toxikologie"
