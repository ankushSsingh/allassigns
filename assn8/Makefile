all:report.pdf

report report.pdf:report.tex out1.eps out2.eps out4.eps out8.eps out16.eps line1.eps line2.eps line4.eps line8.eps line16.eps bar.eps error.eps
	pdflatex report.tex
	pdflatex report.tex

plot: plot_scatter plot_line plot_bar plot_error

plot_scatter out1.eps out2.eps out4.eps out8.eps out16.eps:out1.out out2.out out4.out out8.out out16.out scatter.p
	gnuplot scatter.p

plot_line line1.eps line2.eps line4.eps line8.eps line16.eps:line1.out line2.out line4.out line8.out line16.out lineplot.p
	gnuplot lineplot.p

plot_bar bar.eps:bar.out plot_speedup.p
	gnuplot plot_speedup.p

plot_error error.eps:error.out errorbar.p
	gnuplot errorbar.p

analyse out1.out out2.out out4.out out8.out out16.out line1.out line2.out line4.out line8.out line16.out bar.out error.out:output scatter.awk line.awk bar.awk errorbar.awk
	awk -f scatter.awk output
	awk -f line.awk output
	awk -f bar.awk output
	awk -f errorbar.awk output

runtest output:App.ex1 params.txt threads.txt runtest.sh
	./runtest.sh params.txt threads.txt

App.ex1:prog.o thread_function.o 
	gcc -o App.ex1 prog.o thread_function.o
prog.o:prog.c common.h
	gcc -c prog.c -o prog.o
thread_function.o:thread_function.c common.h
	gcc -c thread_function.c -o thread_function.o

clean:
	rm -f *.o App.ex1 *.out *.eps *.pdf *.log *.lof *.aux output
	
