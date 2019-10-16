sudo docker run \
  -v "${sam}":"/input" \
  -v "${VCFfiles}:/output" \
  gcr.io/deepvariant-docker/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \ **Replace this string with exactly one of the following [WGS,WES,PACBIO]**
  --ref=/input/GRCh38.primary_assembly.genome.fa.gz \
  --reads=/input/GRCh38.bam \
  --regions "chr20:10,000,000-10,010,000" \
  --output_vcf=/output/output.vcf.gz \
  --output_gvcf=/output/output.g.vcf.gz \
  --num_shards=1 **How many cores the `make_examples` step uses. Change it to the number of CPU cores

