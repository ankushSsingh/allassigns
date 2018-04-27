import sys;
import os;
from subprocess import call;

def main():
	#os.system("rm out");
	f1=open(sys.argv[1],"r");
	f2=open(sys.argv[2],"r");
	ls1=f1.read().strip().split(" ")
	ls2=f2.read().strip().split(" ")
	for l1 in ls1:
		for l2 in ls2:
			for i in range(100):
				call(["echo","-n", l1, l2," "]);
				call(["./App.ex1", l1, l2]);
	f1.close();
	f2.close();

if __name__ == '__main__':
	main()