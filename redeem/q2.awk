#!/usr/bin/gawk
BEGIN {
count=0;
flag=0;
u=0;
p=0;
t=0;
m=0;
c=0;
}
{count ++;
if(flag==0){
	j=0
        while(j<=NF){
		if($j=="USER"){
			u=j;			
			}	
		if($j=="PID"){
			p=j;}
		if($j=="LWP"){
			t=j;}
		if($j=="SZ"){
			m=j;}
		if($j=="TIME"){
			c=j;}
		j++;
	}
	flag++;
}
else{
arr[$u]++;
arr[$p]++;
arr[$t]++;
}


}
END { print count;
for(i in arr){
     print i " " arr[i]	
     print process_list;
	for (j in arr)
		
}
}
