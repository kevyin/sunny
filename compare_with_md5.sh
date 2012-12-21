#!/usr/bash

md5file=$1
file=$2

md5sum $file | cut -f1 -d' ' > ${file}.tmp1 
cut -f1 -d' ' ${md5file} > ${file}.tmp2 
diff ${file}.tmp1 ${file}.tmp2 
rm ${file}.tmp1 ${file}.tmp2
