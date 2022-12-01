#!/bin/bash

input="input.txt"
n=1
mostCalories=0
secondMostCalories=0
thirdMostCalories=0
calorieCounter=0

while read -r line; do

  # Count amount of calories per elf
  if [ "$line" = "" ]
  then
    calorieCounter=0
  else
    calorieCounter=$(($calorieCounter+$line))
  fi

  # If calorieCounter has outgrown previous records, update the records
  if [ $calorieCounter -gt $mostCalories ]
  then
    thirdMostCalories=$secondMostCalories
    secondMostCalories=$mostCalories
    mostCalories=$calorieCounter
  elif [ $calorieCounter -gt $secondMostCalories ]
  then
    thirdMostCalories=$secondMostCalories
    secondMostCalories=$calorieCounter
  elif [ $calorieCounter -gt $thirdMostCalories ]
  then
    thirdMostCalories=$calorieCounter
  fi

  n=$(($n+1))
done < $input

totalCalories=$(($thirdMostCalories+$secondMostCalories+$mostCalories))
echo "Total amount of calories carried by the top three elfs: $totalCalories."
