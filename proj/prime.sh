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

function printmenu { clear
  echo "-------  MENU  -------"
  echo "1. check if prime"
  echo "2. find closest prime"
  echo "3. find prime factors"
  echo -n "What you choose? "
}

if [ $# -eq 1 ]; then
  if isprime $1; then echo "prime"
    else echo "not"; fi
  else printmenu
    read n; case $n in
      "1") echo -n "num? " && read x
        if isprime $x; then echo "prime"
          else echo "not"; fi
        ;;
      "2") echo -n "num? "; read x
        if isprime $x; then echo "$x is already prime."
          else a=$(($x-1)) && while ! isprime $a; do
              a=$(($a-1)); done # lower prime
            b=$(($x+1)) && while ! isprime $b; do
              b=$(($b+1)); done # higher prime
            if [ $(($x-$a)) -eq $(($b-$x)) ]; then echo \
              "Special case: $x is the mean of $a and $b"
              else [ $(($x-$a)) -le $(($b-$x)) ] && \
                echo "-: $a" || echo "+: $b"; fi
        fi;;
      "3") echo -n "TODO"
        ;;
      *) echo "invalid option. please restart." && exit;;
    esac
fi