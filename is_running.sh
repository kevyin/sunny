#!/bin/sh

qstat -j $1 -s r &> /dev/null 
echo $?
