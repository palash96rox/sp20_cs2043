#!/usr/bin/env bash

##
# Assignment 05
# February 24, 2020
# Palash A. [pa334]
##


## comstants ##
declare -A freq


## functions ##
function count_freq {
  declare -a temp
  temp=( $(awk '{ print $0 }' $1) )
  for idx in "${!freq[@]}"; do echo "$idx"; done 
  for i in ${temp[@]}; do
    if [ "${freq[${i,,}]}+isset" ];
      then (( ++freq[${i,,}] ))
      else freq+=([${i,,}]=1)
    fi
  done
}

function print_stats {
  for i in "${!freq[@]}"; do
    case "${freq[$i]}" in 
      "1" ) echo "'$i' occurs 1 time.";;
      "2" ) echo "'$i' occurs 2 times.";;
      "3" ) echo "'$i' occurs 3 times.";;
      "4" ) echo "'$i' occurs 4 times.";;
      * ) echo "'$i' occurs ${freq[$i]} times. Warning!!";;
    esac
  done
}


## start here ##

# error checking #
[ "${BASH_VERSINFO:-0}" -le 4 ] && \
  echo "Associative Arrays not supported" && exit
[ $# -ne 1 ] && echo "usage: $0 <filename>" && exit
[ ! -f $1 ] && echo "$0: $1: Not a file" && exit

# program body #
count_freq $1 && print_stats

# closing time #
unset freq