author: Ivana Arellano output: md\_document: variant: gfm —

    #!/usr/bin/env Rscript
    # mergeKo.R
    # Load the kable library to display formatted tables
    library(knitr)
    # Load BLAST results as a table
    blastFile <- "/scratch/SampleDataFiles/Annotation/transcriptBlast.txt"
    keggFile <- "/scratch/SampleDataFiles/Annotation/kegg.txt"
    koFile <- "/scratch/SampleDataFiles/Annotation/ko.txt"

    blast <- read.table(blastFile, sep="\t", header=FALSE)
    # Set column names to match fields selected in BLAST
    colnames(blast) <- c("trans", "sp", "qlen", "slen", "bitscore", 
                         "length", "nident", "pident", "evalue", "ppos")
    # Calculate the percentage of identical matches relative to subject length
    blast$cov <- blast$nident/blast$slen
    # Filter for at least 50% coverage of subject(SwissProt) sequence
    blast <- subset(blast, cov > .5)
    # Check the blast table
    kable(head(blast))

<table>
<thead>
<tr class="header">
<th></th>
<th style="text-align: left;">trans</th>
<th style="text-align: left;">sp</th>
<th style="text-align: right;">qlen</th>
<th style="text-align: right;">slen</th>
<th style="text-align: right;">bitscore</th>
<th style="text-align: right;">length</th>
<th style="text-align: right;">nident</th>
<th style="text-align: right;">pident</th>
<th style="text-align: right;">evalue</th>
<th style="text-align: right;">ppos</th>
<th style="text-align: right;">cov</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>114</td>
<td style="text-align: left;">TRINITY_DN26_c0_g1_i1</td>
<td style="text-align: left;">P62489</td>
<td style="text-align: right;">462</td>
<td style="text-align: right;">172</td>
<td style="text-align: right;">261</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">121</td>
<td style="text-align: right;">89.63</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">97.04</td>
<td style="text-align: right;">0.7034884</td>
</tr>
<tr class="even">
<td>115</td>
<td style="text-align: left;">TRINITY_DN26_c0_g1_i1</td>
<td style="text-align: left;">Q7ZW41</td>
<td style="text-align: right;">462</td>
<td style="text-align: right;">172</td>
<td style="text-align: right;">259</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">120</td>
<td style="text-align: right;">88.89</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">97.04</td>
<td style="text-align: right;">0.6976744</td>
</tr>
<tr class="odd">
<td>126</td>
<td style="text-align: left;">TRINITY_DN26_c0_g2_i1</td>
<td style="text-align: left;">P62489</td>
<td style="text-align: right;">460</td>
<td style="text-align: right;">172</td>
<td style="text-align: right;">261</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">121</td>
<td style="text-align: right;">89.63</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">97.04</td>
<td style="text-align: right;">0.7034884</td>
</tr>
<tr class="even">
<td>127</td>
<td style="text-align: left;">TRINITY_DN26_c0_g2_i1</td>
<td style="text-align: left;">Q7ZW41</td>
<td style="text-align: right;">460</td>
<td style="text-align: right;">172</td>
<td style="text-align: right;">259</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">120</td>
<td style="text-align: right;">88.89</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">97.04</td>
<td style="text-align: right;">0.6976744</td>
</tr>
<tr class="odd">
<td>1529</td>
<td style="text-align: left;">TRINITY_DN122_c1_g1_i1</td>
<td style="text-align: left;">Q5R988</td>
<td style="text-align: right;">412</td>
<td style="text-align: right;">183</td>
<td style="text-align: right;">223</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">102</td>
<td style="text-align: right;">75.56</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">91.11</td>
<td style="text-align: right;">0.5573770</td>
</tr>
<tr class="even">
<td>1530</td>
<td style="text-align: left;">TRINITY_DN122_c1_g1_i1</td>
<td style="text-align: left;">Q8BU31</td>
<td style="text-align: right;">412</td>
<td style="text-align: right;">183</td>
<td style="text-align: right;">219</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">101</td>
<td style="text-align: right;">74.81</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">88.89</td>
<td style="text-align: right;">0.5519126</td>
</tr>
</tbody>
</table>

    # Load SwissProt to KEGG as a table
    kegg <- read.table(keggFile, sep="\t", header=FALSE)
    # Set the Swissprot to KEGG column names
    colnames(kegg) <- c("sp", "kegg")
    # Remove the up: prefix from sp column
    kegg$sp <- gsub("up:", "", kegg$sp)
    # Check the kegg table
    kable(head(kegg))

<table>
<thead>
<tr class="header">
<th style="text-align: left;">sp</th>
<th style="text-align: left;">kegg</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">P62489</td>
<td style="text-align: left;">rno:117017</td>
</tr>
<tr class="even">
<td style="text-align: left;">Q7ZW41</td>
<td style="text-align: left;">dre:324088</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Q8BU31</td>
<td style="text-align: left;">mmu:72065</td>
</tr>
<tr class="even">
<td style="text-align: left;">P61227</td>
<td style="text-align: left;">rno:170923</td>
</tr>
<tr class="odd">
<td style="text-align: left;">P10114</td>
<td style="text-align: left;">hsa:5911</td>
</tr>
<tr class="even">
<td style="text-align: left;">P28074</td>
<td style="text-align: left;">hsa:5693</td>
</tr>
</tbody>
</table>

    # Merge BLAST and SwissProt-to-KEGG
    blastKegg <- merge(blast, kegg)
    # Check the merged table
    kable(head(blastKegg))

<table>
<thead>
<tr class="header">
<th style="text-align: left;">sp</th>
<th style="text-align: left;">trans</th>
<th style="text-align: right;">qlen</th>
<th style="text-align: right;">slen</th>
<th style="text-align: right;">bitscore</th>
<th style="text-align: right;">length</th>
<th style="text-align: right;">nident</th>
<th style="text-align: right;">pident</th>
<th style="text-align: right;">evalue</th>
<th style="text-align: right;">ppos</th>
<th style="text-align: right;">cov</th>
<th style="text-align: left;">kegg</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">A0AJB9</td>
<td style="text-align: left;">TRINITY_DN9562_c0_g1_i1</td>
<td style="text-align: right;">1944</td>
<td style="text-align: right;">399</td>
<td style="text-align: right;">401</td>
<td style="text-align: right;">376</td>
<td style="text-align: right;">208</td>
<td style="text-align: right;">55.32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">73.94</td>
<td style="text-align: right;">0.5213033</td>
<td style="text-align: left;">lwe:lwe1683</td>
</tr>
<tr class="even">
<td style="text-align: left;">A0AKK8</td>
<td style="text-align: left;">TRINITY_DN8143_c2_g1_i1</td>
<td style="text-align: right;">1805</td>
<td style="text-align: right;">295</td>
<td style="text-align: right;">348</td>
<td style="text-align: right;">278</td>
<td style="text-align: right;">165</td>
<td style="text-align: right;">59.35</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">77.70</td>
<td style="text-align: right;">0.5593220</td>
<td style="text-align: left;">lwe:lwe2122</td>
</tr>
<tr class="odd">
<td style="text-align: left;">A0ALL5</td>
<td style="text-align: left;">TRINITY_DN9485_c0_g1_i1</td>
<td style="text-align: right;">1847</td>
<td style="text-align: right;">504</td>
<td style="text-align: right;">571</td>
<td style="text-align: right;">502</td>
<td style="text-align: right;">286</td>
<td style="text-align: right;">56.97</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">73.90</td>
<td style="text-align: right;">0.5674603</td>
<td style="text-align: left;">lwe:lwe2479</td>
</tr>
<tr class="even">
<td style="text-align: left;">A0AQ71</td>
<td style="text-align: left;">TRINITY_DN9157_c0_g1_i2</td>
<td style="text-align: right;">1369</td>
<td style="text-align: right;">206</td>
<td style="text-align: right;">213</td>
<td style="text-align: right;">202</td>
<td style="text-align: right;">104</td>
<td style="text-align: right;">51.49</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">70.79</td>
<td style="text-align: right;">0.5048544</td>
<td style="text-align: left;">dsi:Dsimw501_GD21160</td>
</tr>
<tr class="odd">
<td style="text-align: left;">A0AQ71</td>
<td style="text-align: left;">TRINITY_DN9157_c0_g1_i1</td>
<td style="text-align: right;">1393</td>
<td style="text-align: right;">206</td>
<td style="text-align: right;">213</td>
<td style="text-align: right;">202</td>
<td style="text-align: right;">104</td>
<td style="text-align: right;">51.49</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">70.79</td>
<td style="text-align: right;">0.5048544</td>
<td style="text-align: left;">dsi:Dsimw501_GD21160</td>
</tr>
<tr class="even">
<td style="text-align: left;">A0B562</td>
<td style="text-align: left;">TRINITY_DN7764_c0_g1_i1</td>
<td style="text-align: right;">496</td>
<td style="text-align: right;">142</td>
<td style="text-align: right;">162</td>
<td style="text-align: right;">139</td>
<td style="text-align: right;">79</td>
<td style="text-align: right;">56.83</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">73.38</td>
<td style="text-align: right;">0.5563380</td>
<td style="text-align: left;">mtp:Mthe_0033</td>
</tr>
</tbody>
</table>

    # Load KEGG to KO as a table
    ko <- read.table(koFile, sep="\t", header=FALSE)
    # Set column names
    colnames(ko) <- c("kegg", "ko")
    # Check the ko table
    kable(head(ko))

<table>
<thead>
<tr class="header">
<th style="text-align: left;">kegg</th>
<th style="text-align: left;">ko</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">mu:66105</td>
<td style="text-align: left;">ko:K06689</td>
</tr>
<tr class="even">
<td style="text-align: left;">lsv:3772835</td>
<td style="text-align: left;">ko:K02704</td>
</tr>
<tr class="odd">
<td style="text-align: left;">nma:NMA0736</td>
<td style="text-align: left;">ko:K04043</td>
</tr>
<tr class="even">
<td style="text-align: left;">mmi:MMAR_4089</td>
<td style="text-align: left;">ko:K02111</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hsa:8337</td>
<td style="text-align: left;">ko:K11251</td>
</tr>
<tr class="even">
<td style="text-align: left;">ath:AT1G04480</td>
<td style="text-align: left;">ko:K02894</td>
</tr>
</tbody>
</table>

    # Merge KOs
    blastKo <- merge(blastKegg, ko)
    # Check the blast ko table
    kable(head(blastKo))

<table>
<thead>
<tr class="header">
<th style="text-align: left;">kegg</th>
<th style="text-align: left;">sp</th>
<th style="text-align: left;">trans</th>
<th style="text-align: right;">qlen</th>
<th style="text-align: right;">slen</th>
<th style="text-align: right;">bitscore</th>
<th style="text-align: right;">length</th>
<th style="text-align: right;">nident</th>
<th style="text-align: right;">pident</th>
<th style="text-align: right;">evalue</th>
<th style="text-align: right;">ppos</th>
<th style="text-align: right;">cov</th>
<th style="text-align: left;">ko</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">aae:aq_1065</td>
<td style="text-align: left;">O67161</td>
<td style="text-align: left;">TRINITY_DN9495_c0_g1_i2</td>
<td style="text-align: right;">1244</td>
<td style="text-align: right;">342</td>
<td style="text-align: right;">316</td>
<td style="text-align: right;">342</td>
<td style="text-align: right;">172</td>
<td style="text-align: right;">50.29</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">70.76</td>
<td style="text-align: right;">0.5029240</td>
<td style="text-align: left;">ko:K00134</td>
</tr>
<tr class="even">
<td style="text-align: left;">aae:aq_484</td>
<td style="text-align: left;">O66778</td>
<td style="text-align: left;">TRINITY_DN9573_c0_g1_i1</td>
<td style="text-align: right;">1574</td>
<td style="text-align: right;">426</td>
<td style="text-align: right;">425</td>
<td style="text-align: right;">434</td>
<td style="text-align: right;">216</td>
<td style="text-align: right;">49.77</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">69.35</td>
<td style="text-align: right;">0.5070423</td>
<td style="text-align: left;">ko:K01689</td>
</tr>
<tr class="odd">
<td style="text-align: left;">aae:aq_679</td>
<td style="text-align: left;">O66907</td>
<td style="text-align: left;">TRINITY_DN9485_c0_g1_i1</td>
<td style="text-align: right;">1847</td>
<td style="text-align: right;">503</td>
<td style="text-align: right;">612</td>
<td style="text-align: right;">502</td>
<td style="text-align: right;">296</td>
<td style="text-align: right;">58.96</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">77.09</td>
<td style="text-align: right;">0.5884692</td>
<td style="text-align: left;">ko:K02111</td>
</tr>
<tr class="even">
<td style="text-align: left;">aae:aq_996</td>
<td style="text-align: left;">O67118</td>
<td style="text-align: left;">TRINITY_DN8020_c0_g1_i1</td>
<td style="text-align: right;">2247</td>
<td style="text-align: right;">632</td>
<td style="text-align: right;">633</td>
<td style="text-align: right;">605</td>
<td style="text-align: right;">329</td>
<td style="text-align: right;">54.38</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">74.55</td>
<td style="text-align: right;">0.5205696</td>
<td style="text-align: left;">ko:K04043</td>
</tr>
<tr class="odd">
<td style="text-align: left;">aag:5564556</td>
<td style="text-align: left;">Q1HQU2</td>
<td style="text-align: left;">TRINITY_DN9453_c0_g1_i1</td>
<td style="text-align: right;">1110</td>
<td style="text-align: right;">297</td>
<td style="text-align: right;">393</td>
<td style="text-align: right;">272</td>
<td style="text-align: right;">197</td>
<td style="text-align: right;">72.43</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">86.03</td>
<td style="text-align: right;">0.6632997</td>
<td style="text-align: left;">ko:K02932</td>
</tr>
<tr class="even">
<td style="text-align: left;">aag:5564556</td>
<td style="text-align: left;">Q1HQU2</td>
<td style="text-align: left;">TRINITY_DN8136_c0_g1_i1</td>
<td style="text-align: right;">999</td>
<td style="text-align: right;">297</td>
<td style="text-align: right;">386</td>
<td style="text-align: right;">294</td>
<td style="text-align: right;">209</td>
<td style="text-align: right;">71.09</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">82.99</td>
<td style="text-align: right;">0.7037037</td>
<td style="text-align: left;">ko:K02932</td>
</tr>
</tbody>
</table>

    tx2gene <- unique(subset(blastKo, select=c(trans, ko)))
    # Check the tx2gene table
    kable(head(tx2gene))

<table>
<thead>
<tr class="header">
<th style="text-align: left;">trans</th>
<th style="text-align: left;">ko</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">TRINITY_DN9495_c0_g1_i2</td>
<td style="text-align: left;">ko:K00134</td>
</tr>
<tr class="even">
<td style="text-align: left;">TRINITY_DN9573_c0_g1_i1</td>
<td style="text-align: left;">ko:K01689</td>
</tr>
<tr class="odd">
<td style="text-align: left;">TRINITY_DN9485_c0_g1_i1</td>
<td style="text-align: left;">ko:K02111</td>
</tr>
<tr class="even">
<td style="text-align: left;">TRINITY_DN8020_c0_g1_i1</td>
<td style="text-align: left;">ko:K04043</td>
</tr>
<tr class="odd">
<td style="text-align: left;">TRINITY_DN9453_c0_g1_i1</td>
<td style="text-align: left;">ko:K02932</td>
</tr>
<tr class="even">
<td style="text-align: left;">TRINITY_DN8136_c0_g1_i1</td>
<td style="text-align: left;">ko:K02932</td>
</tr>
</tbody>
</table>

    # Write as a csv file, excluding row.names
    write.csv(tx2gene, file="tx2gene.csv", row.names=FALSE)
