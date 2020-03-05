#!/usr/bin/env bash

####  CS2043 Final Backup Project  ####

# This file is a backup submission, in 
# case the main project is not finished
# in time. For details regarding that 
# project, please see `README`

# This program performs some prime ops
# on a number entered. Ther user may
# - check if a number is prime
# - find the closest prime
# - find a numbers prime factors
# - enter a number and be surprised!
# By default the program checks if the number is prime or not

####     see README for more       ####

function isprime {
  # [ `expr $1 % 2` -eq 0 ] && return 0
  n=`bc <<< "scale=0; sqrt(($1))+1"`; i=3
  while [ $i -le $n ]; do c=`expr $1 % $i`
    echo "$i >> $c"
    [ ! $c > 0 ] && break
    i=`expr $i + 1`
    echo " now $i "
  done
  # echo
  echo $i
  [ $i -eq $n ] && true || false
}

[ $# -eq 1 ] && if isprime $1
  then echo "prime"
  else echo "not"
fi

isprime $1 | echo
