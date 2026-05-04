// ============================================================
// Example: Austrian ELGA Laboratory Report
// Scenario: Complete blood count (Großes Blutbild) for an Austrian patient
// ============================================================

// ------------------------------------------------------------
// Example Bundle (Document)
// ------------------------------------------------------------
Instance: ExampleATELGALabBundle
InstanceOf: ATELGALabBundle
Title: "Example AT ELGA Lab Bundle — Großes Blutbild"
Description: "Example ELGA laboratory report bundle containing a complete blood count for an Austrian patient."
Usage: #example

* id = "example-at-elga-lab-bundle"
* language = #de-AT
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:1.2.40.0.34.99.9999.1.20240101.001"
* type = #document
* timestamp = "2024-10-15T09:30:00+02:00"

// Composition entry (first entry MUST be Composition)
* entry[0].fullUrl = "urn:uuid:comp-001"
* entry[0].resource = ExampleATELGALabComposition

// DiagnosticReport entry
* entry[1].fullUrl = "urn:uuid:dr-001"
* entry[1].resource = ExampleATELGALabDiagnosticReport

// Patient entry
* entry[2].fullUrl = "urn:uuid:pat-001"
* entry[2].resource = ExampleATELGALabPatient

// Organization entry (laboratory)
* entry[3].fullUrl = "urn:uuid:org-001"
* entry[3].resource = ExampleATELGALabOrganization

// Practitioner entry (ordering physician)
* entry[4].fullUrl = "urn:uuid:pract-001"
* entry[4].resource = ExampleATELGALabPractitioner

// ServiceRequest entry
* entry[5].fullUrl = "urn:uuid:sr-001"
* entry[5].resource = ExampleATELGALabServiceRequest

// Specimen entry
* entry[6].fullUrl = "urn:uuid:spec-001"
* entry[6].resource = ExampleATELGALabSpecimen

// Observations
* entry[7].fullUrl = "urn:uuid:obs-leuko"
* entry[7].resource = ExampleObsLeukocytes
* entry[8].fullUrl = "urn:uuid:obs-ery"
* entry[8].resource = ExampleObsErythrocytes
* entry[9].fullUrl = "urn:uuid:obs-hgb"
* entry[9].resource = ExampleObsHemoglobin
* entry[10].fullUrl = "urn:uuid:obs-hkt"
* entry[10].resource = ExampleObsHematocrit
* entry[11].fullUrl = "urn:uuid:obs-thrombo"
* entry[11].resource = ExampleObsThrombocytes

// ------------------------------------------------------------
// Example Composition
// ------------------------------------------------------------
Instance: ExampleATELGALabComposition
InstanceOf: ATELGALabComposition
Title: "Example AT ELGA Lab Composition"
Description: "Example Composition for an Austrian ELGA complete blood count laboratory report."
Usage: #inline

* id = "comp-001"
* language = #de-AT
* status = #final
* type = $loinc#11502-2 "Laboratory report"
* title = "Laboratoriumsbefund — Großes Blutbild"
* date = "2024-10-15T09:30:00+02:00"
* subject = Reference(ExampleATELGALabPatient)
* author[0] = Reference(ExampleATELGALabOrganization)
* custodian = Reference(ExampleATELGALabOrganization)
* extension[+].url = "http://hl7.eu/fhir/laboratory/StructureDefinition/composition-diagnosticReportReference"
* extension[=].valueReference = Reference(ExampleATELGALabDiagnosticReport)

* section[+].title = "Hämatologie"
* section[=].code = $loinc#18723-7 "Hematology studies (set)"
* section[=].entry[+] = Reference(ExampleATELGALabDiagnosticReport)
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Hämatologische Laborergebnisse — Großes Blutbild</p></div>"

// ------------------------------------------------------------
// Example DiagnosticReport
// ------------------------------------------------------------
Instance: ExampleATELGALabDiagnosticReport
InstanceOf: ATELGALabDiagnosticReport
Title: "Example AT ELGA Lab DiagnosticReport"
Description: "Example DiagnosticReport for a complete blood count in Austrian ELGA."
Usage: #inline

* id = "dr-001"
* language = #de-AT
* status = #final
* category[0] = $loinc#26436-6 "Laboratory studies (set)"
* code = $loinc#58410-2 "Complete blood count (hemogram) panel - Blood by Automated count"
* code.text = "Großes Blutbild"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* issued = "2024-10-15T09:25:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* specimen[0] = Reference(ExampleATELGALabSpecimen)
* result[0] = Reference(ExampleObsLeukocytes)
* result[1] = Reference(ExampleObsErythrocytes)
* result[2] = Reference(ExampleObsHemoglobin)
* result[3] = Reference(ExampleObsHematocrit)
* result[4] = Reference(ExampleObsThrombocytes)
* basedOn[0] = Reference(ExampleATELGALabServiceRequest)
* conclusion = "Normales großes Blutbild. Keine pathologischen Befunde."
* extension[DiagnosticReportCompositionR5].url = $DiagRepCompR5
* extension[DiagnosticReportCompositionR5].valueReference = Reference(ExampleATELGALabComposition)

// ------------------------------------------------------------
// Example Patient (Max Mustermann)
// ------------------------------------------------------------
Instance: ExampleATELGALabPatient
InstanceOf: ATELGALabPatient
Title: "Example AT ELGA Lab Patient — Max Mustermann"
Description: "Example Austrian patient with SVNR identifier for an ELGA laboratory report."
Usage: #inline

* id = "pat-001"
* language = #de-AT

// Social security number (SVNR)
* identifier[socialSecurityNumber].type = $v2-0203#SS "Social Security Number"
* identifier[socialSecurityNumber].system = $OidSVNR
* identifier[socialSecurityNumber].value = "1234240195"
* identifier[socialSecurityNumber].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger"

// Local patient identifier
* identifier[localPatientId].type = $v2-0203#PI "Patient internal identifier"
* identifier[localPatientId].system = "urn:oid:1.2.40.0.34.99.9999.2"
* identifier[localPatientId].value = "PAT-2024-00042"

* active = true
* name[0].family = "Mustermann"
* name[0].given[0] = "Max"
* name[0].prefix[0] = "Ing."
* gender = #male
* birthDate = "1995-01-24"

* address[0].use = #home
* address[0].line[0] = "Musterstraße 1"
* address[0].postalCode = "1010"
* address[0].city = "Wien"
* address[0].country = "AT"

// ------------------------------------------------------------
// Example Organization (Musterlabor GmbH)
// ------------------------------------------------------------
Instance: ExampleATELGALabOrganization
InstanceOf: ATELGALabOrganization
Title: "Example AT ELGA Lab Organization — Musterlabor GmbH"
Description: "Example Austrian laboratory organization with GDA OID identifier."
Usage: #inline

* id = "org-001"
* language = #de-AT

* active = true
* identifier[GDA-OID].system = "urn:ietf:rfc:3986"
* identifier[GDA-OID].value = "urn:oid:1.2.40.0.34.99.9999"

* name = "Musterlabor GmbH"
* type[0] = $sct#708196004 "Private pathology laboratory"

* telecom[0].system = #phone
* telecom[0].value = "+43 1 12345678"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "labor@musterlabor.at"
* telecom[1].use = #work

* address[0].use = #work
* address[0].line[0] = "Laborstraße 5"
* address[0].postalCode = "1090"
* address[0].city = "Wien"
* address[0].country = "AT"

// ------------------------------------------------------------
// Example Practitioner (Dr. Maria Musterarzt)
// ------------------------------------------------------------
Instance: ExampleATELGALabPractitioner
InstanceOf: ATELGALabPractitioner
Title: "Example AT ELGA Lab Practitioner — Dr. Maria Musterarzt"
Description: "Example Austrian practitioner (ordering physician) with VPNR identifier."
Usage: #inline

* id = "pract-001"
* language = #de-AT
* active = true

* identifier[VPNR].system = $OidVPNR
* identifier[VPNR].value = "1234567"
* identifier[VPNR].assigner.display = "Dachverband der österreichischen Sozialversicherungsträger"

* name[0].family = "Musterarzt"
* name[0].given[0] = "Maria"
* name[0].prefix[0] = "Dr."
* gender = #female

* qualification[0].code = $sct#394814009 "General practice"
* qualification[0].code.text = "Allgemeinmedizin"

// ------------------------------------------------------------
// Example ServiceRequest (Laboratory Order)
// ------------------------------------------------------------
Instance: ExampleATELGALabServiceRequest
InstanceOf: ATELGALabServiceRequest
Title: "Example AT ELGA Lab ServiceRequest — Großes Blutbild Order"
Description: "Example laboratory order (Laborauftrag) for a complete blood count."
Usage: #inline

* id = "sr-001"
* language = #de-AT
* status = #completed
* intent = #order

* identifier[0].system = "urn:oid:1.2.40.0.34.99.9999.3"
* identifier[0].value = "AUF-2024-10-15-001"

* code = $loinc#58410-2 "Complete blood count (hemogram) panel - Blood by Automated count"
* code.text = "Großes Blutbild"

* subject = Reference(ExampleATELGALabPatient)
* requester = Reference(ExampleATELGALabPractitioner)
* performer[0] = Reference(ExampleATELGALabOrganization)
* authoredOn = "2024-10-15T07:00:00+02:00"
* specimen[0] = Reference(ExampleATELGALabSpecimen)
* note[0].text = "Nüchternblut. Bitte Differentialblutbild inklusive."

// ------------------------------------------------------------
// Example Specimen (EDTA Venous Blood)
// ------------------------------------------------------------
Instance: ExampleATELGALabSpecimen
InstanceOf: ATELGALabSpecimen
Title: "Example AT ELGA Lab Specimen — EDTA Venous Blood"
Description: "Example EDTA venous blood specimen for a complete blood count."
Usage: #inline

* id = "spec-001"
* language = #de-AT
* status = #available

* accessionIdentifier.system = "urn:oid:1.2.40.0.34.99.9999.5"
* accessionIdentifier.value = "PROB-20241015-001"

* type = $sct#445295009 "Blood specimen obtained by venipuncture"
* type.text = "Venöses EDTA-Vollblut"

* subject = Reference(ExampleATELGALabPatient)
* receivedTime = "2024-10-15T07:55:00+02:00"
* request[0] = Reference(ExampleATELGALabServiceRequest)

* collection.collectedDateTime = "2024-10-15T07:45:00+02:00"
* collection.method = $sct#28520004 "Venipuncture for blood test"
* collection.bodySite = $sct#368209003 "Right arm"

* container[0].type = $sct#702120003 "Blood collection Luer adaptor"
* container[0].type.text = "EDTA-Röhrchen (Lila Kappe)"

// ------------------------------------------------------------
// Example Observations (CBC / Großes Blutbild)
// ------------------------------------------------------------

Instance: ExampleObsLeukocytes
InstanceOf: ATELGALabObservation
Title: "Example Observation — Leukocytes"
Description: "Example observation for leukocyte count in a complete blood count."
Usage: #inline

* id = "obs-leuko"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#26464-8 "Leukocytes [#/volume] in Blood"
* code.text = "Leukozyten"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* valueQuantity.value = 6.8
* valueQuantity.unit = "10*9/L"
* valueQuantity.system = $ucum
* valueQuantity.code = #10*9/L
* specimen = Reference(ExampleATELGALabSpecimen)
* interpretation[0] = $obsInterpretation#N "Normal"
* referenceRange[0].low.value = 4.0
* referenceRange[0].low.unit = "10*9/L"
* referenceRange[0].low.system = $ucum
* referenceRange[0].low.code = #10*9/L
* referenceRange[0].high.value = 10.5
* referenceRange[0].high.unit = "10*9/L"
* referenceRange[0].high.system = $ucum
* referenceRange[0].high.code = #10*9/L
* referenceRange[0].text = "4,0 – 10,5 × 10⁹/L"

Instance: ExampleObsErythrocytes
InstanceOf: ATELGALabObservation
Title: "Example Observation — Erythrocytes"
Description: "Example observation for erythrocyte count."
Usage: #inline

* id = "obs-ery"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#26453-1 "Erythrocytes [#/volume] in Blood"
* code.text = "Erythrozyten"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* valueQuantity.value = 4.9
* valueQuantity.unit = "10*12/L"
* valueQuantity.system = $ucum
* valueQuantity.code = #10*12/L
* specimen = Reference(ExampleATELGALabSpecimen)
* interpretation[0] = $obsInterpretation#N "Normal"
* referenceRange[0].low.value = 4.3
* referenceRange[0].low.unit = "10*12/L"
* referenceRange[0].low.system = $ucum
* referenceRange[0].low.code = #10*12/L
* referenceRange[0].high.value = 5.8
* referenceRange[0].high.unit = "10*12/L"
* referenceRange[0].high.system = $ucum
* referenceRange[0].high.code = #10*12/L

Instance: ExampleObsHemoglobin
InstanceOf: ATELGALabObservation
Title: "Example Observation — Hemoglobin"
Description: "Example observation for hemoglobin concentration."
Usage: #inline

* id = "obs-hgb"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#718-7 "Hemoglobin [Mass/volume] in Blood"
* code.text = "Hämoglobin"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* valueQuantity.value = 14.8
* valueQuantity.unit = "g/dL"
* valueQuantity.system = $ucum
* valueQuantity.code = #g/dL
* specimen = Reference(ExampleATELGALabSpecimen)
* interpretation[0] = $obsInterpretation#N "Normal"
* referenceRange[0].low.value = 13.5
* referenceRange[0].low.unit = "g/dL"
* referenceRange[0].low.system = $ucum
* referenceRange[0].low.code = #g/dL
* referenceRange[0].high.value = 17.5
* referenceRange[0].high.unit = "g/dL"
* referenceRange[0].high.system = $ucum
* referenceRange[0].high.code = #g/dL
* referenceRange[0].text = "13,5 – 17,5 g/dL (Männer)"

Instance: ExampleObsHematocrit
InstanceOf: ATELGALabObservation
Title: "Example Observation — Hematocrit"
Description: "Example observation for hematocrit."
Usage: #inline

* id = "obs-hkt"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#20570-8 "Hematocrit [Volume Fraction] of Blood"
* code.text = "Hämatokrit"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* valueQuantity.value = 44.2
* valueQuantity.unit = "%"
* valueQuantity.system = $ucum
* valueQuantity.code = #%
* specimen = Reference(ExampleATELGALabSpecimen)
* interpretation[0] = $obsInterpretation#N "Normal"
* referenceRange[0].low.value = 40.0
* referenceRange[0].low.unit = "%"
* referenceRange[0].low.system = $ucum
* referenceRange[0].low.code = #%
* referenceRange[0].high.value = 52.0
* referenceRange[0].high.unit = "%"
* referenceRange[0].high.system = $ucum
* referenceRange[0].high.code = #%

Instance: ExampleObsThrombocytes
InstanceOf: ATELGALabObservation
Title: "Example Observation — Thrombocytes (Platelets)"
Description: "Example observation for platelet count."
Usage: #inline

* id = "obs-thrombo"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code = $loinc#777-3 "Platelets [#/volume] in Blood by Automated count"
* code.text = "Thrombozyten"
* subject = Reference(ExampleATELGALabPatient)
* effectiveDateTime = "2024-10-15T07:45:00+02:00"
* performer[0] = Reference(ExampleATELGALabOrganization)
* valueQuantity.value = 285
* valueQuantity.unit = "10*9/L"
* valueQuantity.system = $ucum
* valueQuantity.code = #10*9/L
* specimen = Reference(ExampleATELGALabSpecimen)
* interpretation[0] = $obsInterpretation#N "Normal"
* referenceRange[0].low.value = 150
* referenceRange[0].low.unit = "10*9/L"
* referenceRange[0].low.system = $ucum
* referenceRange[0].low.code = #10*9/L
* referenceRange[0].high.value = 400
* referenceRange[0].high.unit = "10*9/L"
* referenceRange[0].high.system = $ucum
* referenceRange[0].high.code = #10*9/L
* referenceRange[0].text = "150 – 400 × 10⁹/L"
