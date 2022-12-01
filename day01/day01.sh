#!/bin/bash

input="input.txt"
n=1
mostCalories=0
calorieCounter=0

while read -r line; do

  # Count amount of calories per elf
  if [ "$line" = "" ]
  then
    calorieCounter=0
  else
    calorieCounter=$(($calorieCounter+$line))
  fi

  # If calorieCounter has outgrown previous record, update the record
  if [ $calorieCounter -gt $mostCalories ]
  then
    mostCalories=$calorieCounter
  fi

  n=$(($n+1))
done < $input

echo "Elf with most calories carries $mostCalories calories."
