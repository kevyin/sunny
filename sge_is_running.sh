#!/bin/bash

res=0
for id in "$@"
do
    qstat -j $id -s r &> /dev/null 
    if [ $? -eq 0 ]
    then
        echo 0
        exit 0
    fi
done

echo 1
exit 1
