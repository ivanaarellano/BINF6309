#!/usr/bin/env bash
#Atacama Tutorial 

mkdir qiime2-atacama-tutorial
cd qiime2-atacama-tutorial

wget \
  -O "sample-metadata.tsv" \
  "https://data.qiime2.org/2019.7/tutorials/atacama-soils/sample_metadata.tsv"

mkdir emp-paired-end-sequences

#Make a directory to contain the paried end sequences 

wget \
  -O "emp-paired-end-sequences/forward.fastq.gz" \
  "https://data.qiime2.org/2019.7/tutorials/atacama-soils/10p/forward.fastq.gz"

wget \
  -O "emp-paired-end-sequences/reverse.fastq.gz" \
  "https://data.qiime2.org/2019.7/tutorials/atacama-soils/10p/reverse.fastq.gz"

wget \
  -O "emp-paired-end-sequences/barcodes.fastq.gz" \
  "https://data.qiime2.org/2019.7/tutorials/atacama-soils/10p/barcodes.fastq.gz"


qiime tools import \
   --type EMPPairedEndSequences \
   --input-path emp-paired-end-sequences \
   --output-path emp-paired-end-sequences.qza

qiime demux emp-paired \
  --m-barcodes-file sample-metadata.tsv \
  --m-barcodes-column barcode-sequence \
  --p-rev-comp-mapping-barcodes \
  --i-seqs emp-paired-end-sequences.qza \
  --o-per-sample-sequences demux.qza \
  --o-error-correction-details demux-details.qza

qiime demux summarize \
  --i-data demux.qza \
  --o-visualization demux.qzv

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 13 \
  --p-trim-left-r 13 \
  --p-trunc-len-f 150 \
  --p-trunc-len-r 150 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv \
  --m-sample-metadata-file sample-metadata.tsv

qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file denoising-stats.qza \
  --o-visualization denoising-stats.qzv

qiime phylogeny align-to-tree-mafft-fasttree \
   --i-sequences rep-seqs.qza \
   --o-alignment aligned-rep-seqs.qza \
   --o-masked-alignment masked-aligned-rep-seqs.qza \
   --o-tree unrooted-tree.qza \
   --o-rooted-tree rooted-tree.qza

 qiime diversity core-metrics-phylogenetic \
   --i-phylogeny rooted-tree.qza \
   --i-table table.qza \
   --p-sampling-depth 1103 \
   --m-metadata-file sample-metadata.tsv \
   --output-dir core-metrics-results

qiime diversity alpha-group-significance \
   --i-alpha-diversity core-metrics-results/faith_pd_vector.qza \
   --m-metadata-file sample-metadata.tsv \
   --o-visualization core-metrics-results/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
   --i-alpha-diversity core-metrics-results/evenness_vector.qza \
   --m-metadata-file sample-metadata.tsv \
   --o-visualization core-metrics-results/evenness-group-significance.qzv

qiime diversity beta-group-significance   
--i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza   
--m-metadata-file sample-metadata.tsv   
--m-metadata-column transect-name   
--o-visualization core-metrics-results/unweighted-unifrac-body-site-significance.qzv   
--p-pairwise

qiime diversity alpha-group-significance \
   --i-alpha-diversity core-metrics-results/faith_pd_vector.qza \
   --m-metadata-file sample-metadata.tsv \
   --o-visualization core-metrics-results/faith-pd-group-significance.qzv

qiime2-atacama-tutorial ivanaaarellano$ qiime diversity alpha-group-significance \
   --i-alpha-diversity core-metrics-results/evenness_vector.qza \
   --m-metadata-file sample-metadata.tsv \
   --o-visualization core-metrics-results/evenness-group-significance.qzv

qiime diversity beta-group-significance  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza   --m-metadata-file sample-metadata.tsv   --m-metadata-column transect-name   --o-visualization core-metrics-results/unweighted-unifrac-transect-name-significance.qzv

qiime diversity beta-group-significance   --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza   --m-metadata-file sample-metadata.tsv   --m-metadata-column extract-group-no   --o-visualization core-metrics-results/unweighted-unifrac-subject-group-significance.qzv   --p-pairwise

qiime emperor plot   --i-pcoa core-metrics-results/unweighted_unifrac_pcoa_results.qza   --m-metadata-file sample-metadata.tsv   --p-custom-axes percentcover   --o-visualization core-metrics-results/unweighted-unifrac-emperor-percentcover.qzv

qiime emperor plot   --i-pcoa core-metrics-results/bray_curtis_pcoa_results.qza   --m-metadata-file sample-metadata.tsv   --p-custom-axes percentcover   --o-visualization core-metrics-results/bray-curtis-emperor-percentcover.qzv

qiime diversity alpha-rarefaction   --i-table table.qza   --i-phylogeny rooted-tree.qza   --p-max-depth 250   --m-metadata-file sample-metadata.tsv   --o-visualization alpha-rarefaction.qzv

wget \
   -O "gg-13-8-99-515-806-nb-classifier.qza" \
   "https://data.qiime2.org/2019.7/common/gg-13-8-99-515-806-nb-classifier.qza"
--2019-10-31 00:11:58--  https://data.qiime2.org/2019.7/common/gg-13-8-99-515-806-nb-classifier.qza

qiime feature-classifier classify-sklearn \
   --i-classifier gg-13-8-99-515-806-nb-classifier.qza \
   --i-reads rep-seqs.qza \
   --o-classification taxonomy.qza

qiime2-atacama-tutorial ivanaaarellano$ qiime metadata tabulate \
   --m-input-file taxonomy.qza \
   --o-visualization taxonomy.qzv

qiime taxa barplot \
   --i-table table.qza \
   --i-taxonomy taxonomy.qza \
   --m-metadata-file sample-metadata.tsv \
   --o-visualization taxa-bar-plots.qzv

qiime feature-table filter-samples   --i-table table.qza   --m-metadata-file sample-metadata.tsv   --p-where "[transect-name]='Baquedano'"   --o-filtered-table gut-table.qza

qiime composition add-pseudocount   --i-table Baquedano-table.qza   --o-composition-table comp-Baquedano-table.qza

qiime composition ancom   --i-table comp-Baquedano-table.qza   --m-metadata-file sample-metadata.tsv   --m-metadata-column site-name   --o-visualization ancom-name.qzv

qiime taxa collapse \
   --i-table Baquedano-table.qza \
   --i-taxonomy taxonomy.qza \
   --p-level 6 \
   --o-collapsed-table Baquedano-table-l6.qza

qiime composition add-pseudocount \
   --i-table Baquedano-table-l6.qza \
   --o-composition-table comp-Baquedano-table-l6.qza

qiime composition ancom \
   --i-table comp-Baquedano-table-l6.qza \
   --m-metadata-file sample-metadata.tsv \
   --m-metadata-column subject \
   --o-visualization l6-ancom-subject.qzv

qiime composition ancom \
   --i-table comp-Baquedano-table-l6.qza \
   --m-metadata-file sample-metadata.tsv \
   --m-metadata-column site-name \
   --o-visualization l6-ancom-site-name.qzv






