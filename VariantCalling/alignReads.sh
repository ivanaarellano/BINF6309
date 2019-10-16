#!/usr/bin/env bash
# alignReads.sh
nice -n19 gsnap \
-A sam \
-D . \
-d GRCh38Build \
SRR6808334_1.paired.fastq \
SRR6808334_2.paired.fastq  \
1>SRR6808334.sam 2>SRR6808334.err &

