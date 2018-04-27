#!usr/bin/gawk
{		

	if($2==1){
	a[$1]+=$6/100;
	}
	if($2==2){
	b[$1]+=$6/100;
	}
	if($2==4){
	c[$1]+=$6/100;
	}
	if($2==8){
	d[$1]+=$6/100;
	}
	if($2==16){
	e[$1]+=$6/100;
	}
	
}
END{
for(i in a){
	print  i " " a[i] > "l1.out"
}
for(i in b){
	print  i " " b[i] > "l2.out"
}
for(i in c){
	print  i " " c[i] > "l4.out"
}
for(i in d){
	print  i " " d[i] > "l8.out"
}
for(i in e){
	print  i " " e[i] > "l16.out"
}
}