#!/bin/bash
directory(){
	for f in "$1"/*
	do
		if [[ -f $f ]]
			then
				awk -f awkqn1.awk $f >> out.txt
		elif [[ -d $f ]]; then
			directory $f		
		fi				
	done
}
directory $1
awk 'BEGIN{sum=0; sum1=0}{sum=sum+$1 ;sum1=sum1+$2}END{print sum,"lines of comments"; print sum1," quoted strings"}' out.txt
 