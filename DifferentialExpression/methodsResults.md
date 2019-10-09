### Methods

1.  Salmon (Patro et al. [2017](#ref-Patro)) to estimate relative
    abundance
2.  tximport (Soneson, Love, and Robinson [2015](#ref-Soneson)) to
    import the Salmon abundance
3.  DESeq2 (Love, Huber, and Anders [2014](#ref-Love)) to perform
    statistical tests to identify differentially expressed genes

<!-- end list -->

``` r
#!/usr/bin/env Rscript
# de.R
library(tximport)
library(readr)
library(DESeq2)
```

    ## Loading required package: S4Vectors

    ## Loading required package: stats4

    ## Loading required package: BiocGenerics

    ## Loading required package: parallel

    ## 
    ## Attaching package: 'BiocGenerics'

    ## The following objects are masked from 'package:parallel':
    ## 
    ##     clusterApply, clusterApplyLB, clusterCall, clusterEvalQ,
    ##     clusterExport, clusterMap, parApply, parCapply, parLapply,
    ##     parLapplyLB, parRapply, parSapply, parSapplyLB

    ## The following objects are masked from 'package:stats':
    ## 
    ##     IQR, mad, sd, var, xtabs

    ## The following objects are masked from 'package:base':
    ## 
    ##     anyDuplicated, append, as.data.frame, basename, cbind,
    ##     colMeans, colnames, colSums, dirname, do.call, duplicated,
    ##     eval, evalq, Filter, Find, get, grep, grepl, intersect,
    ##     is.unsorted, lapply, lengths, Map, mapply, match, mget, order,
    ##     paste, pmax, pmax.int, pmin, pmin.int, Position, rank, rbind,
    ##     Reduce, rowMeans, rownames, rowSums, sapply, setdiff, sort,
    ##     table, tapply, union, unique, unsplit, which, which.max,
    ##     which.min

    ## 
    ## Attaching package: 'S4Vectors'

    ## The following object is masked from 'package:base':
    ## 
    ##     expand.grid

    ## Loading required package: IRanges

    ## Loading required package: GenomicRanges

    ## Loading required package: GenomeInfoDb

    ## Loading required package: SummarizedExperiment

    ## Loading required package: Biobase

    ## Welcome to Bioconductor
    ## 
    ##     Vignettes contain introductory material; view with
    ##     'browseVignettes()'. To cite Bioconductor, see
    ##     'citation("Biobase")', and for packages 'citation("pkgname")'.

    ## Loading required package: DelayedArray

    ## Loading required package: matrixStats

    ## 
    ## Attaching package: 'matrixStats'

    ## The following objects are masked from 'package:Biobase':
    ## 
    ##     anyMissing, rowMedians

    ## Loading required package: BiocParallel

    ## 
    ## Attaching package: 'DelayedArray'

    ## The following objects are masked from 'package:matrixStats':
    ## 
    ##     colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges

    ## The following objects are masked from 'package:base':
    ## 
    ##     aperm, apply

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

``` r
library(knitr)
tx2gene <- read.csv("tx2gene.csv")
head(tx2gene)
```

    ##                     trans        ko
    ## 1 TRINITY_DN9495_c0_g1_i2 ko:K00134
    ## 2 TRINITY_DN9573_c0_g1_i1 ko:K01689
    ## 3 TRINITY_DN9485_c0_g1_i1 ko:K02111
    ## 4 TRINITY_DN8020_c0_g1_i1 ko:K04043
    ## 5 TRINITY_DN9453_c0_g1_i1 ko:K02932
    ## 6 TRINITY_DN8136_c0_g1_i1 ko:K02932

``` r
samples <- read.csv("Samples.csv", header=TRUE)
head(samples)
```

    ##   Sample Menthol  Vibrio
    ## 1  Aip17 Menthol  Vibrio
    ## 2  Aip20 Control  Vibrio
    ## 3  Aip24 Menthol Control
    ## 4  Aip28 Control Control
    ## 5  Aip14 Menthol  Vibrio
    ## 6  Aip26 Control  Vibrio

``` r
files <- file.path("quant", samples$Sample, "quant.sf")
txi <- tximport(files, type="salmon", tx2gene=tx2gene)
```

    ## reading in files with read_tsv

    ## 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 
    ## removing duplicated transcript rows from tx2gene
    ## transcripts missing from tx2gene: 34247
    ## summarizing abundance
    ## summarizing counts
    ## summarizing length

``` r
dds <- DESeqDataSetFromTximport(txi, colData = samples, 
                                design = ~ Menthol + Vibrio)
```

    ## using counts and average transcript lengths from tximport

``` r
dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
dds <- DESeq(dds)
```

    ## estimating size factors
    ## using 'avgTxLength' from assays(dds), correcting for library size
    ## estimating dispersions
    ## gene-wise dispersion estimates
    ## mean-dispersion relationship
    ## final dispersion estimates
    ## fitting model and testing

``` r
padj <- .05
minLog2FoldChange <- .5
dfAll <- data.frame()
# Get all DE results except Intercept, and "flatten" into a single file.
for (result in resultsNames(dds)){
    if(result != 'Intercept'){
        res <- results(dds, alpha=.05, name=result)
        dfRes <- as.data.frame(res)
        dfRes <- subset(subset(dfRes, select=c(log2FoldChange, padj)))
        #dfRes2 <- subset(subset(dfRes, select=c(log2FoldChange, padj)))
        dfRes$Factor <- result
        dfAll <- rbind(dfAll, dfRes)    
        deAnnotated <- dfAll[dfAll$padj<0.05, ]
        MergeDeAnnotated <-  merge(deAnnotated, tx2gene)
        deAnnotated <-unique(subset(MergeDeAnnotated, select=c(trans, ko, padj, Factor)))
        #deAnnotated <- rbind(deAnnotated, MergeDeAnnotated)

    }
}
#head(dfAll)

#kable(head(deAnnotated))




write.csv(dfAll, file="dfAll.csv")
write.csv(deAnnotated, na=" ", file="deAnnotated.csv")
```

### Results

| trans                       | ko        |      padj | Factor                        |
| :-------------------------- | :-------- | --------: | :---------------------------- |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 | 0.0273043 | Menthol\_Menthol\_vs\_Control |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 | 0.0000154 | Menthol\_Menthol\_vs\_Control |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 | 0.0000000 | Menthol\_Menthol\_vs\_Control |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 | 0.0000011 | Menthol\_Menthol\_vs\_Control |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 | 0.0163071 | Menthol\_Menthol\_vs\_Control |
| TRINITY\_DN9495\_c0\_g1\_i2 | ko:K00134 |        NA | NA                            |

Table

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
