inFp = None 
inList = ""    

inFp = open("C:/Temp/data1.txt", "r")

inList = inFp.readlines()
print(inList)

inFp.close()
