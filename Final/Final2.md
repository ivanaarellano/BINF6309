Instructions
------------

Insert your answers to the questions below in this Word document and
upload to the Blackboard Turnitin link. For open-ended questions,
copy-and-paste answers or answers typed word-for-word from web resources
or papers will not receive credit. You must paraphrase in your own words
to show understanding of the topic. Open-ended questions must be
answered in complete, grammatically correct sentences with APA citations
for external resources used. If you prefer to edit in RMarkdown to
facilitate citations and code debugging, feel free to download the .Rmd
file, insert your answers, knit to Word and upload the Word document. I
recommend the RMarkdown approach and think it will be easier, but either
way (Word or RMarkdown) will be fine. The default citation format is
fine if you use RMarkdown. Answers to open-ended questions will be
graded on completeness, clarity, grammar, spelling, formatting
(e.g. body text not all in bold, only headers in bold, etc.), and proper
citations. To be fair to everyone, do not send questions in Slack or
email asking for clarification of the questions. If the inability to ask
for clarification requires you to make assumptions before answering,
include those assumptions in your answer. There can be multiple correct
answers to some of the questions and if your answer is logical and
complete given the assumptions you make, you will receive credit for the
answer.

All questions have equal point value.

For questions asking for code, if you are not using RMarkdown you should
insert the code in the Word document

1.  What is linkage disequilibrium and how does it affect GWAS studies?

• Linkage disequilibrium is when the corresponding allele’s frequency
happens more or less often then by chance. For example, instead of
occurring 50% of the time it a occurs more or less than 50%. This is
more likely to happen when the genes are close together on the same
chromosome. This linkage disequilibrium effects GWAS studies by
affecting the variant results. Not all the variants are related to the
particular disease, but have linkage disequilibrium (Kruglyak
[2008](#ref-GWAS))

1.  The bash script below has multiple errors. Correct them. To make
    sure your answer is correct feel free to run the corrected script on
    the server.

\#!/usr/bin/env python3 \# trimAll.sh \#Initialize variable to contain
the directory of un-trimmed fastq files
fastqPath=“/scratch/AiptasiaMiSeq/fastq/” \#Initialize variable to
contain the suffix for the left reads leftSuffix=“.R1.fastq”
rightSuffix=“.R2.fastq” pairedOutPath=“Paired/”
unpairedOutPath=“Unpaired/” \#Loop through all the left-read fastq files
in $fastqPath for leftInFile in *f**a**s**t**q**P**a**t**h*\*leftSuffix
do \#Remove the path from the filename and assign to pathRemoved
pathRemoved=“${leftInFile/$fastqPath/}” \#Remove the left-read suffix
from
$pathRemoved and assign to suffixRemoved  sampleName="${pathRemoved/$leftSuffix/}"
nice -n19 java -jar
/usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE  
-threads 1 -phred33  
*f**a**s**t**q**P**a**t**h*sampleName$leftSuffix  
*f**a**s**t**q**P**a**t**h*sampleName$rightSuffix  
*p**a**i**r**e**d**O**u**t**P**a**t**h*sampleName$leftSuffix  
*u**n**p**a**i**r**e**d**O**u**t**P**a**t**h*sampleName$leftsuffix  
*p**a**i**r**e**d**O**u**t**P**a**t**h*sampleName$rightSuffix  
*u**n**p**a**i**r**e**d**O**u**t**P**a**t**h*sampleName$rightSuffix
HEADCROP:0  
ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36 done (Cock et al.
[2009](#ref-BioPy))

1.  Write RMarkdown code below to produce a github document with
    citations from bibliography.ris. When knitted the code should just
    print the citation for the .ris entry below. Assume bibliography.ris
    includes this:

TY - JOUR ID - Love DB - PubMed AU - Love, Michael I AU - Huber,
Wolfgang AU - Anders, Simon

\#!/usr/bin/env bash R -e “rmarkdown::render(‘bibliography.Rmd’,
output\_format=‘md\_document’)”

title: “bibliography” Author: Ivana Arellano output: md\_document
bibliography: bibliography.ris link-citations: yes

Overview The purpose of this questoin was to write a RMarkdwon code to
make a github document that has citations. (<span
class="citeproc-not-found" data-reference-id="Bib">**???**</span>)
References

1.  When counting items in a dictionary, why should you make sure the
    loop to iterate over the dictionary and print the count results is
    not within the loop that does the counting? What happens if you
    incorrectly put the iterate/print loop within the counting loop?

    • If you incorrectly put the iterate/print loop within the couniting
    loop only the last item will be counted instead of the entire count.

2.  Write a bash script below that will find files in the `FASTQ`
    directory (relative path) ending in .fq and print them to the
    console.

<!-- -->

       #!/usr/bin/env bash
    # echos files that end in .fq
    fastqPath="./FASTQ/"
    #Initialize variable to contain the suffix for .fq files
    Suffix=".fq"
    #Loop through all the .fq files in $fastqPath
    for leftInFile in $fastqPath*$Suffix
    do
       #Remove the path from the filename and assign to pathRemoved
       pathRemoved="${leftInFile/$fastqPath/}"
       #Remove the suffix from $pathRemoved
       sampleName="${pathRemoved/$Suffix/}"
       #Print $sampleName to see what it contains after removing the path
       echo $sampleName$Suffix
    done

1.  Summarize the basic steps in Differential Expression analysis
    starting with a directory of un-trimmed RNA-Seq reads and a genome.
    I’m looking for general descriptions of the steps, not code.

    • The first step of a Differential Expression analysis is to do
    quality control of the reads. In other words, trim the reads based
    on quality/filters. Then, build an index of the genome. Using salmon
    do a transcript quantification to estimate abundance/gene
    expression. Next, align the reads, and sort the reads. Once again
    check the quality of the reads. Now, normalize the sequence data.
    After, use the alignments to perform statistical analysis using
    DESeq2. Finally, visualize the data. (<span
    class="citeproc-not-found" data-reference-id="DefEx">**???**</span>)

2.  What is a guide tree, how is it used in multiple sequence
    alignments, and how does its accuracy affect the alignment?

    • A guide tree helps guides sequences based on pairwise alignment
    distance. It affects the accuracy of alignment if errors on
    introduced when either the guide tree is built, or when distance
    measurements are done. (Chatzou et al. [2015](#ref-MSA))

3.  Describe MCMC methods in a few sentences in your own words.

• The MCMC a way to predict complex posterior distributions (not a
perfect shaped curve). However, first, parse out into simple portions.
Then, simulate random data to construct likely parameters from each
individual portion (Monde Carlo part). These simulated data have fixed
probabilities. As a result, the more probable data stay within a certain
region. This region will set the groundwork for the complex posterior
distribution. Then, perform statistical analysis on the set of randomly
simulated data which will then approximate the best model of a true
complex posterior distribution. In other words, a MCMC is used.
Furthermore, a chain of steps that goes through all possible models
using random samples in an order that is only determined by the more
likely models that model the complex posterior distribution (Hamra,
MacLehose, and Richardson [2013](#ref-MCMC))

1.  What type of object would sequences need to be in the piece of code
    shown below?

    • In the code shown below sequences would need to be in
    Bio.SeqRecord/Bio.Seq class object in (<span
    class="citeproc-not-found"
    data-reference-id="BiopPy">**???**</span>)

SeqIO.write(sequences, “kmers.fasta”, “fasta”)

1.  Summarize in your own words the differences between paired-end and
    mate-pair reads. Why are mate-pairs sometimes referred to as “inward
    pairs”?

• Paired-end reads takes small DNA fragments (200-800bp) and sequences
the two opposite ends of a DNA strand. As a result, two reads are
produced one forward and one in reverse. That way they are easily
aligned. On the other hand, mate-pair reads takes larger DNA fragments
(2-5kb) it the biotinylates the ends of the fragments. It then combines
the two ends to make a circularized DNA strand. After, the circular
strand is fragmented again into smaller pieces (200-600bp). Resulting,
in the biotinylated fragments sequenced together into pair-end reads.
However, since the biotinylated portions were from opposite ends, but
are sequenced together resulting in either an reverse forward “outward
pairs” or a forward reverse “inward pairs” caused by the circular strand
shape. (Goodwin, McPherson, and McCombie [2016](#ref-NGS))

1.  Define posterior distribution in your own words.

• Posterior distribution is the probability of something that takes into
account all known data as well as the likelihood of it happening. For
example, a coin that has heads and tails the probability that you will
get heads or tails is 0.5. However, let say the coin was flipped ten
times already and they have all landed in head. The combination of these
two things make the posterior distribution. (Hamra, MacLehose, and
Richardson [2013](#ref-MCMC))

1.  What is the name for the version of a variant found in the reference
    genome?

• A variant version found in the reference genome is a reference allele.
(Kruglyak [2008](#ref-GWAS))

1.  Summarize the key differences between 16s sequencing and shotgun
    metagenomic sequencing. What are the pros and cons of each?

• 16s sequencing looks for bacterial species in a sample particularly in
16s ribosomal gene. This gene has two portions. A portion that is very
similar between different species, and a portion that is very variable.
As a result, if this gene is sequenced then the entire DNA does not need
to be sequenced. Once the 16s genes are sequenced, they are clustered
based on similarity. If they are very similar they are grouped as the
same species. Then, by looking at relative abundance and comparing a
control and diseased group to see if there are any differences. On the
other hand, shotgun metagenomic sequencing looks at the different
DNA/RNA sequence in a sample. Shotgun metagenomic sequencing provides
detailed characterization however, translating it to the clinic is very
difficult, additionally it takes more time than a 16s sequencing.
Additionally, 16s sequencing provides gene markers in several reference
databases. (Kuczynski et al. [2011](#ref-16s), @Meta)

1.  What are the limitations of targeted versus whole-genome or
    whole-exome profiling of cancer mutations?

• Targeted profiling only looks at a reduced are of the genome. As a
result, it decreases the ability to find as many mutations in a
cancerous population. However, targeted profiling is inexpensive and
fast so, it is useful in studying a large population. (Network et al.
[2013](#ref-Cancer))

1.  Why is it better to translate a nucleotide sequence to an amino acid
    sequence for multiple sequence alignment?

• It is better to translate a nucleotide sequence to an amino acid
sequence for multiple sequence alignment for several reasons. One is
that the data is reduced to 1/3 since thee nucleotides or one codon is
equivalent to one amino acid. As a result, multiple sequence alignment
is faster and more accurate since mismatches are reduced since several
codons can produce the same amino acid. Leading to a faster and more
accurate result. (Chatzou et al. [2015](#ref-MSA))

1.  Why might a SNP be correlated with a disease or trait, despite not
    having any causative effect on the disease or trait?

• SNP can be correlated with a disease or trait despite not having any
causative effect on the disease because correlation does not indicate
causation. However, this correlation can help understand the disease
better. Perhaps, the region where the SNPs are occurring is important,
or they can serve as targets for therapy. (Kruglyak [2008](#ref-GWAS))

1.  Do GWAS studies based on commercial SNP arrays generally identify
    causal variants? Why or why not?

• GWAS studies based on commercial SNP arrays generally identify casual
variants, since these variants may have an indirect or direct effect in
disease prognosis, and treatment. Additionally, they can help target
genes that are related to disease. (Kruglyak [2008](#ref-GWAS))

1.  How does scoring of alignment matches differ for nucleotide
    sequences versus amino acid sequences?

• Scoring of alignment matches differ depending if the input is
nucleotide sequences versus amino acid sequences. In a nucleotide
alignment there will be more mismatches than in an amino acid sequence.
Codons or three nucleotides can correspond to one amino acid. As a
result, alignments of amino acid sequences are more similar compared
alignments of nucleotide sequences. (Chatzou et al. [2015](#ref-MSA))

1.  In terms of metagenomic shotgun sequencing, what is enrichment, and
    how can it affect the downstream analysis of the data?

• Enrichment in metagenomic shot gun sequencing is a way to figure out
what genes are overly expressed that could be correlated with disease.
It can affect downstream analysis of the data if the enrichment is
overly done that it will introduce false positives and bias. (Quince et
al. [2017](#ref-Meta) @ClinicalMeta)

1.  Briefly define haplotype in your own words.

• When a set of alleles are passed down from one parent to its offspring
it is known as a haplotype. A group of SNPs is also known as a
haplotype, since they are inherited together. (Kruglyak
[2008](#ref-GWAS))

1.  Do multiple sequence aligners score every possible path to produce
    the optimal alignment? Explain why or why not.

• Multiple sequence aligners do not score every possible path to produce
the optimal alignment because the time to run would depend on the number
of sequences and the length of the sequences. As a result, it would take
a very long time to score every possible path. Instead, they use
heuristic approach. These approaches are faster, but they present their
own set of issues. One common issue is the local minima. (Chatzou et al.
[2015](#ref-MSA))

1.  Describe the problem of being “trapped in a local minima” for
    progressive alignment methods.

• Trapped in a local minima in a progressive alignment happens when a
group of sequences are very similar effect the complete alignment due to
its “greedy” alignment method. In other words, these similar sequences’
best alignment does not correlate with its pairwise alignment. These
mistakes cannot be fixed later on. (Chowdhury and Garai 2017) (Hamra,
MacLehose, and Richardson [2013](#ref-MCMC))

1.  How do germline and somatic mutations differ in terms of their
    effect on cancer risk and prognosis?

• Germline mutations in BRCA1 and BRCA2 increase the risk of cancer.
Other examples include TP53 gene, and PTEN. A germline mutation in the
TP53 gene can cause Li-Fraumeni syndrome. While a germline mutation in
the PTEN gene can cause Cowden syndrome which increases the risk of
certain cancers. On the other hand, in acute myeloid leukemia (AML),
only small portion of the genes that caused mRNA truncation variants
were identified in the AML group meaning these germline mutations were
not relevant to AML. Furthermore, somatic mutations were more predictive
of prognosis in AML. Moreover, somatic mutations particularly, in genes
that control cell division are associated with cancer risk and
prognosis. (Network et al. [2013](#ref-Cancer))

1.  The number of possible phylogenetic trees for a given alignment is
    quite large. Do most phylogenetics packages evaluate every possible
    tree? If not, why not and how is this handled?

• No most phylogenetic packages do not evaluate every possible tree.
Instead, these programs look for the most optimal tree. In order to find
an optimal tree, they use several methods. The maximum parsimony
approach looks at the simplest tree or the tree with the shortest
branches, meaning less changes, as the optimal tree. Another method is
the neighbor-joining. This method uses a distance matrix and arranges
them from leas to most distance. Moreover, the Bayesian approach is a
statistical approach. It is more math heavy and requires extra
information and several sources. It is based on probability and Bayesian
interference. The BEAST2 program uses this method. Finally, the maximum
likelihood approach compares the likelihood of certain changes that can
occur. (Yang and Rannala [2012](#ref-Phylo))

1.  What alignment methods are used to produce the guide tree for
    progressive alignments?

• In order to produce a guide tree for progressive alignment, a pairwise
alignment is done with the two most similar sequences. Then these
sequences are then compared to the next most similar sequence until
reaching the least similar sequence. (Chowdhury and Garai 2017) (Yang
and Rannala [2012](#ref-Phylo))

1.  How are pairwise distances between sequences used for iterative
    alignment methods?

• Pairwise distances between sequences are used for iterative alignment
methods by first finding the two most similar sequences and then
creating/merging a profile of these sequences and comparing the next
most similar sequence, to that profile. Then this sequence is added to
the profile and the next most similar sequence is aligned. Once all
sequences have been aligned, a complete alignment is done. (Chowdhury
and Garai 2017, Jin Xiong 2006) (Chatzou et al. [2015](#ref-MSA))

1.  Under maximum parsimony, what must be true of a site in an alignment
    for that site to be informative for tree comparison?

• In order for a site to be informative for tree comparison under
maximum parsimony an alignment be in the simplest form with the least
common ancestors. In other words, the shortest tree with the least
homoplasy. (Yang and Rannala [2012](#ref-Phylo))

1.  What type of substitution involves the interchange of a purine and a
    pyrimidine?

• A transversion substitution happens when a purine interchanges with a
pyrimidine. (Yang and Rannala 2012) (Yang and Rannala
[2012](#ref-Phylo))

1.  Are somatic variations heritable? Explain why or why not.

• Somatic variations are not heritable, because these cells are
independent form germ line cell division. Germinal mutations are
heritable since these mutations are present in the germ line. (Network
et al. [2013](#ref-Cancer))

1.  Summarize in your own words the key differences, pros, and cons
    between untargeted metagenomic NGS and 16S sequencing.

• 16S sequencing, looks at small portion of ribosomal RNA gene in
bacteria species that is highly conserved and evolves slowly within
species making it a “targeted” sequencing technique. Additionally, it
has a region with a lot of variation. As a result, sequence alignment is
straightforward. Making an easy, cheap, and fast tool. However, some
species might have very similar 16s it is difficult to discriminate, and
they are often clustered together. As a result, it is hard to have an in
depth understanding of the entire microbiome. However, it can detect
certain organisms involved in infections, and can monitor evolutionary
changes in viruses. (Kuczynski et al. [2011](#ref-16s))

• Untargeted metagenomics NGS, sequences the entire DNA/RNA or both.
This gives a deeper dive into the entire genome. As a result, it has the
potential to identify many pathogens within one assay. Additionally,
since untargeted metagenomics NGS sequencing looks at the entire genome,
it can identify particular strains that can cause an outbreak. However,
even though the amount of data produced is very informative a custom
pipeline is needed to validate and understand the data. Additionally, it
is expensive to perform an untargeted metagenomics NGS, and it takes a
long amount of time. (Goodwin, McPherson, and McCombie [2016](#ref-NGS))

Chatzou, Maria, Cedrik Magis, Jia-Ming Chang, Carsten Kemena, Giovanni
Bussotti, Ionas Erb, and Cedric Notredame. 2015. “Multiple Sequence
Alignment Modeling: Methods and Applications.” *Briefings in
Bioinformatics* 17 (6): 1009–23. <https://doi.org/10.1093/bib/bbv099>.

Chiu, Charles Y., and Steven A. Miller. 2019. “Clinical Metagenomics.”
*Nature Reviews Genetics* 20 (6): 341–55.
<https://doi.org/10.1038/s41576-019-0113-7>.

Cock, Peter J. A., Tiago Antao, Jeffrey T. Chang, Brad A. Chapman, Cymon
J. Cox, Andrew Dalke, Iddo Friedberg, et al. 2009. “Biopython: Freely
Available Python Tools for Computational Molecular Biology and
Bioinformatics.” *Bioinformatics* 25 (11): 1422–3.
<https://doi.org/10.1093/bioinformatics/btp163>.

Goodwin, Sara, John D. McPherson, and W. Richard McCombie. 2016. “Coming
of Age: Ten Years of Next-Generation Sequencing Technologies.” *Nature
Reviews Genetics* 17 (6): 333–51. <https://doi.org/10.1038/nrg.2016.49>.

Hamra, Ghassan, Richard MacLehose, and David Richardson. 2013. “Markov
Chain Monte Carlo: An Introduction for Epidemiologists.” *International
Journal of Epidemiology* 42 (2): 627–34.
<https://doi.org/10.1093/ije/dyt043>.

Kruglyak, Leonid. 2008. “The Road to Genome-Wide Association Studies.”
*Nature Reviews Genetics* 9 (4): 314–18.
<https://doi.org/10.1038/nrg2316>.

Kuczynski, Justin, Jesse Stombaugh, William Anton Walters, Antonio
González, J. Gregory Caporaso, and Rob Knight. 2011. “Using QIIME to
Analyze 16S rRNA Gene Sequences from Microbial Communities.” *Current
Protocols in Bioinformatics* 36 (1): 10.7.1–10.7.20.
<https://doi.org/10.1002/0471250953.bi1007s36>.

Network, Cancer Genome Atlas Research, Timothy J. Ley, Christopher
Miller, Li Ding, Benjamin J. Raphael, Andrew J. Mungall, A. Gordon
Robertson, et al. 2013. “Genomic and Epigenomic Landscapes of Adult de
Novo Acute Myeloid Leukemia.” *The New England Journal of Medicine* 368
(22): 2059–74. <https://doi.org/10.1056/NEJMoa1301689>.

Quince, Christopher, Alan W. Walker, Jared T. Simpson, Nicholas J.
Loman, and Nicola Segata. 2017. “Shotgun Metagenomics, from Sampling to
Analysis.” *Nature Biotechnology* 35 (9): 833–44.
<https://doi.org/10.1038/nbt.3935>.

Yang, Ziheng, and Bruce Rannala. 2012. “Molecular Phylogenetics:
Principles and Practice.” *Nature Reviews Genetics* 13 (5): 303–14.
<https://doi.org/10.1038/nrg3186>.
