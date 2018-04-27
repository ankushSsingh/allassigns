#!usr/bin/gawk
{		

	if($2==1){
	a[$1]+=$6/100;
	error1[$1]+=($6)*($6)/100;
	}
	if($2==2){
	b[$1]+=$6/100;
	error2[$1]+=($6)*($6)/100;
	}
	if($2==4){
	c[$1]+=$6/100;
	error4[$1]+=($6)*($6)/100;
	}
	if($2==8){
	d[$1]+=$6/100;
	error8[$1]+=($6)*($6)/100;
	}
	if($2==16){
	e[$1]+=$6/100;
	error16[$1]+=($6)*($6)/100;
	}
	
}
END{
for(i=1000;i<10000000;i=i*10){
	error1[i]=error1[i]-a[i]*a[i];
	error2[i]=error2[i]-b[i]*b[i];
	error4[i]=error4[i]-c[i]*c[i];
	error8[i]=error8[i]-d[i]*d[i];
	error16[i]=error16[i]-e[i]*e[i];
}

for(i=1000;i<10000000;i=i*10){
	error2[i]=error2[i]/(b[i]*b[i]);
	error4[i]=error4[i]/(c[i]*c[i]);
	error8[i]=error8[i]/(d[i]*d[i]);
	error16[i]=error16[i]/(e[i]*e[i]);
	error1[i]=error1[i]/(a[i]*a[i]);
	b[i]=b[i]/a[i];
	c[i]=c[i]/a[i];
	d[i]=d[i]/a[i];
	e[i]=e[i]/a[i];
	a[i]=1;
}
for(i=1000;i<10000000;i=i*10){
	print i " " a[i] " " b[i] " " c[i] " " d[i] " " e[i] " " error1[i] " " error2[i] " " error4[i] " " error8[i] " " error16[i] > "errors.out"
}

}