#!/bin/bash

##
# Assignment 04
# February 21, 2020
# Palash A. [pa334]
##

IFS='
' # Set delimiter to new line

# Check for number of arguments
if [ $# -ne 2 ]; then
  echo "usage: gitMetricsForUser username repository"; exit 1
fi
# Check for directory
if [ ! -d "$2" ]; then
  echo "gitMetricsForUser: $2: Not a directory"; exit 1
  else cd $2
fi

for i in $(git log --author=$1 --format=%B); do # Iterate over commit bodies of author
  bytes=`wc -m <<< $i | xargs` # Get number of bytes of body
  if [[ $max -le $bytes ]]; then
    max=$bytes
    msg=$i
  fi # Retrieved longest commit yet
done

# Display output
echo "User $1 has made $(git log --log-size --author=$1 | grep "log size" | wc -l | xargs) commits"
echo "Longest message:"
echo
echo $msg
