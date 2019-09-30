#!/usr/bin/env bash
# AlignAll.sh 
#Initialize variable to contain the directory of un-trimmed fastq files 
PairedPath="/scratch/SampleDataFiles/Paired"
#Initialize variable to contain the suffix for the left reads
outDir='quant/'
sample='Aip02'
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
ErrOutPath="/home/arellano.i/BINF6309/DifferentialExpression/Err"
#Loop through all the left-read fastq files in $fastqPath
for leftInPaired in $PairedPath*$leftSuffix
do
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${/scratch/SampleDataFiles/Paired}"
    #echo $pathRemoved 
    #Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
    sampleName="${pathRemoved/$leftSuffix/}"
    #echo $sampleName
    



    $PairedPath$sampleName$leftSuffix \
    $PairedPath$sampleName$rightSuffix \
    1>$SamOutPath$sampleName.sam 2>$ErrOutPath$sampleName.err
done




#!/usr/bin/env bash
outDir='quant/'
sample='Aip02'
function align {
    salmon quant -l IU is \
        -1 /scratch/SampleDataFiles/Paired/$sample.R1.paired.fastq \
        -2 /scratch/SampleDataFiles/Paired/$sample.R2.paired.fastq \
        -i AipIndex \
        --validateMappings \
        -o $outDir$sample
}

align 1>align.log 2>align.err &


