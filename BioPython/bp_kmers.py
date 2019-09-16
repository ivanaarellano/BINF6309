#!/usr/bin/env python3
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
Sequence = "" # make empty variable that will hold all sequences
TempFile = open("TempFile.txt", "w") # makes temp file
sequences = list() # start empty array
import re #imports regular expression
import itertools

for record in SeqIO.parse('/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta', "fasta"): #reads Drosphila fasta file change for actual homework
    if re.match("^\d{1,1}\D*$", record.id): #if sequence ID is either one digit or one digit followed by a non-digit
        chid, reseq= (record.id), (record.seq) # makes a variable with the chromosome ID number and sequence
        Sequence = Sequence + "/n" + chid + "/n" + reseq # makes a sequence the ID and the actual sequence
        Sequence = str(Sequence) # Makes sequence a string
        TempFile.write(Sequence) # writes the sequence into temp file














if dna_string.mode == "r": # if file is open for reading
    contents = dna_string.read() # reads the file and names the contents in file contents
    for kmer in KmersList: # checks if possible kmer in dictionary
        if (kmer, contents):# kmer in contents
           start = 0 # starts at positon 0  
           window_size = 6 #window size
           end = len(contents) - window_size + 1  # Slide along dna string from beginning to end
        if kmer in kmer_counts: # if in dictionary
           kmer_counts[kmer] +=1 #add one
        else: # if not
           kmer_counts[kmer] = 1 # leave it at one






