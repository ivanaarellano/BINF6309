#!/usr/bin/env bash
# indexAll.sh
#samtools index \
#Aip02.sorted.bam \
#1>Aip02.index.log 2>Aip02.index.err &

#!/usr/bin/env bash
# SortAll.sh 
#Initialize variable to contain the directory of bam bai files 
BamPath="/home/arellano.i/BINF6309/RNA-Seq/bam/"
#Initialize variable to contain the suffix bam files
BamSuffix=".sorted.bam"
ErrOutPath="/home/arellano.i/BINF6309/RNA-Seq/ErrBam/"
#Loop through all the Sam Suffix files in $SamPath
for left in $BamPath*$BamSuffix
do
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${left/$BamPath/}"
    echo $pathRemoved
    #Remove the Sam suffix from $pathRemoved and assign to suffixRemoved
    sampleName="${pathRemoved/$BamSuffix/}"
    echo $sampleName
    echo samtools index
    echo $BamPath$sampleName$BamSuffix
    echo $BamPath$sampleName.index.log 
    echo $ErrOutPath$sampleName.index.err
   #1>$BamPath$sampleName.index.log 2>$ErrOutPath$sampleName.index.err &
done




