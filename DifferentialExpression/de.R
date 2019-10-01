#!/usr/bin/env Rscript
# de.R
library(tximport)
library(readr)
library(DESeq2)
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


dds$Vibrio <- relevel(dds$Vibrio, ref = "Control")
dds$Menthol <- relevel(dds$Menthol, ref = "Control")
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
dds <- DESeq(dds)


write.csv(dfAll, file="dfAll.csv")

