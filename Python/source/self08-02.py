inStr = '<<<파<<이>>썬>>>'
outStr = ''

for i in range(0, len(inStr)) :
    if inStr[i] != '<' and inStr[i] != '>':
        outStr += inStr[i]

print("원  문자열 ==> " + '[' + inStr + ']')
print("<> 제거 ==> " + '[' + outStr + ']')
