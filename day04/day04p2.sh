#!/bin/bash

input="input.txt"
n=1
numberOfPairs=0

while read -r line; do

  # Get section borders for each pair
  IFS=',' read -a elf <<< "$line"
  IFS='-' read -a elf0Section <<< "${elf[0]}"
  IFS='-' read -a elf1Section <<< "${elf[1]}"

  # Find section overlaps
  if [ ${elf0Section[1]} -ge ${elf1Section[0]} ] && [ ${elf0Section[0]} -le ${elf1Section[1]} ]
  then
    numberOfPairs=$(($numberOfPairs+1))
  fi

  n=$(($n+1))
done < "$input"

echo "Number of poorly planned pairs: $numberOfPairs"
