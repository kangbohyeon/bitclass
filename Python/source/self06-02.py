i, dan = 0, 0

dan = int(input("단을 입력하세요 : "))

for i in range(9, 0, -1) :
     print("%d  X  %d  =  %2d" % (i, dan, dan * i))
