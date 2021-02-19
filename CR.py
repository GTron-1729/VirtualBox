f = open("attendance.txt", "r+")
print(f)
c=1
pre=[]
for l in f:
	if(c%2==0):
		pre.append(int(l[:2]))
		c+=1
	else:
		c+=1	
#print(pre)
pre.append(49)
absent=[]
for i in range(1,77):
	if i not in pre:
		absent.append(i+10)
print("Absent rows are ",absent)
