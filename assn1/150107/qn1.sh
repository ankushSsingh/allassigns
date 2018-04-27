#!/bin/bash
if [[ $# -lt 1 ]]
	then 
		echo Usage: Command Integer
		exit -1
fi
regex='^[0-9]+$'
if ! [[ "$1" =~ $regex ]]
	then
		echo Invalid Input \: Type something between 0 and 999999999
		exit -1
fi
N=$(echo $1 | sed 's/^0*//')
if [ $1 -eq 0 ]
	then 
	echo zero
	exit -1
fi
if [[ ${#N} -gt 9 ]]
	then
	    echo Very Large Input \: Type something Less than equal to 999999999
	    exit -1
fi
numtowords(){
if [ $1 -lt 20 ]
then
	case $1 in
	1) 
		printf "one ";;
	2) 
		printf "two ";;
	3)
		printf "three ";;
	4)
		printf "four ";;
	5)
		printf "five ";;
	6)
		printf "six ";;
	7)
		printf "seven ";;
	8)
		printf "eight ";;
	9)
		printf "nine ";;	
	10)
		printf "ten ";;
	11) 
		printf "eleven ";;
	12) 
		printf "twelve ";;
	13)
		printf "thirteen ";;
	14)
		printf "forteen ";;
	15)
		printf "fifteen ";;
	16)
		printf "sixteen ";;
	17)
		printf "seventeen ";;
	18)
		printf "eighteen ";;
	19)
		printf "nineteen ";;		
	esac
fi
case $(( $1/10 )) in
	2) 
		printf "twenty ";;
	3) 
		printf "thirty ";;
	4)
		printf "forty ";;
	5)
		printf "fifty ";;
	6)
		printf "sixty ";;
	7)
		printf "seventy ";;
	8)
		printf "eighty ";;
	9)
		printf "ninety ";;
esac
if [[ $(( $1/10 )) -gt 0 ]] && [[ ! $(( $1/10 )) -eq 1 ]]
	then
		numtowords $(( $1%10 ))
fi
}
convert(){
ones=$(( $1%100 ))
if [ $(( (( $1%10000000 ))/100000 )) -gt 0 ]
	then
		numtowords $(( $(( $1%10000000 ))/100000 ))
		printf "lakh "
fi
if [ $(( (( $1%100000 ))/1000 )) -gt 0 ]
	then
		numtowords $(( $(( $1%100000 ))/1000 ))
		#echo $(( $(( $N%100000 ))/1000 ))
		printf "thousand "
fi
if [ $(( (( $1%1000 ))/100 )) -gt 0 ]
	then
		numtowords $(( $(( $1%1000 ))/100 ))
		#echo $(( $(( $N%1000 ))/100 ))
		printf "hundred "
fi
numtowords $ones
}
if [ $(( $N/10000000 )) -gt 0 ]
	then
		convert $(( $N/10000000 ))
		printf "crore "
		convert $(( $N%10000000 ))
		exit -1
fi
convert $N
echo ""