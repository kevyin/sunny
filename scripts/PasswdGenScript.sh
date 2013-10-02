#!/bin/ksh
# Random password generator.
# Pass in the length of the password to generate.
#
# by Michael Roth, 2006
#set -x 

RANDOM=$$

if [ "$#" -ne "1" ]; then
 echo "Usage: ${0##*/} PASSWORDLENTGH"
 echo "\te.g. ${0##*/} 8"
 exit 1
fi

if [ ! -z `echo "$1" | tr -d "[:digit:]"` ]; then
 echo "Usage: ${0##*/} PASSWORDLENTGH"
 echo "\te.g. ${0##*/} 8"
 echo "\nError: PASSWORDLENGTH must be a number!"
 exit 1
fi

if [ ! "$1" -gt "0" ]; then
 echo "Usage: ${0##*/} PASSWORDLENTGH"
 echo "\te.g. ${0##*/} 8"
 echo "\nError: PASSWORDLENGTH must be greater then 0!"
 exit 1
fi

#
# Main
#
rm password_value.txt
j=0;
echo "How many passwords do you want to generate?"
read y;
while [ $j -ne $y ]
do
# Modify STRING as source
STRING='q w e r t y u i p a s d f g h j k l z x c v b n m Q W E R T Y U I P A S D F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9  _ -  = '
##STRING='q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0 _ - ! ? = '

# password length
LENGTH="$1"

typeset -i index
index=1

IFS_SAV="$IFS"
IFS=" "

# Put $STRING in an array
for i in `echo $STRING`
do
 array[$index]=$i
 ((index=index+1))
done

string_len=${#array[*]}

IFS="$IFS_SAV"

typeset -i pwlen
pwlen=0

PASS=""

while [ "$pwlen" -lt "$LENGTH" ]
do
    index=$(($RANDOM % $string_len))
    PASS="$PASS${array[$index]}"
    ((pwlen=pwlen+1))
done

echo "Your password: $PASS"
#How manyprintf $PASS >>password_value.txt
#printf "\n" >>password_value.txt
#exit 0
j=`expr $j + 1`;
#echo The value of j= $j;
done





##############################################################################
### This script is submitted to BigAdmin by a user of the BigAdmin community.
### Sun Microsystems, Inc. is not responsible for the
### contents or the code enclosed. 
###
###
### Copyright 2007 Sun Microsystems, Inc. ALL RIGHTS RESERVED
### Use of this software is authorized pursuant to the
### terms of the license found at
### http://www.sun.com/bigadmin/common/berkeley_license.html
##############################################################################



