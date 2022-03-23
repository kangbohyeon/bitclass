inFp = None 
fName, inList, inStr = "", [ ], ""   

fName = input("파일명을 입력하세요 : ")
inFp = open(fName, "r")

inList = inFp.readlines()
for inStr in inList :
    print(inStr, end = "")

inFp.close()
