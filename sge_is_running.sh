#!/bin/bash

res=0
for id in "$@"
do
    qstat -j $1 -s r &> /dev/null 
    res=$(($res + $?))
done

echo $res
