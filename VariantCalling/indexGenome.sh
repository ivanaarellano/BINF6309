#!/usr/bin/env bash
# indexGenome.sh
nice -n19 iit_store \
-G /home/arellano.i/BINF6309/VariantCalling \
-o GRCh38 \
1>indexGenomeIIT.log 2>indexGenomeIIT.err &
