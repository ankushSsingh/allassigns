all:App.ex1    

App.ex1:prog.o thread_function.o 
	gcc -o App.ex1 prog.o thread_function.o
prog.o:prog.c common.h
	gcc -c prog.c -o prog.o
thread_function.o:thread_function.c common.h
	gcc -c thread_function.c -o thread_function.o

clean:
	rm -f *.o App.ex1
	
