## 전역 변수 선언 부분 ##
i, k, guguLine = 0, 0, ""

## 메인 코드 부분 ##
for i in range(2, 10) :
     guguLine = guguLine + (" #  %d단  #" % i)

print(guguLine)

for i in range(1, 10) :
     guguLine = ""
     for k in range(2, 10) :
          guguLine = guguLine + str("%2dX %2d= %2d" % (k, i, k*i))
     print(guguLine)
