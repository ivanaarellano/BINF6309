## Overview

The two main steps in performing differential expression analysis are to
estimate the relative abundance of transcripts, and to apply statistical
models to test for differential expression between treatment groups.
Estimating relative abundance is basically determining how many NGS
reads match a given gene within a genome. In this module you’ll use
Salmon
(<span class="citeproc-not-found" data-reference-id="Patro">**???**</span>)
to estimate relative abundance, tximport
(<span class="citeproc-not-found" data-reference-id="Soneson">**???**</span>)
to import the Salmon abundance estimates, and DESeq2
(<span class="citeproc-not-found" data-reference-id="Love">**???**</span>)
to perform statistical tests to identify differentially expressed genes.

## References
