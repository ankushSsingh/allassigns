#set terminal postscript eps enhanced color size 3.9,2.9
set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "bar.eps"

set key font ",22"
set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set xlabel "Number of Elements"
set ylabel "Average speedup"
set yrange[0:]
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border
plot 'bar.txt' u 6:xticlabels(1) title "1 thread",\
'' u 3 title "2 threads" fillstyle pattern 7,\
'' u 5 title "4 threads" fillstyle pattern 12,\
'' u 6  title "8 threads" fillstyle pattern 14,\
'' u 4 title "16 threads" fillstyle pattern 16
