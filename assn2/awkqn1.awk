#!/usr/bin/gawk
BEGIN 	{count_comments=0
		 count_string=0
		 init_comment=0
		 end_comment=0
		 i=1
		 j=1
		 strp0=0
		 strp1=0
		 cmtp=0
		 cmtmp0=0
		 cmtmp1=0} 
		{
			if($0 ~ /\/\//)
					{	#print $0
						count_comments ++
					}
		 
			if($0 ~ /\/\*/ && $0 ~ /\*\//){
					#print $0
					count_comments ++
			}
			if($0 ~ /\/\*/ && !($0 ~ /\*\//)){
					init_comment= NR
			} 
			if(!($0 ~ /\/\*/) && $0 ~ /\*\//){
					end_comment= NR
					count_comments +=end_comment-init_comment+1
					init_comment=0
					end_comment=0
			}
			if( $0 ~ /\"/ ){
					if(! (NR > init_comment && init_comment !=0) )
					{
					#print " string alert " NR
					count_string ++ 
					#print count_string
					#print NF
					}
					#print i
					while(i<=NF){
						if($i ~ /\"/){
							strp0=i
							#split($i,b,/\"/)
							#for (j in b[1]){
							#	if(j~ /\"/){
							#		strp1=j+i
							#	}
							#}
							j=i+1
							i=NF
						}
						i ++
					}
					while(j<=NF){
						if($j ~ /\"/){
							strp1=j
							#print $j
							j=NF
						}
					j ++
					}
					#print strp0," ",strp1 ,NR
					i=1
					while(i<=NF){
						if($i ~ /\/\//){
							cmtp=i
							
							if(cmtp < strp0 && cmtp){
								#print "YES",NR
								count_string --
							}
							if(cmtp <strp1 && cmtp>strp0){
								count_comments --
							}
							i=NF
						}i ++
					}
					i=1
					while(i<=NF){
						if($i ~ /\/\*/){
							cmtmp0=i
							i=NF
						}i ++
					}i=1
					while(i<=NF){
						if($i ~ /\*\//){
							cmtmp1=i						
							i=NF
						}i ++
					}
					if(cmtmp0>strp0 && cmtmp1<strp1 && cmtmp1){
							
							count_comments --
					}
					if(cmtmp0 && cmtmp0<strp0 && (cmtmp1>strp1 || !strp1)){
							#print "yes",NR
							count_string --
					}

		 		}

		 	i=1
		 	j=1
		 	cmtp=0
		 	cmtmp0=0
		 	cmtmp1=0
		}
END	{  
		print count_comments," " count_string }