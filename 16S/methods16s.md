# Moving pictures and Atacama soil microbiome tutorials

## Moving pcitures methods:

1.  Import the sequences reads

2.  Demultiplex the sequence by first matching the barcode sequences and
    the sample using the emp-single command since they are single ended
    reads

3.  Summarize the results of the demultiplexing step to see how many of
    the sequeneces from the sample were used, and to see how often they
    were used

option 1:

4.  Now quality control the data using DADA2 by denoising the data. Trim
    the first pair, and truncate the sequence at a particular positon in
    this case 120. Since the demultiplexing data showed high quality no
    trimming is needed.

5.  Using the stats artifcats from the dada2 portion run meta analysis
    to generate a table

6.  Make tables with the current data to see how many seqeunces were
    correlated wiht the samples as well as the dsitributions using the
    feature-table command. Get the feature IDs to use BLAST using the
    tabulate-seqs command

7.  Make a phylogenetic tree to find simillar features. To do this use
    mafft to align multiple sequences. Mask sequences that have high
    variablity (to remove even more noise). Now it makes a tree with the
    filtered sequences. This makes an unrooted tree. So now add a root
    at the midpoint of the unrooted tree.

8.  Run alpha and beta diversity analysis. Run the
    core-metrics-phylogenetic parameter. Each output is an alpha or beta
    result that measures commuinty richness and community dissimilarity
    respectively (qualitative and quantative). Using Emperor for the
    beta portion for plots. The p-sampling number was an estimate of the
    number of sequences per sample. This way only some samples will be
    analyzed.

9.  Look for association between alpha diversty data and metadata
    columns

10. Look at sample compostion using beta-group-signigicance. To see if
    the samples are more similar to each other or to other samples. Do
    it using the parwise command to look at particular groups.

11. Use the Emperor tool to look at PCoA plots using metadata. This will
    show us how time affects the sample and when it occurs.

12. Plot alpha diversity metrics at several depths. The average of the
    diversity values are ploted for the samples at the particualr
    dpeths.

13. The taxonomic analysis hleps determine the samples taxonomic
    compositon from the metadata.

14. Make bar plts of the taxonomic data.

15. Find the differential abundance using ANCOM to see what features are
    abundant. Make a compostion table.

16. Find the differnetial abundance at a certain taxonomic level

## Moving pictures results:

## Atacama soil microbiome methods:

1.  Retrive a subset of 10% of the data

2.  Make an artifact of the data

3.  Demultiplex the sequences by reading the reverse complement of the
    metadata

4.  Make a summary of how many actual sequences are used

5.  Look at the quality of the random portion of sequences (forward and
    reverse reads)

6.  Remove the noise of these reads based on results, trim 13 from the
    forward and reverse so they overlap, do this using DAD2

7.  Summarize the results of the reads after the nosie was removed

8.  Run stats on the denoised data

## Atacama soil microbiome results:
