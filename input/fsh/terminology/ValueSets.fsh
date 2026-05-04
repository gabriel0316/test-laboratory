// ============================================================
// Value Sets for the AT ELGA Laboratory IG
// ============================================================

// ------------------------------------------------------------
// AT Lab Code Value Set
// Extends the EU Lab code value sets with Austrian-specific codes
// ------------------------------------------------------------
ValueSet: ATLabCodeVS
Id: at-lab-code-vs
Title: "AT ELGA Laboratory Code Value Set"
Description: """Value set for laboratory test codes used in Austrian ELGA Laboratory Reports.

Includes LOINC codes as the primary coding system (aligned with the HL7 EU Lab IG)
and allows supplementary local Austrian codes. NPU codes are also included for
compatibility with the European Lab IG."""

* ^url = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-code-vs"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// LOINC: all laboratory-domain codes (class = CHEM, HEM.OR.BLD, MICRO, etc.)
* include codes from system $loinc where CLASS in "CHEM,HEM.OR.BLD,MICRO,SERO,UA,COAG,ALLERGY,DRUG/TOX,MOLPATH,NR.STATS"

// NPU codes (included for EU Lab compatibility)
* include codes from system urn:oid:2.16.840.1.113883.2.9.6.2.5

// Austrian local laboratory codes (example - replace with actual AT code system)
* include codes from system ATLabLocalCS

// ------------------------------------------------------------
// AT Lab Practitioner Specialty Value Set
// Austrian medical specialty codes (Sonderfachbezeichnungen)
// ------------------------------------------------------------
ValueSet: ATLabPractitionerSpecialtyVS
Id: at-lab-practitioner-specialty-vs
Title: "AT ELGA Laboratory Practitioner Specialty Value Set"
Description: """Value set for Austrian medical specialties (Sonderfachbezeichnungen) relevant
to laboratory medicine. Based on the official Austrian Ärztegesetz specialties."""

* ^url = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-practitioner-specialty-vs"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// SNOMED CT: lab-related medical specialties
* $sct#394596001 "Chemical pathology"
* $sct#394916005 "Pathology"
* $sct#394915009 "General pathology"
* $sct#408454008 "Clinical microbiology"
* $sct#394580004 "Clinical genetics"
* $sct#310081000 "Haematology"
* $sct#394803006 "Clinical haematology"
* $sct#408448007 "Tropical medicine"
* $sct#394807007 "Infectious diseases"
* $sct#418112009 "Pulmonary medicine"

// AT local specialty codes
* include codes from system ATLabSpecialtyCS

// ------------------------------------------------------------
// AT Lab Specimen Type Value Set
// Specimen types used in Austrian laboratory medicine
// ------------------------------------------------------------
ValueSet: ATLabSpecimenTypeVS
Id: at-lab-specimen-type-vs
Title: "AT ELGA Laboratory Specimen Type Value Set"
Description: """Value set for specimen types used in Austrian ELGA Laboratory Reports.
Based on SNOMED CT specimen concepts."""

* ^url = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-specimen-type-vs"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// SNOMED CT: common specimen types in Austrian laboratory medicine
* include codes from system $sct where concept is-a #123038009 "Specimen"

// ------------------------------------------------------------
// AT Lab Result Interpretation Value Set
// Extends standard observation interpretation with Austrian context
// ------------------------------------------------------------
ValueSet: ATLabResultInterpretationVS
Id: at-lab-result-interpretation-vs
Title: "AT ELGA Laboratory Result Interpretation Value Set"
Description: """Value set for laboratory result interpretations used in Austrian ELGA
Laboratory Reports. Aligned with the HL7 ObservationInterpretation code system."""

* ^url = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-result-interpretation-vs"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// Standard HL7 interpretation codes
* $obsInterpretation#N   "Normal"
* $obsInterpretation#L   "Low"
* $obsInterpretation#H   "High"
* $obsInterpretation#LL  "Critical low"
* $obsInterpretation#HH  "Critical high"
* $obsInterpretation#A   "Abnormal"
* $obsInterpretation#AA  "Critical abnormal"
* $obsInterpretation#R   "Resistant"
* $obsInterpretation#S   "Susceptible"
* $obsInterpretation#I   "Intermediate"
* $obsInterpretation#POS "Positive"
* $obsInterpretation#NEG "Negative"
* $obsInterpretation#IND "Indeterminate"
* $obsInterpretation#E   "Equivocal"
* $obsInterpretation#D   "Significant change down"
* $obsInterpretation#U   "Significant change up"

// ------------------------------------------------------------
// AT Lab Report Type Value Set
// Types of laboratory reports in Austrian ELGA
// ------------------------------------------------------------
ValueSet: ATLabReportTypeVS
Id: at-lab-report-type-vs
Title: "AT ELGA Laboratory Report Type Value Set"
Description: """Value set for types of laboratory reports submitted to Austrian ELGA."""

* ^url = "https://fhir.hl7.at/elga-labor/ValueSet/at-lab-report-type-vs"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Austria"
* ^jurisdiction = urn:iso:std:iso:3166#AT "Austria"

// LOINC codes for common Austrian laboratory report types
* $loinc#11502-2  "Laboratory report"
* $loinc#26436-6  "Laboratory studies (set)"
* $loinc#58410-2  "Complete blood count panel"
* $loinc#24323-8  "Comprehensive metabolic 2000 panel"
* $loinc#58347-6  "Microbiology studies (set)"
* $loinc#51990-0  "Basic metabolic panel"
