#!/usr/bin/env bash
# SortAll.sh 
#Initialize variable to contain the directory of un-trimmed fastq files 
SamPath="/home/arellano.i/BINF6309/RNA-Seq/sam/"
#Initialize variable to contain the suffix for the left reads
SamSuffix=".sam"
BamSuffix=".sorted.bam"
BamPath="/home/arellano.i/BINF6309/RNA-Seq/bam/"
ErrOutPath="/home/arellano.i/BINF6309/RNA-Seq/ErrBam/"
#Loop through all the left-read fastq files in $fastqPath
for left in $SamPath*$SamSuffix
do
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${left/$SamPath/}"
    #echo $pathRemoved 
    #Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
    sampleName="${pathRemoved/$SamSuffix/}"
    #echo $sampleName
    samtools sort \
    $SamPath$sampleName$SamSuffix \
    -o $BamPath$sampleName$BamSuffix \
    1>$BamPath$sampleName.sort.log 2>$ErrOutPath$sampleName.sort.err &
done




