#!/bin/bash

# ************* Disclaimer *************
#
# This was the first time I ever needed arrays of arrays in Bash
# (which, as I quickly realised, does not exist in version 3.2).
# Starting with this challanges way to late in the day for proper
# research, I chose to do it the ugly way.
#
# But hey it works!
#
# **************************************

input="input.txt"
n=1
containersSaved=""
containerBeingMoved=""

# Cheating to save myself some evening time...
declare -a containerStack1=("S" "Z" "P" "D" "L" "B" "F" "C")
declare -a containerStack2=("N" "V" "G" "P" "H" "W" "B")
declare -a containerStack3=("F" "W" "B" "J" "G")
declare -a containerStack4=("G" "J" "N" "F" "L" "W" "C" "S")
declare -a containerStack5=("W" "J" "L" "T" "P" "M" "S" "H")
declare -a containerStack6=("B" "C" "W" "G" "F" "S")
declare -a containerStack7=("H" "T" "P" "M" "Q" "B" "W")
declare -a containerStack8=("F" "S" "W" "T")
declare -a containerStack9=("N" "C" "R")

while read -r line; do

  # Find when the initial storage of containers have been done
  if [ -z "$line" ] || [ "${line:0:1}" == "1" ]
  then
    containersSaved="true"
    continue
  fi

  # Move containers
  if [ "$containersSaved" != "" ]
  then
    IFS=' ' read -a instruction <<< $line

    i=1
    while [[ $i -le ${instruction[1]} ]]
    do
      case "${instruction[3]}" in
        "1")
          containerBeingMoved=${containerStack1[${#containerStack1[@]}-1]}
          unset containerStack1[${#containerStack1[@]}-1]
          ;;

        "2")
          containerBeingMoved=${containerStack2[${#containerStack2[@]}-1]}
          unset containerStack2[${#containerStack2[@]}-1]
          ;;

        "3")
          containerBeingMoved=${containerStack3[${#containerStack3[@]}-1]}
          unset containerStack3[${#containerStack3[@]}-1]
          ;;

        "4")
          containerBeingMoved=${containerStack4[${#containerStack4[@]}-1]}
          unset containerStack4[${#containerStack4[@]}-1]
          ;;

        "5")
          containerBeingMoved=${containerStack5[${#containerStack5[@]}-1]}
          unset containerStack5[${#containerStack5[@]}-1]
          ;;

        "6")
          containerBeingMoved=${containerStack6[${#containerStack6[@]}-1]}
          unset containerStack6[${#containerStack6[@]}-1]
          ;;

        "7")
          containerBeingMoved=${containerStack7[${#containerStack7[@]}-1]}
          unset containerStack7[${#containerStack7[@]}-1]
          ;;

        "8")
          containerBeingMoved=${containerStack8[${#containerStack8[@]}-1]}
          unset containerStack8[${#containerStack8[@]}-1]
          ;;

        "9")
          containerBeingMoved=${containerStack9[${#containerStack9[@]}-1]}
          unset containerStack9[${#containerStack9[@]}-1]
          ;;

        *)
          echo "Error: Could not find FROM container stack"
          ;;
      esac

      case "${instruction[5]}" in
        "1")
          containerStack1+=("$containerBeingMoved")
          ;;

        "2")
          containerStack2+=("$containerBeingMoved")
          ;;

        "3")
          containerStack3+=("$containerBeingMoved")
          ;;

        "4")
          containerStack4+=("$containerBeingMoved")
          ;;

        "5")
          containerStack5+=("$containerBeingMoved")
          ;;

        "6")
          containerStack6+=("$containerBeingMoved")
          ;;

        "7")
          containerStack7+=("$containerBeingMoved")
          ;;

        "8")
          containerStack8+=("$containerBeingMoved")
          ;;

        "9")
          containerStack9+=("$containerBeingMoved")
          ;;

        *)
          echo "Error: Could not find TO container stack"
          ;;
      esac
      containerBeingMoved=""

      i=$(($i+1))
    done
  fi

  n=$(($n+1))
done < "$input"

echo "Resulting top containers:${containerStack1[${#containerStack1[@]}-1]}${containerStack2[${#containerStack2[@]}-1]}${containerStack3[${#containerStack3[@]}-1]}${containerStack4[${#containerStack4[@]}-1]}${containerStack5[${#containerStack5[@]}-1]}${containerStack6[${#containerStack6[@]}-1]}${containerStack7[${#containerStack7[@]}-1]}${containerStack8[${#containerStack8[@]}-1]}${containerStack9[${#containerStack9[@]}-1]}"
