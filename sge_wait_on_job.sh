#!/bin/bash

_jobs=$@
echo "Waiting on these jobs:"
echo $_jobs
is_running=0
while [ $is_running -eq 0 ]
do
    is_running=`~/dev/sunny/is_running.sh ${_jobs[@]}`
    #echo $is_running
    sleep 1
done
