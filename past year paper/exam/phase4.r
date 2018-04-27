#!/usr/bin/env Rscript

a = read.table('phase3.txt',header=FALSE)
name = a[1]
val=a[3]*a[5]+a[6]*a[8]+a[9]*a[11]
f=data.frame(name,val)
write.table(f,'phase4.txt',col.names=FALSE,row.names=TRUE,quote=FALSE)
