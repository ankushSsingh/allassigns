#!/usr/bin/env python


def printtree(arr,left,right):
	l=right-left
	if(l==0):
		#print arr[right]
		return 
	for i in range(left,left+int(l/2)):
		print " ",
	print arr[left+int(l/2)]
	printtree(arr,left,left+int(l/2))

	printtree(arr,left+int(l/2)+1,right)

def main():
	str=raw_input().split(' ')
	arr = [int(num) for num in str]
	l=len(arr)
	for i in range(l):
		t=arr[i]
		for j in range(i+1,l):
			if(arr[i]>arr[j]):
				arr[i]=arr[j]
				arr[j]=t
			t=arr[i]
	print arr
	#print int(l/2)
	printtree(arr,0,l-1)
	print arr[l-1]


if __name__ == '__main__':
	main()