#!/bin/bash


split -l 9 $1 phase2-
i=00
temp=$(ls phase2-*)
for file in $temp
do
    temp="phase2-"
    temp+="$i"
    mv "$file" "$temp"
    i=$((i+1))
done
