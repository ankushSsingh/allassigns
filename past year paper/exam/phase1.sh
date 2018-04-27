#!/bin/bash

rm -f phase1.txt

while read line
do
   	echo $line >> "temp.txt"
	echo $line >> "temp.txt"
	echo $line >> "temp.txt"
	echo $line >> "temp.txt"
done < $1

sed '/^\s*$/d' temp.txt > phase1.txt 
rm -f temp.txt