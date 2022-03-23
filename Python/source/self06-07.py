hap, i = 0, 0

i = 1
while i < 101 :
    hap += i

    if hap >= 1000 :
        break
    i += 1
    
print("1~100의 합계를 최초로 1000이 넘게 하는 숫자 : %d" % i)
