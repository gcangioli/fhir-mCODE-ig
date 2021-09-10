## mCODE Rationale

mCODE™ (the minimal Common Oncology Data Elements) was conceived of as a lightweight standard that would enable the treatment of every cancer patient to contribute to comparative effectiveness analysis of cancer treatments by allowing for easier methods of data exchange between health systems. Fundamentally, mCODE is a step towards capturing research-quality data from the treatment of all cancer patients.  mCODE benefits from the HL7 FHIR Implementation Guide (HL7 IG) representing a core set of structured data elements for oncology electronic health records (EHRs) which it has inherited. As a result, regarding genomic, and biomarkers in general, the current implementation of mCODE from an omics standpoint borrows heavily from the HL7 IG.



## Context Matters

mCODE was designed to be minimal – however the context of this “minimal-ness” may differ among target use cases particularly when applied to omics. Here we will distinguish between a research and clinical use case. It is important to note that research requirements for genomics differ greatly from that for clinical genomics.  As it stands, mCODE is designed to house the discrete genetic variants vis-à-vis a detailed cancer genomics report. This is certainly useful for researchers who require specific data provenance regarding the derivation of genomic values. Aside from the cancer genomics report metadata, for each genetic variants there are over 40 fields that can potentially be filled in. Certainly, not every field was meant to be filled in nor is meaningful for all situations.



If we examine clinical genomics in the context of patient sharing for patient sharing among institutions, only the actionable alterations are generally of import. For example, an oncologist may relate to a colleague that he or she has “a patient with a pathogenic KIT mutation from a recent biopsy specimen” and was wondering if there were any active clinical trials or medications that may benefit this patient. In the clinical context, these five pieces of information are critical:


* Biomarker source
* Biomarker category
* Biomarker name
* Biomarker result
* Biomarker interpretation


For example:

| Biomarker Element         | Example value              |
|---------------------------|----------------------------|
| Biomarker source | tumor | 
| Biomarker category | DNA mutation |
| Biomarker name | KIT |
| Biomarker result | mutated |
| Biomarker interpretation | pathogenic |
{: .grid }

## Biomarker Generalized Form

Indeed, this canonical form generalizable way of passing biomarker information from medical provider to medical provider for the purposes of clinical care. Patients, too, if they wished to share their information with providers simply would need to know these several fields for clinically actionable care. Other case examples

### Biomarker Form Examples


#### Protein Expression


| Biomarker Element         | Example value              |
|---------------------------|----------------------------|
| Biomarker source | tumor | 
| Biomarker category | IHC |
| Biomarker name | INI-1 |
| Biomarker result | loss |
| Biomarker interpretation | deficiency |
{: .grid }


#### DNA Copy Number Alteration:


| Biomarker Element         | Example value              |
|---------------------------|----------------------------|
| Biomarker source | tumor | 
| Biomarker category | DNA Copy Number Alteration |
| Biomarker name | MDM2 |
| Biomarker result | 120 copies |
| Biomarker interpretation | amplification |
{: .grid }


#### Fusion analysis


| Biomarker Element         | Example value              |
|---------------------------|----------------------------|
| Biomarker source | tumor | 
| Biomarker category | RNA fusion analysis |
| Biomarker name | FUS, CHOP |
| Biomarker result | fusion |
| Biomarker interpretation | pathogenic |
{: .grid }


## Implementation

mCODE separated the notion of "tumor markers" and "genomics elements" for pragmatic informatics reasons related to reference lab instrumentations and the sending of results to receiving applications like electronic health records (EHRs).

* genetic DNA tumor markers identified through variants from genomic sequencing tests. For example:
    * 

* genetic DNA tumor markers identified through reference labs as point mutation tests. For example:
    * 

* mRNA and protein tumor markers identified through gene expression from Immunohistochemistry (IHC) or In-Situ Hybridization (ISH) tests. For example:
    * Estrogen Receptor (ER)
    * Progesterone Receptor (PR)
    * Receptor tyrosine-protein kinase erbB-2 (ERBB2), also known as HER2/neu
    * [Programmed death-ligand 1 (PD-L1)](https://www.mayocliniclabs.com/it-mmfiles/PD-L1_Immunohistochemistry_Options.pdf)

* non-genetic prognostic tumor markers such as cancer antigen tests. For example:
    * [prostate-specific antigen (PSA)](https://labtestsonline.org/tests/prostate-specific-antigen-psa)
    * [carcinoembronic antigen (CEA)](https://labtestsonline.org/tests/carcinoembryonic-antigen-cea)
    * [Alpha Fetoprotein (AFP)](https://labtestsonline.org/tests/alpha-fetoprotein-afp-tumor-marker)


# Analysis Approach
Analysis of the following data feeds:

Unstructured test reports:
* Caris offers [cancer-specific biomarker tests](https://www.carislifesciences.com/order-a-test/) which aggregate DNA, RNA, and protein tumor marker tests.



# Observations

**Biomarker pattern #1:**
If the biomarker is a protein tumor marker whose value is quantitative.

Map from the mCODE CancerGeneticVariant profile if the biomarker of type [ProteinMarkerTestVS] was part of a mutational analysis from a genomic sequencing test.


The pattern of translation is as follows:


| mCODE Profile         | mCODE element              | Biomarker Observation element           | Comments                |
|-----------------------|----------------------------|-----------------------------------------|-------------------------|
| TumorMarkerTest    | Observation.specimen                 | biomarker-specimen-source                 |    |
| TumorMarkerTest    | Observation.code.coding.code         | biomarker-code                            |    |
| TumorMarkerTest    | Observation.code.coding.displayName  | biomarker-name                            |    |
| TumorMarkerTest    | Observation.valueCodeableConcept     | biomarker-value                           |    |
| TumorMarkerTest    | Observation.interpretation           | biomarker-interpretation                  |    |
{: .grid }


_Biomarker pattern #1 Example#1:_
[ER]: Observation-biomarker-estrogen-receptor.html

Resulting simplified biomarker representation:


| **biomarker-element**       | **value**        | 
|-----------------------------|------------------|
| biomarker-code   |               | 
{: .grid }


**Biomarker pattern #2:**
If the biomarker is a protein tumor marker with a result that denotes confirmation of presence (_positive_, _negative_, _undetermined_,_etc_).


**Biomarker pattern #3:**

If the biomarker is from a genomic sequencing test, and whose results are represented with detailed variant data represented conformant with bioinformatics standards like HGNC and HGVS.

Map from the mCODE CancerGeneticVariant profile if the biomarker of type [DNATumorMarkerTestVS] was part of a mutational analysis from a genomic sequencing test.

The pattern of translation is as follows:


| mCODE Profile           | mCODE element                                 | Biomarker Observation element    | Comments           |
|-------------------------|-----------------------------------------------|----------------------------------|--------------------|
| CancerGeneticVariant    | Observation.component:geneStudied.code        | biomarker-name      | TBD |
| CancerGeneticVariant    | Observation.component:geneStudied.valueCodeableConcept     | biomarker-value     | TBD |
{: .grid }



# References
* Orfao, A., Gonzalez, J., Lopez, A., Abad, M., Bouza, P., Cruz, J, Alonso, A., San Miguel, J. (1995). [Flow cytometry in the diagnosis of cancer.](https://pubmed.ncbi.nlm.nih.gov/7652487/) _Scand J Clin Lab Invest Suppl_, 1995;221:145-52. doi: 10.3109/00365519509090577. 

{% include markdown-link-references.md %}