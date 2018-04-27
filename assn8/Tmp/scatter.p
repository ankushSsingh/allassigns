set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

#set format y "10^{%L}"
set xlabel "Number of Elements"
set ylabel "Execution Time"
set yrange[0:]
set xrange[0:2000000]
set ytic auto
set xtic auto


set output "o1.eps"
plot 'o1.out' using 1:6 title "1 thread" with points pt 1 ps 1.5

set output "o2.eps"
plot 'o2.out' using 1:6 title "2 threads" with points pt 1 ps 1.5

set output "o4.eps"
plot 'o4.out' using 1:6 title "4 threads" with points pt 1 ps 1.5

set output "o8.eps"
plot 'o8.out' using 1:6 title "8 threads" with points pt 1 ps 1.5

set output "o16.eps"
plot 'o16.out' using 1:6 title "16 threads" with points pt 1 ps 1.5

