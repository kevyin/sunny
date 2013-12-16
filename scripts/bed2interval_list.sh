#!/bin/bash

awk -F"\t" '{ OFS="\t" ; print $1,$2+1,$3,"+",$4 }' $1 | cat /share/ClusterShare/biodata/contrib/gi/gatk-resource-bundle/2.5/hg19/ucsc.hg19.dict - > $2
