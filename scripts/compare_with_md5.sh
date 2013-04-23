#!/usr/bash

md5file=$1
file=$2

tmp1=~/tmp/${file##*/}.tmp1
tmp2=~/tmp/${file##*/}.tmp2

md5sum $file | cut -f1 -d' ' > $tmp1
cut -f1 -d' ' ${md5file} > $tmp2 
diff $tmp1 $tmp2 
rm $tmp1 $tmp2
