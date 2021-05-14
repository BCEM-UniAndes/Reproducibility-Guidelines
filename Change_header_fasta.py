#!/usr/bin/env python
# coding: utf-8

###About###
#Name:Change_header_fasta.py
#Author:Luisa Matiz
#Description:Script to change header of fasta
#Institution:Universidad de los Andes
#email:lf.matiz10@uniandes.edu.co
#Date:10-02-2019
#Version:Python3.0 or more

###Libraries### 
import sys
import argparse
import click

###Help###
parser = argparse.ArgumentParser()
parser=argparse.ArgumentParser(
    description='''Run this script as python Change_header_fasta.py file. ''',
    epilog="""It will produce a header assignation by sequence position in input fasta""")
parser.add_argument("file", help="input fasta file")
parser.add_argument("version", help="python 3 or more")
args = parser.parse_args()
print(args.file)
print (args.version)

###Comands###
#load the input file
f=(sys.argv[1])
file = open(sys.argv[1],'r')
labels=f.split(".")

#open the new fasta file without data  
handle = open(labels[0]+"_new"+".fasta","w")
line=file.readlines()

#Star the line by line revision of the header
count=0
for l in line:
    results=l.startswith(">")
    results 
    if results == True:
        count+=1
        handle.write(">"+str(count)+"_"+labels[0]+"\n") #change the header by input file name and position of the sequence in the input fasta
    else:
        handle.write(str(l))
#Close final file        
handle.close()