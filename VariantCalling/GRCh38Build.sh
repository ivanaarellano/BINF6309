#!/usr/bin/env bash
# GRCh38Build.sh
nice -n19 gmap_build -D . \
-d GRCh38 \
/home/arellano.i/BINF6309/VariantCalling\
GRCh38.primary_assembly.genome.fa.gz \
1>GRCh38Build.log 2>GRCh38Build.err &




