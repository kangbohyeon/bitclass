ss = input("입력 문자열 ==> ")

print("출력 문자열 ==> ", end = '')
for i in range(0, len(ss)) :
     if ss[i] != 'o' :
          print(ss[i], end = '')
     else :
          print('$', end = '')
