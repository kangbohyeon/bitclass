## 함수 정의 부분 ## 
def para_func(v1, v2, v3=0, v4=0, v5=0, v6=0, v7=0, v8=0, v9=0, v10=0) :
    result = 0
    result = v1 + v2 + v3 + v4 + v5 + v6 + v7 + v8 + v9 + v10
    return result

## 변수 선언 부분 ## 
hap = 0

## 메인 코드 부분 ## 
hap = para_func(10, 20)
print("매개변수가 2개인 함수를 호출한 결과 ==> %d" % hap)
hap = para_func(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
print("매개변수가 10개인 함수를 호출한 결과 ==> %d" % hap)
