#!/usr/bin/octave -qf

filename = "phase5.txt";
fid = fopen (filename, "w");


i=1;
while (i<=33)
	#fputs(fid,randperm(12,2));
	#fdisp(fid,i i+1);
	a=randperm(12,2);
	fprintf(fid,"%d %d\n",a(1),a(2));
end

fclose (fid);
