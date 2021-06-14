#! /bin/bash -l
#
## -- begin embedded SGE options --
# save the standard output text to this file instead of the default jobID.o file
#$ -o /scicomp/groups-pure/Projects/TOAST/Random_Genome_Automation/Run_2/Random_Genome_Automation_Stats.out
#
# save the standard error text to this file instead of the default jobID.e file
#$ -e /scicomp/groups-pure/Projects/TOAST/Random_Genome_Automation/Run_2/Random_Genome_Automation_Stats.err
#
# Rename the job to be this string instead of the default which is the name of the script
#$ -N Random_Genome_Automation_Stats
# 
# Requesting shared memory across 10 cpus
#$ -pe smp 8
#
# Requesting 30G of Memory for the job
#$ -l h_vmem=30G
#
# Refer all file reference to work the current working directory which is the directory from which the script was qsubbed
#$ -cwd
#
# Always run in the default queue
#$ -q all.q
#
# Email me updates
#$ -M qpk9@cdc.gov
#
## -- end embedded SGE options --

echo I am running on node: login02.aspen.biotech.cdc.gov

cd /scicomp/groups-pure/Projects/TOAST/Random_Genome_Automation
## Getting sequence variants
module load seqkit/1.0
module load BBMap/38.90
module load snippy/4.3.8

#python3 Generate_Random_Fasta.py --random-only -n 50
#python3 Generate_Random_Fasta.py --random-only -n 50

python3 /scicomp/groups-pure/Projects/TOAST/Random_Genome_Automation/Generate_Random_Fasta.py --all -f /scicomp/groups-pure/Projects/TOAST/B.1.617/413.B.1.617.fasta -m /scicomp/groups-pure/Projects/TOAST/B.1.617/mapping_file.txt -ref /scicomp/groups-pure/Projects/TOAST/B.1.617/Jill_Analysis/Reference_Sequences -p Indian_Variants_pango2_lineage.csv
