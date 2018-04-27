#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set xlabel "Number of Elements"
set ylabel "Average Execution Time"
set yrange[0:]
set xrange[0:]
set ytic auto
set xtic auto


set output "l1.eps"
plot 'l1.out' using 1:2 title "1 thread" with lines lw 2

set output "l2.eps"
plot 'l2.out' using 1:2 title "2 threads" with lines lw 2

set output "l4.eps"
plot 'l4.out' using 1:2 title "4 threads" with lines lw 2

set output "l8.eps"
plot 'l8.out' using 1:2 title "8 threads" with lines lw 2

set output "l16.eps"
plot 'l16.out' using 1:2 title "16 threads" with lines lw 2



