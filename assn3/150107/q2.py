#!/usr/bin/env python
import numpy as np 
import sys
import math
import csv
from numpy import genfromtxt
from numpy.linalg import inv
import matplotlib.pyplot as plt
eta =0.00000001
def main():
	my_data = genfromtxt(sys.argv[1], delimiter=',')
	my_data=my_data[1:]
	X_train=my_data[:,0]
	Y_train=my_data[:,1]
	z=np.ones((len(X_train),1),dtype=np.int)
	new_xtrain=np.zeros((len(X_train),2))
	new_xtrain[:,1]=X_train
	new_xtrain[:,0]=z[:,0]
	w=np.random.rand(2,1)
	w_direct=inv(new_xtrain.T.dot(new_xtrain)).dot(new_xtrain.T.dot(Y_train))
	a=(w.T).dot(new_xtrain.T)
	a_direct=(w_direct.T).dot(new_xtrain.T)
	plt.plot(Y_train,X_train,'ro')
	plt.plot(a.T,X_train,'b-')
	plt.show()
	plt.plot(Y_train,X_train,'ro')
	plt.plot(a_direct.T,X_train,'b-')
	plt.show()
	for i in range(1,5):
		plt.plot(Y_train,X_train,'ro')
		for j in range(1,len(new_xtrain[:,1])):
			x=new_xtrain[j,:].T
			#print x, "This is x"
			#print w, "This is w"
			#print (w.T).dot(x)
			#print eta*(w.T.dot(x)-Y_train[j])*(x)[0], "this"
			w[0]=w[0]-eta*(w.T.dot(x)-Y_train[j])*(x)[0]
			w[1]=w[1]-eta*(w.T.dot(x)-Y_train[j])*(x)[1]
			#w=w-np.asarray(eta*(w.T.dot(x)-Y_train[j])*(x))
			#print w[1]
			if (j%100==0):
				plt.plot(((w.T).dot(new_xtrain.T)).T,X_train,'b-')
				#plt.show()
		plt.show()
	plt.plot(Y_train,X_train,'ro')
	plt.plot(((w.T).dot(new_xtrain.T)).T,X_train,'b-')
	plt.show()
	test_data= genfromtxt(sys.argv[2], delimiter=',')
	test_data=test_data[1:]
	X_test=test_data[:,0]
	Y_test=test_data[:,1]
	z=np.ones((len(X_test),1),dtype=np.int)
	new_xtest=np.zeros((len(X_test),2))
	new_xtest[:,1]=X_test
	new_xtest[:,0]=z[:,0]
	y_pred1=new_xtest.dot(w)
	rmse1=(y_pred1.T-Y_test).dot((y_pred1.T-Y_test).T)
	rmse1=math.sqrt(rmse1/len(Y_test))
	print rmse1
	y_pred2=new_xtest.dot(w_direct)
	rmse2=(y_pred2.T-Y_test).dot((y_pred2.T-Y_test).T)
	rmse2=math.sqrt(rmse2/len(Y_test))
	print rmse2
if __name__ == '__main__':
	main()
