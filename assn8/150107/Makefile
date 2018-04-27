all:report.pdf

report report.pdf:report.tex o1.eps o2.eps o4.eps o8.eps o16.eps l1.eps l2.eps l4.eps l8.eps l16.eps bar.eps error.eps
	pdflatex report.tex
	pdflatex report.tex

plot: plot_scatter plot_line plot_bar plot_error

plot_scatter o1.eps o2.eps o4.eps o8.eps o16.eps:o1.out o2.out o4.out o8.out o16.out scatter.p
	gnuplot scatter.p

plot_line l1.eps l2.eps l4.eps l8.eps l16.eps:l1.out l2.out l4.out l8.out l16.out lineplot.p
	gnuplot lineplot.p

plot_bar bar.eps:bars.out plot_speedup.p
	gnuplot plot_speedup.p

plot_error error.eps:errors.out errorbar.p
	gnuplot errorbar.p

analyse o1.out o2.out o4.out o8.out o16.out l1.out l2.out l4.out l8.out l16.out bars.out errors.out:output scatterparser.awk lineparser.awk barparser.awk errorbarparser.awk
	awk -f scatterparser.awk output
	awk -f lineparser.awk output
	awk -f barparser.awk output
	awk -f errorbarparser.awk output

test output:App.ex1 params.txt threads.txt test.py
	python test.py params.txt threads.txt > output

App.ex1:prog.o thread_function.o 
	gcc -o App.ex1 prog.o thread_function.o -lm -pthread
prog.o:prog.c common.h
	gcc -c prog.c -o prog.o
thread_function.o:thread_function.c common.h
	gcc -c thread_function.c -o thread_function.o

clean:
	rm -f *.o App.ex1 *.out *.eps *.pdf *.log *.lof *.aux output
	
