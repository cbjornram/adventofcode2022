#!/bin/bash

input="input.txt"
n=1
totalScore=0
score=0
IFS=' '

while read -r line; do
  read -a hand <<< "$line"

  # Is it equal
  if [ ${hand[0]} -eq ${hand[1]} ]
  then
    score=$((hand[1]+3))

  # Is it a loss
  elif ([ ${hand[0]} -gt ${hand[1]} ] && !([ ${hand[0]} -eq 3 ] && [ ${hand[1]} -eq 1 ])) || ([ ${hand[0]} -eq 1 ] && [ ${hand[1]} -eq 3 ])
  then
    score=${hand[1]}

  # Is it a win
  elif ([ ${hand[0]} -lt ${hand[1]} ] && [ ${hand[1]} -ne 1 ]) || ([ ${hand[0]} -eq 3 ] && [ ${hand[1]} -eq 1 ])
  then
    score=$((hand[1]+6))
  fi

  totalScore=$(($totalScore+$score))

  n=$(($n+1))
done < <(cat "$input" | tr AXBYCZ 112233)

echo "Total score: $totalScore"
