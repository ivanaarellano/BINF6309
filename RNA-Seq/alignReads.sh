#!/usr/bin/env bash
# alignReads.sh
echo nice -n19 gsnap \
-A sam \
-D . \
-d AiptasiaGmapDb \
Aip02.R1.paired.fastq \
Aip02.R2.paired.fastq
#1>Aip02.sam 2>Aip02.err &
