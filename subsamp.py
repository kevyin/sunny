#!/usr/bin/python

import os, sys, random, itertools, io, subprocess, operator

def nextRead(file):
    file.readline()
    file.readline()
    file.readline()
    file.readline()

def skipRead(f,n):
    for i in range(0,n):
        nextRead(f)

def printRead(file, out):
    out.write(file.readline())
    out.write(file.readline())
    out.write(file.readline())
    out.write(file.readline())

samples = sys.argv[1].split(":")
#print file.tell()
#nextRead(file)
#print file.tell()
#printRead(file)
#for entry in file:
    #print entry


subsamp_perc = sys.argv[3]
sys.stderr.write("Subsampling " + str(subsamp_perc) + "% of reads" + "\n")

# get the total number of lines
#nlines = int(subprocess.check_output(["wc", "-l", sample]).split(" ")[0])
#sys.stderr.write("number of lines " + str(nlines) + "\n")
# estimate the number of reads
#nreads_est = nlines / 4
nreads_est = sum(1 for _ in open(samples[0])) / 4

sys.stderr.write("estimated number of reads " + str(nreads_est) + "\n")
# generate list of read positiions to write to
nget = int((float(subsamp_perc) / 100.0) * nreads_est )
sys.stderr.write("extracting " + str(nget) + " reads" + "\n")

## find the random reads to take. convert the line number to byte offset
positions__ = map((lambda _: random.randint(0,nreads_est-1)), range(0,nget))
positions_ = sorted(list(set(positions__)))
#sys.stderr.write(positions_)
advance = []
prev = 0
for i in range(0,len(positions_)):
    newpos = positions_[i]
    advance.append(newpos - prev)
    prev = newpos
#sys.stderr.write(advance )

## write
file1 = open(samples[0], mode='rb')
file2 = open(samples[1], mode='rb') if len(samples) > 1 else None

curpos= 0
#file.seek(curpos)
first = 0

out1 = open(sys.argv[2] + "_1.fastq", mode='ab')
out2 = open(sys.argv[2] + "_2.fastq", mode='ab') if len(samples) > 1 else None
for a in advance:
    skipRead(file1, a - first)
    if file2 is not None:
        skipRead(file2, a - first)

    printRead(file1, out1)
    if file2 is not None:
        printRead(file2, out2)
    first = 1
        
