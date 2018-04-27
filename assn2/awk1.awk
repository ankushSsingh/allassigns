#!/usr/bin/gawk
BEGIN 	{ 
		count=0} 
		{
			i=1
			while(i < NF )
			{
				if($i ~ /\/\//)
					{	print $((i+1))
						count ++
					}
				i++
			} 
			if($0 ~ /\/\*/ && $0 ~ /\*\//){
					count ++
			}
		 }	
END   	{ 
		print count}