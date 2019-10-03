## Overview

The two main steps in performing differential expression analysis are to
estimate the relative abundance of transcripts, and to apply statistical
models to test for differential expression between treatment groups.
Estimating relative abundance is basically determining how many NGS
reads match a given gene within a genome. In this module you’ll use
Salmon (Patro et al. [2017](#ref-Patro)) to estimate relative abundance,
tximport (Soneson, Love, and Robinson [2015](#ref-Soneson)) to import
the Salmon abundance estimates, and DESeq2 (Love, Huber, and Anders
[2014](#ref-Love)) to perform statistical tests to identify
differentially expressed genes.

## References

<div id="refs" class="references">

<div id="ref-Love">

Love, Michael I., Wolfgang Huber, and Simon Anders. 2014. “Moderated
Estimation of Fold Change and Dispersion for RNA-Seq Data with DESeq2.”
*Genome Biology* 15 (12): 550–50.
<https://doi.org/10.1186/s13059-014-0550-8>.

</div>

<div id="ref-Patro">

Patro, Rob, Geet Duggal, Michael I. Love, Rafael A. Irizarry, and Carl
Kingsford. 2017. “Salmon Provides Fast and Bias-Aware Quantification of
Transcript Expression.” *Nature Methods* 14 (4): 417–19.
<https://doi.org/10.1038/nmeth.4197>.

</div>

<div id="ref-Soneson">

Soneson, Charlotte, Michael I. Love, and Mark D. Robinson. 2015.
“Differential Analyses for RNA-Seq: Transcript-Level Estimates Improve
Gene-Level Inferences.” *F1000Research* 4 (December): 1521–1.
<https://www.ncbi.nlm.nih.gov/pubmed/26925227>.

</div>

</div>
