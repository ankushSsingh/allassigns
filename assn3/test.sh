#! /bin/bash
a=36
i=1
while [ $i -lt $a ]; do
	echo "'"$i"'" " : " $i > out.txt
	i=$((i+1))
done