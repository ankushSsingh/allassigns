N <- 50000
data <- rexp(N, 0.2)
x <- data.frame(X = seq(1, N , 1), Y = sort(data))
plot(x)

y <- split(data,sample(1:500))
for(i in 1:5){
	a<-unlist(y[i],use.names=FALSE)
	a1<-round(a,0)
	pdata <- rep(0,100)
	cdata <- rep(0,100)
	for(i1 in 1:100){
		pdata[a1[i1]]<-pdata[a1[i1]] + 1/100
	}
	xcols <- c(0:99)
	plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
	cdata[1] <- pdata[1]
	for (i2 in 2:100){
		cdata[i2]=cdata[i2-1]+pdata[i2]
	}
	plot(xcols, cdata, "o", col="orange", xlab="X", ylab="F(X)");
}
mean <- rep(0,500)
sd <- rep(0,500)
for(i in 1:500){
	a <- unlist(y[i],use.names=FALSE)
	mean[i] <- mean(a)
	sd[i] <- sd(a)
}
#
print(mean)
cat("Mean values for the first five vectors are ",mean[1:5],"\n")
cat("Standard Deviations for the first five vectors are ",sd[1:5],"\n")
tab <- table(round(mean))
#str(tab)
plot(tab, "h", xlab="Value", ylab="Frequency")
pdata <- rep(0,100)
mean_rounded <- round(mean,0)
for(i in 1:500){
	pdata[mean_rounded[i]] <- pdata[mean_rounded[i]] + 1/500
}
xcols <- c(0:99)
plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
cdata <- rep(0,100)
cdata[1] <- pdata[1]
for(i in 2:100){
	cdata[i] <- cdata[i-1] + pdata[i]
}
plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");
cat("Actual Mean and Standard Deviation are",mean(data),sd(data),"\n")
cat("Mean and Standard Deviation of sample means are",mean(mean),sd(mean),"\n")
