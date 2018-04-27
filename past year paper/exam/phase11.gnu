#!/usr/bin/gnuplot

set terminal pdf
set output 'q3.pdf'

set style data histograms
set style fill pattern 1 border -1

set title "Ananlysis of devas"
set xlabel "Devas" 
set xlabel "Weights" 
set datafile separator ","

plot newhistogram "G1" lt 2 fs pattern 1, \
'phase10.txt' using 2 t "Data1" 
