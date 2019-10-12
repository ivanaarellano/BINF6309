# Methods

1.  Get reference genome

<!-- end list -->

``` r
#/usr/bin/env bash
#getGenome.sh
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_27/GRCh38.primary_assembly.genome.fa.gz
```

2.  Get NGS reads from SRA SRR6808334

<!-- end list -->

``` r
#!/usr/bin/env bash
fastq-dump --split-files SRR6808334 1>getNGS.log 2>getNGS.err &
```

3.  Trim the reads using Trimmomatic

<!-- end list -->

``` r
#!/usr/bin/env bash
# trimAll.sh
nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
-threads 1 -phred33 \
/home/arellano.i/BINF6309/VariantCalling/SRR6808334_1.fastq \
/home/arellano.i/BINF6309/VariantCalling/SRR6808334_2.fastq \
SRR6808334_1.paired.fastq \
SRR6808334_1.unpaired.fastq \
SRR6808334_2.paired.fastq \
SRR6808334_2.unpaired.fastq \
HEADCROP:0 \
ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36 \
1>trim.log 2> trim.err &
```

4.  Index the trimmed geneome

<!-- end list -->

``` r
#!/usr/bin/env bash
# indexGenome.sh
nice -n19 iit_store \
-G /home/arellano.i/BINF6309/VariantCalling \
-o GRCh38 \
1>indexGenomeIIT.log 2>indexGenomeIIT.err &
```

5.  Align the reads using BWA-MEM

<!-- end list -->

``` r
#!/usr/bin/env bash
# alignReads.sh
nice -n19 gsnap \
-A sam \
-D . \
-d GRCh38Build \
SRR6808334_1.paired.fastq \
SRR6808334_2.paired.fastq  \
1>SRR6808334.sam 2>SRR6808334.err &
```

6.  Run the DeepVariant to get VCF file

<!-- end list -->

``` r
sudo docker run \
  -v "${sam}":"/input" \
  -v "${VCFfiles}:/output" \
  gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \ **Replace this string with exactly one of the following [WGS,WES,PACBIO]**
  --ref=/input/ucsc.hg19.chr20.unittest.fasta \
  --reads=/input/NA12878_S1.chr20.10_10p1mb.bam \
  --regions "chr20:10,000,000-10,010,000" \
  --output_vcf=/output/output.vcf.gz \
  --output_gvcf=/output/output.g.vcf.gz \
  --num_shards=1 **How many cores the `make_examples` step uses. Change it to the number of CPU cores
```
