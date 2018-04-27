#!usr/bin/gawk
{
	if( $2 == 1){
		a[$0]++;	
	}
	if( $2 == 2){
		b[$0]++;	
	}
	if( $2 == 4){
		c[$0]++;	
	}
	if( $2 == 8){
		d[$0]++;	
	}
	if( $2 == 16){
		e[$0]++;	
	}
}
END{
	for(i in a){
	for(j=1;j<=a[i];j++){
		 print i > "o1.out"
	}
	}
	for(i in b){
	for(j=1;j<=b[i];j++){
		 print i > "o2.out"
	}
	}
	for(i in c){
	for(j=1;j<=c[i];j++){
		 print i > "o4.out"
	}
	}
	for(i in d){
	for(j=1;j<=d[i];j++){
		 print i > "o8.out"
	}
	}
	for(i in e){
	for(j=1;j<=e[i];j++){
		 print i > "o16.out"
	}
	}


}
