#!/bin/bash
address=$1
countTotalLines=0
countTotalIntegers=0
dir=0
count_lines(){
	grep -Eo '[\.|\?|\!]'  $1| wc -l
}
count_decimals(){
	grep -Eo '(^| |-)([0-9]*\.[0-9]+)($| )' $1 | wc -w
}
count_integers(){
	grep -Eo '(^| |-)([0-9]+[\.\?\=\:]?( |$))+' $1 | wc -w
}
indent(){
  i=0
  while [ $i -lt $(($1)) ]
  do
      printf "   "
      i=$((i+1))
  done
}
directory(){
countl=0
countIntegers=0
for f in "$1"/*
do
	if [[ -d $f ]]; then
        dir=$((dir+1))
        old_dr=$dr
        dr=$f
        directory $f
        countcurrentLines=$countl
        countcurrentIntegers=$countIntegers
        indent $((dir-1))
        printf "   "
        echo $(basename $dr)-$countl-$countIntegers
        dr=$old_dr
        if [[ $dir -eq 1 ]]
        then
              countTotalLines=$(( $countTotalLines + $countcurrentLines ))
              countTotalIntegers=$(( $countTotalIntegers + $countcurrentIntegers ))
        fi
        dir=$((dir-1))
      	else
      		countLines=$(count_lines $f)
          countDecimals=$(count_decimals $f)
          countcurrentIntegers=$(count_integers $f)
          countcurrentLines=$(( $countLines-$countDecimals ))
          countl=$(( $countl + $countcurrentLines ))
          countIntegers=$(( $countIntegers + $countcurrentIntegers ))
          indent $((dir))
          printf "   $(basename $f)-$countcurrentLines-$countcurrentIntegers" 
          echo ""
          if [[ $dir -eq 0 ]]
            then
              countTotalLines=$(( $countTotalLines + $countcurrentLines ))
              countTotalIntegers=$(( $countTotalIntegers + $countcurrentIntegers ))
          fi
    fi
done
}
directory $address
echo $(basename $address)-$countTotalLines-$countTotalIntegers