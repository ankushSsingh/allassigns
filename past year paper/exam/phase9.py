file1 = open("phase8.txt","r") 
f = open("phase9.txt","w")

lines = file1.readlines()
lines = lines.split(",")
line[2] = line[2] + line[3]
line[3] = ""
f.write(lines)

f.close()
file1.close() 
