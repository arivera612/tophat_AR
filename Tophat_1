input=$1
module load samtools
module load bowtie2
module load tophat
dir=`dirname $input`
output=`basename $input .fastq`
echo $dir
tophat -p 4 -g 20 --segment-length 25 -i 50 -I 500000 -G /bigdata/messaoudilab/arivera/GEN220/groupproject/2.Alignment/Tophat/features.gff -o /bigdata/messaoudilab/arivera/GEN220/groupproject/2.Alignment/Tophat/$output /bigdata/messaoudilab/arivera/GEN220/groupproject/2.Alignment/Tophat/genome.fasta $input


