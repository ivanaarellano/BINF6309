#!/usr/bin/env bash
# trimAll.sh
nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
-threads 1 -phred33 \
/home/arellano.i/BINF6309/VariantCalling/SRR6808334_1.fastq \
/home/arellano.i/BINF6309/VariantCalling/SRR6808334_2.fastq \
SRR6808334_1.paired.fastq \
SRR6808334_1.unpaired.fastq \
SRR6808334_2.paired.fastq \
SRR6808334_2.unpaired.fastq \
HEADCROP:0 \
ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36 \
1>trim.log 2> trim.err &











