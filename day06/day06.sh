#!/bin/bash

read -r input<"input.txt"
char1=""
char2=""
char3=""
markerPosition=0

for (( i=0; i<${#input}; i++ )); do
  if (! $(echo "$char3$char2$char1${input:$i:1}" | grep -q '\(.\).*\1')) && [ $i -gt 3 ]
  then
    markerPosition=$(($i+1))
    break
  fi

  char3=$char2
  char2=$char1
  char1=${input:$i:1}
done

echo "Marker at: $markerPosition"
