Instance: genomic-variant-somatic-single-nucleotide
InstanceOf: GenomicVariant
Description: "mCODE Example for Genomic Variant"
* status = #final "Final"
* method = LNC#LA26398-0 "Sequencing"
// value[x] has alternate codings depending on where to place the interpretation of "Positive or Negative".
// * valueCodeableConcept = SCT#10828004 "Positive (qualifier value)"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* valueCodeableConcept = LNC#LA9633-4 "Present"
* interpretation = SCT#10828004 "Positive (qualifier value)"
* component[geneStudied].valueCodeableConcept = HGNC#HGNC:11389 "STK11"
// variant type: single nucleotide variant
// https://www.ncbi.nlm.nih.gov/clinvar/variation/619728/
// https://www.genenames.org/data/gene-symbol-report/#!/hgnc_id/HGNC:8023
* component[variationCode].valueCodeableConcept = CLINVAR#619728 "NC_000019.8:g.1171707G>A"
* component[genomicDNAChange].valueCodeableConcept = HGVS#NC_000019.8:g.1171707G>A "NC_000019.8:g.1171707G>A"
* component[genomicSourceClass].valueCodeableConcept = LNC#LA6684-0 "Somatic"

/* genomic-variant-germline-deletion is an example of the
 * GenomicVariant to represent a single mutation test.
 * This example demonstrates a test for a single germline mutation, BRCA1 gene.c.185delAG, equivalent to the LOINC test https://loinc.org/21637-4/.
 */
Instance: genomic-variant-germline-deletion
InstanceOf: GenomicVariant
Description: "mCODE Example for Genomic Variant"
* status = #final "Final"
* method = LNC#LA26398-0 "Sequencing"
// value[x] has alternate codings depending on where to place the interpretation of "Positive or Negative".
* interpretation = SCT#10828004 "Positive (qualifier value)"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* valueCodeableConcept = LNC#LA9633-4 "Present"
* component[geneStudied].valueCodeableConcept = HGNC#HGNC:1100 "BRCA1" // NOTE: HGNC and HGVS codes have special characters in them so SUSHI needs to handle this.
* component[genomicDNAChange].valueCodeableConcept = HGVS#NG_005905.2:g.126148_126152del "NG_005905.2:g.126148_126152del"
* component[genomicSourceClass].valueCodeableConcept = LNC#LA6683-2 "Germline"

/* genomic-variant-fusion is an example of the
 * GenomicVariant to represent a gene fusion event.
 * This example demonstrates a test for the gene fusion ABR-BCL1.
 */
Instance: genomic-variant-fusion
InstanceOf: GenomicVariant
Description: "mCODE Example for Genomic Variant gene fusion event"
* status = #final "Final"
* method = LNC#LA26398-0 "Sequencing"
* interpretation = SCT#10828004 "Positive (qualifier value)"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* valueCodeableConcept = LNC#LA9633-4 "Present"
* component[geneStudied][0].valueCodeableConcept = HGNC#HGNC:1014 "BCR" // NOTE: HGNC and HGVS codes have special characters in them so SUSHI needs to handle this.
* component[geneStudied][1].valueCodeableConcept = HGNC#HGNC:76 "ABL1"
* component[molecularConsequence].valueCodeableConcept = SO#SO:001565 "gene_fusion"
* component[genomicDNAChange].valueCodeableConcept = HGVS#NM_005157.6(ABL1):c.1076T>G "NM_005157.6(ABL1):c.1076T>G"   // "NM_005157.6(ABL1):c.1076T>G (p.Phe359Cys)"
* component[genomicSourceClass].valueCodeableConcept = LNC#LA6684-0 "Somatic"

Instance: genomics-report-john-anyperson
InstanceOf: GenomicsReport
Description: "mCODE Example for Genomics Report"
* status = #final "Final"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* specimen = Reference(Specimen/genomic-specimen-lung)
* issued = "2019-04-01T11:45:33+11:00"
* result[GenomicVariant] = Reference(Observation/genomic-variant-somatic-single-nucleotide)
* result[GenomicRegionStudied] = Reference(genomic-region-studied-stk11)

Instance: genomic-region-studied-stk11
InstanceOf: GenomicRegionStudied
Description: "mCODE Example for Genomic Region Studied"
* status = #final "final"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* issued = "2019-04-01T11:45:33+11:00"
* component[geneStudied].valueCodeableConcept = HGNC#HGNC:11389 "STK11"

Instance: tumor-marker-test-egf
InstanceOf: TumorMarkerTest
Description: "mCODE Example for Tumor Marker Test"
* status = #final "final"
* code = LNC#39004-7 "Epidermal growth factor receptor Ag [Presence] in Tissue"
* subject = Reference(cancer-patient-john-anyperson)
* effectiveDateTime = "2019-04-01"
* performer = Reference(us-core-practitioner-kyle-anydoc)
* valueCodeableConcept = SCT#10828004 "Positive (qualifier value)"

Instance: genomic-specimen-lung
InstanceOf: GenomicSpecimen
Description: "mCODE Example for Genomic Specimen"
* status = #available "Available"
* subject = Reference(cancer-patient-john-anyperson)
* processing.timeDateTime = "2019-03-20"
* collection.collector = Reference(us-core-practitioner-kyle-anydoc)
* type = SPTY#TISS "Tissue"
* collection.bodySite = SCT#41224006 "Structure of lower lobe of left lung (body structure)"