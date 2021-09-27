// playing with possibility of a dedicated biomarker profile with the intent of creating a many to 1 FHIR mapping depending on the type of test.

Profile:        BiomarkerTest
Parent:         USCoreObservationLab
Id:             mcode-biomarker-test
Title:          "Biomarker Test"
Description:    "The result of a tumor marker test. Tumor marker tests are generally used to guide cancer treatment decisions and monitor treatment, as well as to predict the chance of recovery and cancer recurrence."
* subject 1..1
* code from TumorMarkerTestVS (required)
// * code obeys tumor-marker-test-code-invariant
* subject only Reference(CancerPatient)
* effective[x] only dateTime or Period
* value[x] only Quantity or Ratio or string or CodeableConcept
// Already MS in US Core Obs Lab: status, category, code, subject, effective[x], value[x], dataAbsentReason
* specimen MS

/* 
Mapping:  USCorePatientToArgonaut
Source:   USCorePatient
Target:   "http://unknown.org/Argonaut-DQ-DSTU2"
Title:    "Argonaut DSTU2"
Id:       argonaut-dq-dstu2
* -> "Patient"
* extension[USCoreRaceExtension] -> "Patient.extension[http://fhir.org/guides/argonaut/StructureDefinition/argo-race]"
* extension[USCoreEthnicityExtension] -> "Patient.extension[http://fhir.org/guides/argonaut/StructureDefinition/argo-ethnicity]"
* extension[USCoreBirthSexExtension] -> "Patient.extension[http://fhir.org/guides/argonaut/StructureDefinition/argo-birthsex]"
* identifier -> "Patient.identifier"
* identifier.system -> "Patient.identifier.system"
* identifier.value -> "Patient.identifier.value"

*/
