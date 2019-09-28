#!/usr/bin/env bash
# AlignAll.sh 
#Initialize variable to contain the directory of un-trimmed fastq files 
PairedPath="/home/arellano.i/BINF6309/RNA-Seq/Paired/"
#Initialize variable to contain the suffix for the left reads
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
SamOutPath="/home/arellano.i/BINF6309/RNA-Seq/sam/"
ErrOutPath="/home/arellano.i/BINF6309/RNA-Seq/ErrSam/"
#Loop through all the left-read fastq files in $fastqPath
for leftInPaired in $PairedPath*$leftSuffix
do
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${leftInPaired/$PairedPath/}"
    #echo $pathRemoved 
    #Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
    sampleName="${pathRemoved/$leftSuffix/}"
    #echo $sampleName
    nice -n19 gsnap \
    -A sam \
    -D . \
    -d AiptasiaGmapDb \
    $PairedPath$sampleName$leftSuffix \
    $PairedPath$sampleName$rightSuffix \
    1>$SamOutPath$sampleName.sam 2>$ErrOutPath$sampleName.err
done




