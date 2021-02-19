def IsInt(s):
    try: 
        int(s)
        return True
    except ValueError:
        return False
IS = {"STOP" : "00", "ADD" : "01", "SUB" : "02","MULTI" : "03", "MOVER" : "04", "MOVEM" :"05" , "COMB" : "06", "BC" :"07" , "DIV" :"08" , "READ" :"09" , "PRINT" :"10"}
AD = {"END" : "02", "START" : "01", "ORIGIN" : "03","EQU" : "04", "LTORG" : "05"}
DL={"DS": "01" , "DC" : "02"}
RG={"AREG":"01","BREG":"02","CREG":"03","DREG":"04"}
literals=[]
symbols=dict()
f = open("test.txt", "r")
w = open("result.txt", "w+")
symbol_count=0
k=0
p=0
o=0
for l in f:
	l = l.replace(",", " ")
	ins=l.split()
	for i in ins:
		if i in IS:
			w.write("(IS, "+ str(IS[i])+")")	
		elif i in AD:
			if i =="LTORG":
				w.write("(AD,05)(DL,02)(C,"+ str(literals[p][2:4])+")")	
				p+=1
			if i=="END":
				while(p!=len(literals)):
					w.write("(AD,02)(DL,02)(C,"+ str(literals[p][2:3])+")")
					w.write("\n")
					p+=1
			else:
				w.write("(AD, "+ str(AD[i])+")")	
		elif i in DL:
			w.write("(DL, "+ str(DL[i])+")")
		elif i in RG:
			w.write("(RG, "+ str(RG[i])+")")	
		elif i[0]=="=":
			w.write("(L,0"+ str(k)+")")
			literals.append(i)
			k+=1
		elif IsInt(i):
			w.write("(C, "+i+")")
		elif not(IsInt(i)):
			if i not in symbols:
				symbols[i] = o
				o+=1
			w.write("(S,0"+str(symbols[i])+")")
	w.write('\n')
print(literals)
print(list(set(symbols)))
for line in w:
	print(line)
w.close()
f.close()
