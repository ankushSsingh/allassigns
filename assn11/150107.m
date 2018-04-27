X_train=ones(10000,1)
Y_train=ones(10000,1)
m=csvread("train.csv")
m1=m([2:10001],:)
X_train = X_train.*m1(:,1)
Y_train = Y_train.*m1(:,2)
I=ones(10000,1)
X_train_new=[I,X_train]
clc

w=rand(2,1)

hold on
w1=w'*(X_train_new)'
#scatter(X_train,Y_train)
plot(X_train,w1',"r")
xlabel("feature-x")
ylabel("label-y")
title("Graph for y vs x")
print -dpdf "data.pdf"
close


hold on
z=X_train_new
w_direct=(z'*z)^(-1)*(z'*Y_train)
w1_direct=w_direct'*(X_train_new)'
#scatter(X_train,Y_train)
plot(X_train,w1_direct',"g")
xlabel("feature-x")
ylabel("w_direct")
title("Graph for w vs x")
print -dpdf "fig_direct.pdf"
close

clc
hold on
N=5
eta=0.00000001
for i=1:1,
     #scatter(X_train,Y_train)
     for j=1:10000,
	x=X_train(j)
	y=Y_train(j)
	x1=[1,x]'
	w-=eta*(w'*x1-y)*x1
	if (mod(j,100)==0),
	     wtemp=w'*(X_train_new)'
	     plot(X_train,wtemp',"k")
    	end,
     end,
       print -dpdf "fig_training.pdf"
end,
close

hold on
#scatter(X_train,Y_train)
w2=w'*(X_train_new)'
plot(X_train,w2',"y")
xlabel("feature-x")
ylabel("w_after_training")
title("Graph for w vs x")
print -dpdf "fig_final.pdf"
close


n=csvread("train.csv")
X_test=ones(10000,1)
Y_test=ones(10000,1)
n1=n([2:10001],:)
X_test = X_test.*n1(:,1)
Y_test = Y_test.*n1(:,2)
X_test_new=[I,X_test]
Y_pred1=X_test_new*w
Y_pred2=X_test_new*w_direct
rmse1=(Y_pred1-Y_test)'*(Y_pred1-Y_test)
rmse1=sqrt(rmse1/length(Y_test))
rmse2=(Y_pred2-Y_test)'*(Y_pred2-Y_test)
rmse2=sqrt(rmse2/length(Y_test))



