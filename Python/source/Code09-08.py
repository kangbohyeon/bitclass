## 함수 선언 부분 ##
def func1() :
     result = 100
     return result

def func2() :
     print("반환값이 없는 함수 실행")
	
## 전역 변수 선언 부분 ##
hap = 0

## 메인 코드 부분 ##
hap = func1()
print("func1()에서 돌려준 값 ==> %d" % hap)
func2()
