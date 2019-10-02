Author: Ivana Arellano output: html\_document: toc: true toc\_depth: 4
toc\_float: true dev: ‘svg’ md\_document: variant: gfm bibliography:
bibliography.ris —

Overview
--------

The two main steps in performing differential expression analysis are to
estimate the relative abundance of transcripts, and to apply statistical
models to test for differential expression between treatment groups.
Estimating relative abundance is basically determining how many NGS
reads match a given gene within a genome. In this module you’ll use
Salmon \[@Patro\] to estimate relative abundance, tximport \[@Soneson\]
to import the Salmon abundance estimates, and DESeq2 \[@Love\] to
perform statistical tests to identify differentially expressed genes.

References
----------
