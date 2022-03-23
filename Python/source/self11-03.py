outFp = None 
fName, outStr = "", ""

fName = input("파일명을 입력하세요 : ")
outFp=open(fName, "w" )

while True:
    outStr = input("내용 입력 : ")
    if outStr != "" :
        outFp.writelines(outStr + "\n")
    else :
        break

outFp.close()
print("--- 파일에 정상적으로 써졌음 ---")
