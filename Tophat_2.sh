#load modules
module load bowtie2
module load tophat

#build index needs to be done once
bowtie2-build S288C_reference_sequence_R64-1-1_20110203.fsa S288C_reference_sequence_R64-1-1_20110203.fsa

#runs run_tophat.sh on fastq file and submits to cluster; not efficient
echo sh /bigdata/messaoudilab/arivera/GEN220/groupproject/2.Alignment/Tophat/run_tophat.sh /bigdata/messaoudilab/arivera/GEN220/groupproject/2.Alignment/Tophat/WT_0hrs_rep1_1.fastq | qsub
