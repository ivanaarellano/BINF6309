#!/usr/bin/env python
#translate_APOE.py
#Translate fasta file to amino acid sequence using bio python
from Bio.Seq import Seq
from Bio import SeqIO
from Bio import SeqRecord
from Bio.SeqRecord import SeqRecord
apoe_aa = open("apoe_aa.fasta", "a") # open apoe_aa file for appending
NEWtrans = [] #list with new translated
with open("/home/arellano.i/BINF6309/MSA/APOE_refseq_transcript.fasta", "rU") as APOE: # opens file for reading with reference sequence
    for record in SeqIO.parse(APOE, "fasta"): # makes a loop for the records in the sequence by parsing
        sequence = record.seq #variable for the sequences
        Trancribed = sequence.transcribe() # transcribes the sequence
        Translated = Trancribed.translate() # translates the sequence
        TRANS = SeqRecord(seq = Translated, id = "trans_" + record.id, description = "translation") # makes the translated sequences with FASTA info)
        NEWtrans.append(TRANS)# appends the list to add the TRANS records
        #print(TRANS)
    SeqIO.write(NEWtrans, "apoe_aa.fasta", "fasta") # writes the sequences in fasta format 

















