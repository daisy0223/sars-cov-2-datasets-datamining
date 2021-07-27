# Running Pipeline

**Run Pangolin**

*Note: You will need to use full paths in places where $PWD is in the path as I removed these, because cyber crime is a thing :grimacing:.*

Run pangolin on multi-fasta file. The singularity.conf file and how to run cromwell is found [here](https://github.com/jvhagey/Tutorials/tree/main/wdl_files). 

`java -Dconfig.file=/$PWD/bin/singularity.conf -jar ~/bin/cromwell-59.jar run /$PWD/Pangolin/wf_pangolin_illumina_pe.wdl --inputs Pangolin.inputs.json`

**Generate_Random_Genomes.py**  

You can run this by editing and submitting `Random_Genome_Automation.sh`  

You will need the following files to run the script:  
1. A fasta file with all the sequences of the variants you are interested in.
2. Reference sequences for each of the variants you are interested in. These should be in the same folder with the variant name (i.e. `B.1.1.7.fasta`).
3. A `mapping file` that is tab delimited with at columns GISAID_ID and SRR_ID.

You can either run all the samples in the fasta file with the `--all` flag. Or use the `-n` flag to determine how many samples to pull randomly for each variant.  
If you have already run the script once intermediate files would have been created so you can run `--random-only` and `-n` to speed up the process. 

The script requires:  
- seqkit/1.0  
- BBMap/38.90  
- snippy/4.3.8  

For example:

`python3 Generate_Random_Fasta.py -f /$PWD/B.1.617/413.B.1.617.fasta -m /$PWD/B.1.617/mapping_file.txt -ref /$PWD/B.1.617/Analysis/Reference_Sequences -p Delta_Variants_pango2_lineage.csv --random-only -n 50`

`python3 Generate_Random_Fasta.py --all -f /$PWD/B.1.617/413.B.1.617.fasta -m /$PWD/B.1.617/mapping_file.txt -ref /$PWD/B.1.617/Analysis/Reference_Sequences -p Delta_Variants_pango2_lineage.csv`

**Get SRA_IDs**  

`cut -f18 Pango_Random_Genomes_Stats.tsv > SRR_IDs.txt`

This file will be passed to `NCBI_Grabbing.py`

**NCBI_Grabbing.py**

`python3 NCBI_Grabbing.py -f SRR_IDs.txt -p Pango_Random_Genomes_Stats.tsv`
