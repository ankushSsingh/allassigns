#!usr/bin/gawk
{
	if( $2 == 1){
		a1[$0]++;	
	}
	if( $2 == 2){
		a2[$0]++;	
	}
	if( $2 == 4){
		a4[$0]++;	
	}
	if( $2 == 8){
		a8[$0]++;	
	}
	if( $2 == 16){
		a16[$0]++;	
	}
}
END{
	for(i in a1){
	for(j=1;j<=a1[i];j++){
		 print i > "out1.txt"
	}
	}
	for(i in a2){
	for(j=1;j<=a2[i];j++){
		 print i > "out2.txt"
	}
	}
	for(i in a4){
	for(j=1;j<=a4[i];j++){
		 print i > "out4.txt"
	}
	}
	for(i in a8){
	for(j=1;j<=a8[i];j++){
		 print i > "out8.txt"
	}
	}
	for(i in a16){
	for(j=1;j<=a16[i];j++){
		 print i > "out16.txt"
	}
	}


}