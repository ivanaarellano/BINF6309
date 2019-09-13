#!/usr/bin/env python
from Bio import SeqIO #imorts SeqIO from Bio
import re #imports regular expression
for record in SeqIO.parse("/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta", "fasta"): #reads Drosphila fasta file
    if re.match("^\d{1,1}\D*$", record.id): #if sequence ID is either one digit or one digit followed by a non-digit 
        print(record.id) #print id
