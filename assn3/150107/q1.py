#!/usr/bin/env python
import math
import sys
N=sys.argv[1]
base=sys.argv[2]
dict={'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':10,'B':11,'C':12,'D':13,'E':14,'F':15,'G':16,'H':17,'I':18,'J':19,'K':20,'L':21,'M':22,'N':23,'O':24,'P':25,'Q':26,'R':27,'S':28,'T':29,'U':30,'V':31,'W':32,'X':33,'Y':34,'Z':35}
basedict={'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'10':10,'11':11,'12':12,'13':13,'14':14,'15':15,'16':16,'17':17,'18':18,'19':19,'20':20,'21':21,'22':22,'23':23,'24':24,'25':25,'26':26,'27':27,'28':28,'29':29,'30':30,'31':31,'32':32,'33':33,'34':34,'35':35,'36':36}
if base in basedict:
	b=basedict[base]
else:
	print "Invalid Base"
	sys.exit()
left=0
right=0
dot=0
minus=0
def calc(num,base,flag):
	answer=0
	if(flag==1):
		pos=len(num)-1
	else:
		pos=-1
	for char in num:
		fac=math.pow(base,pos)
		if char in dict:
			if(dict[char]<base):
				val=dict[char]
				answer+=fac*val
			else:
				print "Invalid Input"
				sys.exit()
		else:
			print "Invalid Input"
			sys.exit()
		pos-=1
	return answer


if __name__ == '__main__':
	if(N[0]=='-'):
		minus=1
		N=N[1:]
	pos=0	
	for i in N:
		pos+=1
		if(i == '.'):
			dot+=1
	if(dot==1):
		st,en=N.split('.')
		left=calc(st,b,1)
		right=calc(en,b,-1)
	else:
		st=N
		left=calc(st,b,1)
	if(dot!=0 and dot!=1):
		print "Invalid Input"
		sys.exit()
	if(minus==0):
		print left+right
	else:
		print -(left + right)
