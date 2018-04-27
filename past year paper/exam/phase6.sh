#!/bin/bash

rm -f phase6.txt
awk -F"\t" '{print $2}' devas.txt | sort >> temp.txt

sed '/^\s*$/d' temp.txt >> phase6.txt
rm -f temp.txt

