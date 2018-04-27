#!/usr/bin/gawk
BEGIN 	{count_comments=0
		 count_string=0
		 init_comment=0
		 end_comment=0} 
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
			}
		 }	
END	{  
		print count_comments " lines of comments"
		print count_string " quoted strings"}