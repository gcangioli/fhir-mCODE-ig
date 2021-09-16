This use case focuses on the translation of genomic data elements as represented within a genomic sequencing report. 

Four mCODE profiles relate to the capture of clinical genomics data to support this use case:

* [CancerGenomicsReport] - contain results of genomic analyses. Genomic reports vary in complexity and content, as simple as the results for a single discrete variant to complex sequences.
* [CancerGeneticVariant] - used to record variants that could be found from tests that broadly analyze genetic regions (e.g.: exome tests) and stores results for any variants that could have been found. The region in which the variant was found could be specified in the RegionStudied attribute of the GenomicsReport profile.
* [GenomicRegionStudied] - used to record the portion(s) of the genome that was tested for variants.
* [GeneticSpecimen] - describes a specimen collected for a genomics test.

These profiles are based on the [HL7 CGWG Clinical Genomics Reporting Implementation Guide](http://hl7.org/fhir/uv/genomics-reporting/index.html). They do not however directly derive from the HL7 clinical genomics profiles. This is intentional given the current and significant changes to the HL7 Genomics Reporting IG Standard for Trial Use (STU) ballot. These changes being applied to the CG Reporting IG continuous integration (CI) build. Because it is generally not recommended for a dependent FHIR IG to directly derive from a continuous build artifact. To balance the need for aligning compatibility while balancing version changes among the two IGs, mCODE instead keeps track of the HL7 Genomics Reporting IG CI build changes and incorporates them into compatible profiles.

The table below lists the profile equivalencies between the two IGs:

| mCODE Profile      | HL7 CG Reporting IG Profile | Comments                  |
|--------------------|-----------------------------|---------------------------|
| CancerGenomicsReport | genomics-report | |
| CancerGeneticVariant | variant | |
| GenomicRegionStudied | region-studied | |
| GeneticSpecimen | specimen | |

{: .grid }


## General Implementation Guidance

### Assumptions and Scope

* mCODE genomics elements should be seen as data that could be available for exchange. It is not assuming all of the data elements need to be captured and exchanged. 
* The Tumor Marker elements differ from the genomics elements in its inclusion of 
  * serum-based measurements which could have an implication on cancer but are not molecular markers (e.g.: PSA).
  * gene expression tests (e.g.: HER2 Immunohistochemistry tests)

There are however tumor marker tests that are molecular marker equivalent tests that could also be included in a sequencing test.
### On Genomics Test Representation

The identity of non-genomic laboratory tests is typically represented by a [Logical Observation Identifiers and Names (LOINC)](https://loinc.org/) code. However, many genetic tests and panels do not have LOINC codes, although some might have an identifier in the [NCBI Genetic Testing Registry (GTR)](https://www.ncbi.nlm.nih.gov/gtr/), a central location for voluntary submission of genetic test information by providers. While GTR is a viable source for identifying many genetic tests, the user should be aware that the GTR is not single authoritative source since the test data is voluntarily updated. Standardization of codes for genetic tests is essential to facilitate data analysis of genetic tests, and should be a priority for the genomics testing community in the near future. Implementers should also note that, to conform to the requirements of the [US Core Laboratory Result Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html), if a suitable LOINC exists, it must be used. If there is no suitable code in LOINC, then a code from an alternative code system such as GTR can be used.

### Representing Gene Fusion Events



### mCODE Genomics FHIR Artifacts

<br />

#### Profiles

* [CancerGeneticVariant]
* [GeneticSpecimen]
* [CancerGenomicsReport]
* [GenomicRegionStudied]

#### Value Sets

**mCODE Genomics Core Value Sets**
* [ClinvarVS]
* [DNAChangeTypeVS]
* [GeneticSpecimenTypeVS]
* [HGNCVS]
* [HGVSVS]

**Biomarker Use Case Value Sets**
* [ProteinMarkerTestVS](ValueSet-biomarker-protein-marker-test-vs.html)


{% include markdown-link-references.md %}