<div markdown="1" class="note">
This page has been enhanced to include extended guidance on the use of mCODE genomics elements in support of real-world scenarios. 
</div>

## mCODE Rationale

mCODE™ (the minimal Common Oncology Data Elements) was conceived of as a lightweight standard that would enable the treatment of every cancer patient to contribute to comparative effectiveness analysis of cancer treatments by allowing for easier methods of data exchange between health systems. Fundamentally, mCODE is a step towards capturing research-quality data from the treatment of all cancer patients.  mCODE benefits from the HL7 FHIR Implementation Guide (HL7 IG) representing a core set of structured data elements for oncology electronic health records (EHRs) which it has inherited. As a result, regarding genomic, and biomarkers in general, the current implementation of mCODE from an omics standpoint borrows heavily from the HL7 IG.



## Context Matters

mCODE was designed to be minimal – however the context of this “minimal-ness” may differ among target use cases particularly when applied to omics. Here we will distinguish between a research and clinical use case. It is important to note that research requirements for genomics differ greatly from that for clinical genomics.  As it stands, mCODE is designed to house the discrete genetic variants vis-à-vis a detailed cancer genomics report. This is certainly useful for researchers who require specific data provenance regarding the derivation of genomic values. Aside from the cancer genomics report metadata, for each genetic variants there are over 40 fields that can potentially be filled in. Certainly, not every field was meant to be filled in nor is meaningful for all situations.



If we examine clinical genomics in the context of patient sharing for patient sharing among institutions, only the actionable alterations are generally of import. For example, an oncologist may relate to a colleague that he or she has “a patient with a pathogenic KIT mutation from a recent biopsy specimen” and was wondering if there were any active clinical trials or medications that may benefit this patient. In the clinical context, these five pieces of information are critical:



Biomarker source: tumor
Biomarker category: DNA mutation
Biomarker name: KIT
Biomarker result: mutated
Biomarker interpretation: pathogenic


## Biomarker Generalized Form

Indeed, this canonical form generalizable way of passing biomarker information from medical provider to medical provider for the purposes of clinical care. Patients, too, if they wished to share their information with providers simply would need to know these several fields for clinically actionable care. Other case examples

### Biomarker Form Examples


Protein Expression:
Biomarker source: tumor
Biomarker category: IHC
Biomarker name: INI-1
Biomarker result: loss
Biomarker interpretation: deficiency


#### DNA Copy Number Alteration:
Biomarker source: tumor
Biomarker category: DNA Copy Number Alteration
Biomarker name: MDM2
Biomarker result: 120 copies
Biomarker interpretation: amplification


#### Fusion analysis
Biomarker source: tumor
Biomarker category: RNA fusion analysis
Biomarker name(s): FUS, CHOP
Biomarker result: fusion
Biomarker interpretation: pathogenic

{% include markdown-link-references.md %}