## 전역 변수 선언 부분 ## 
money, c50, c10, c5, c1 = 0,0,0,0,0

## 메인 코드 부분 ## 
money=int(input("지폐로 교환할 돈은 얼마? "))

c50 = money // 50000
money %= 50000

c10 = money // 10000
money %= 10000

c5 = money // 5000
money %= 5000

c1 = money // 1000
money %= 1000

print("\n 50000원짜리 ==> %d장 " % c50)
print(" 10000원짜리   ==> %d장 " % c10)
print(" 5000원짜리 ==> %d장 " % c5)
print(" 1000원짜리   ==> %d장 "% c1)
print(" 지폐로 바꾸지 못한 돈 ==> %d원"% money)
