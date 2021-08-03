# TOAST benchmark dataset for SARS-CoV-2 sequencing

## Author
Technical Outreach and Assistance for States Team (TOAST)

## Purpose
After multiple requests, TOAST developed a benchmark dataset for SARS-CoV-2 sequencing designed to help users at varying stages of building sequencing capacity. It consists of six datasets summarized in the table below, each chosen to represent a different use case.

## Summary Table
| Dataset  | Datatype | Platform | Primer | Size | Application |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| Dataset1: Outbreak  | fastq,consensus  | Illumina  | random primer (metagenomics)  | 70 samples  | This dataset is from a real outbreak with three introductions. It is designed for labs trying to understand the features of virus transmission during the real outbreak. [Dataset1](https://github.com/globalmicrobialidentifier-WG3/datasets/blob/master/datasets/sarscov2-SNF-A.tsv) is generated from [Lemieux et al., 2020](https://science.sciencemag.org/content/371/6529/eabe3261) .       |
| Dataset2: Rapid-18 hr | fastq,consensus  | Illumina, MinIon  | ARTIC | 44 samples*3 (CoronaHiT-ONT, ARTIC LoCost, CoronaHiT-Illumina)| This dataset consists of Illumina and MinIon sequencing data using 18 hr wet lab protocol (ARTIC LoCost or CoronaHiT). It is designed for labs trying to understand the effect of wet lab protocols on the sequencing data and downstream analysis, as well as for labs who consider about automation. Due to shorter processing time, they can be applied under the outbreak setting. [Dataset2](https://github.com/globalmicrobialidentifier-WG3/datasets/blob/master/datasets/sars-cov-2-coronahit-rapid.tsv) is generated from [Baker et al.,2021](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-021-00839-5).   |
| Dataset 3: Routine-30 hr  |  fastq,consensus  | Illumina, MinIon | ARTIC  | 72 samples*3 (CoronaHiT-ONT, ARTIC LoCost, CoronaHiT-Illumina)  | This dataset consists of Illumina and MinIon sequencing data using 30 hr wet lab protocol (ARTIC LoCost or CoronaHiT). It is designed for labs trying to understand the effect of wet lab protocols on the sequencing data and downstream analysis, as well as labs who consider about automation. Due to longer processing time, they can be applied for weekly surveillance. [Dataset3](https://github.com/globalmicrobialidentifier-WG3/datasets/blob/master/datasets/sars-cov-2-coronahit-routine.tsv) is generated from [Baker et al.,2021](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-021-00839-5).  |
| Dataset 4: CDC defined VOC/VOI  | fastq | Illumina  | Most are  ARTIC  | 19 samples | This dataset consists of representative genomes from 11 VOI/VOC lineages (B.1.1.7, B.1.351, B.1.427, B.1.429, P.1, B.1.525, B.1.526, B.1.526.1, P.2, B.1.617.1, B.1.617.2) with the CDC defined spike protein mutations as of 05/30/2021. They are designed for labs trying to compare different bioinformatics pipelines or validate any analysis parameter changes. [Dataset4](https://github.com/daisy0223/misc/blob/main/Dataset4.tsv) is generated from data mining of publicly available data. |
| Dataset 5: Non-VOI/VOC  | fastq, complete genome  | Illumina | ARTIC V3: 33, ARTIC V1: 2, NA:12  |  47 samples  | This dataset consists of 47 samples from non-VOI/VOC lineages. Due to the existence of close genomes, they are designed for labs trying to evaluate the quality of consensus, comparing different bioinformatics pipelines or validating any analysis parameter changes. [Dataset5](https://github.com/daisy0223/misc/blob/main/Dataset5.tsv) is generated from data mining of publicly available data.|
| Dataset 6: Failed QC genomes  | fastq | Illumina   | Some are ARTIC  | 17 samples  | This dataset is consisted of failed QC Illumina data. They are designed for new labs trying to understand possible scenarios of sequencing failures, therefore establish necessary quality management and control system. It covers frameshifts which would fail VADR2, low breadth of coverage, human contamination, 100 Ns in a row of a consensus, amplicon dropout, and non-template control. [Dataset6](https://figshare.com/articles/dataset/SARS-CoV-2_bad_Illumina_paired_end_reads/15062289) is provided by CDC internal collaborators.|

## Downloading script
- Please refer to this [site](https://github.com/WGS-standards-and-analysis/datasets) for more details of installing the downloading script.
## Prerequisites
- `edirct, sratoolkit,Perl, Make, wget, sha256sum`

## Data downloading
-download the dataset.tsv
```Shell
$> Example 1: wget https://raw.githubusercontent.com/globalmicrobialidentifier-WG3/datasets/master/datasets/sarscov2-SNF-A.tsv
$> Example 2: wget https://raw.githubusercontent.com/daisy0223/misc/main/Dataset4.tsv
```
-download the raw reads for each dataset
```Shell
$> perl GenFSGopher.pl -o /path/to/target/directory /path/to/dataset/tsv
```
