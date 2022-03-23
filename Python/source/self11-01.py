inFp = None	# 입력 파일
inStr = ""		# 읽어온 문자열
lineNum = 1

inFp = open("C:/Temp/data1.txt", "r")

while True :
    inStr = inFp.readline()
    if inStr == "" :
        break;
    print("%d : %s" %(lineNum, inStr), end="")
    lineNum += 1

inFp.close()
