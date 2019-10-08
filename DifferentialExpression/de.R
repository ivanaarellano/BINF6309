#!/usr/bin/env Rscript
# de.R
library(tximport)
library(readr)
library(DESeq2)
library(knitr)
tx2gene <- read.csv("tx2gene.csv")
head(tx2gene)
samples <- read.csv("Samples.csv", header=TRUE)
head(samples)

files <- file.path("quant", samples$Sample, "quant.sf")
txi <- tximport(files, type="salmon", tx2gene=tx2gene)


dds <- DESeqDataSetFromTximport(txi, colData = samples, 
                                design = ~ Menthol + Vibrio)


dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
dds <- DESeq(dds)


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
head(dfAll)
kable(head(deAnnotated))

write.csv(dfAll, file="dfAll.csv")
write.csv(deAnnotated, na=" ", file="deAnnotated.csv")
