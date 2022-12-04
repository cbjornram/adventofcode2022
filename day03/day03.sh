#!/bin/bash

input="input.txt"
n=1
prioritySum=0

while read -r line; do

  # Split rucksack into its two compartments and reset found item
  firstCompartment=${line:0:${#line}/2}
  secondCompartment=${line:${#line}/2}
  item=""

  # Loop through one compartment to find items that are in both (ignoring duplicates of same item)
  for (( i=0; i<${#firstCompartment}; i++ )); do
    if [[ "$secondCompartment" == *"${firstCompartment:$i:1}"* ]] && [ -z $item ]
    then
      item="${firstCompartment:$i:1}"

      # Convert items to priority values
      priority=$(printf %d\\n \'$item)
      if [ $priority -gt 91 ]
      then
        prioritySum=$((prioritySum+$priority-96))
      else
        prioritySum=$((prioritySum+$priority-38))
      fi
    fi
  done

  n=$(($n+1))
done < "$input"

echo "Sum of priority: $prioritySum"
