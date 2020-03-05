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
  n=`bc <<< "scale=0; sqrt(($1))"`; i=2
  while [ $i -le $n ]; do
    [ "$(($1%$i))" == "0" ] && break
    i=`expr $i + 1`
  done
  [ $i -eq $(($n+1)) ] && true || false
}

[ $# -eq 1 ] && if isprime $1
  then echo "prime"
  else echo "not"
fi
