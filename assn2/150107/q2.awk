#!/usr/bin/gawk
BEGIN {start=0
	end=0
	start_time=0
	end_time=0
}
{   
	gsub(/ > /,">")
	split($3,b,/:$/)
	ret[b[1]]++
	arr1[b[1]]++
	arr2[b[1]]++
	if($0 ~ /seq/ && $0 ~ /ack/ && $0 ~ /nop,nop,TS/){
				arr[b[1]]++
				arr1[b[1]]+=$19
			if($19 >0){
				arr2[b[1]]++
			}
			split($7,n,/\:/)
				curr_start=n[1]
			split(n[2],s,/,/)
				curr_end=s[1]
			if(curr_start < end){
				if(curr_end < end) {
					ret[b[1]]+= curr_end-curr_start +1
				}
				else{
					ret[b[1]]+=end-curr_start+1
				}
			}
			start=curr_start
			end = curr_end
	}
	if($0 ~ /seq/ && $0 ~ /ack/ && $0 ~ /sackOK/){
		arr[b[1]]++
		arr1[b[1]]+=$21
		if($21 >0){
			arr2[b[1]]++		
		}
	}
	if($0 ~ /seq/ && !($0 ~ /ack/) && $0 ~ /sackOK/){
		arr[b[1]]++
		arr1[b[1]]+=$19
		if($19 >0){
			arr2[b[1]]++
		}
	}
	if( !($0 ~ /seq/) && $0 ~ /ack/){
		arr[b[1]]++
		arr1[b[1]]+=$17
	}
	flag[b[1]]=0
	split($1,ti,/:/)
	tim=ti[3]
	if(start_time==0){
		start_time=tim
	}
}
END{
	end_time=tim
	duration=end_time-start_time
	unique=0
	for(i in arr){
		ret[i]-=arr[i]
		arr1[i]-=arr[i]
		arr2[i]-=arr[i]
	   split(i,id,/>/)
	   A=id[1]
	   B=id[2]
	   if(flag[A">"B] == 0 && flag[B">"A] == 0){
	   print "Connection (A = "A", B = "B")"
	   xput=unique/duration
       print "A-->B" "  #packets = " arr[i] " #datapackets= " arr2[i] " #bytes= " arr1[i] " #retrans = " ret[i] " #xput= " xput " bytes/sec"
		ret[B">"A]-=arr[B">"A]
		arr1[B">"A]-=arr[B">"A]
		arr2[B">"A]-=arr[B">"A]
		xput=arr1[B">"A]/duration
       print "B-->A" "  #packets = " arr[B">"A] " #datapackets= " arr2[B">"A] " #bytes= " arr1[B">"A] " #retrans = " ret[B">"A]" #xput=" xput " bytes/sec"
       flag[A">"B] ++
       	flag[B">"A] ++
       		}
       }
}
