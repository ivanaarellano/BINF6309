#!/usr/bin/env python

import itertools # imports itertools
from Bio import SeqIO # imports the BioPython SeqIO

FASTQleft= open("/scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq", "r") #opens left fastQ read
FASTQright= open("/scratch/AiptasiaMiSeq/fastq/Aip02.R2.fastq", "r") #opens right fastQ read
Interleaved= open("Interleaved.fasta", "w") # open interleave file for writing

#left= leftReads.readlines() #not needed use SeqIO instead
#right=rightReads.readlines() #"

def ZipFASTQ(FASTQleft, FASTQright, Interleaved): # makes a function that takes to reads and wirtes them into file
    FASTQleft= SeqIO.parse("/scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq", "fastq") #Parses through file in fastq format
    FASTQright = SeqIO.parse("/scratch/AiptasiaMiSeq/fastq/Aip02.R2.fastq", "fastq") #Parses through file in fastq format
    for left, right in itertools.izip(FASTQleft, FASTQright):  # for left and right use iter tools to zip left and right together
        # print(left, right) # prints left and right
        SeqIO.write(left, Interleaved, "fastq")
        SeqIO.write(right, Interleaved, "fastq")
    Interleaved.close()


#for left, right in itertools.izip(FASTQleft, FASTQright): # for left and right use iter tools to zip left and right together
    #print(left, right) # prints left and right
 #   SeqIO.write([left,right], Interleaved, "fastq")

    #Interleaved.close() only would write line by line not in FASTA format use Seq IO

#        Interleaved2.write(left) # writes the left in the new file
#        Interleaved2.write(right) # writes the right to the new file



if __name__ == '__main__': # allows function to be called
   ZipFASTQ(FASTQleft, FASTQleft, Interleaved) # calls the ZipFASTQ function with those variables
   print("Interleaving Done! Look at file Interleaved.fasta!") # prints message with file name
