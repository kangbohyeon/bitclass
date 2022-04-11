## 함수 선언부
def func1() :
    global a  # 이 함수안에서 a는 전역변수
    a = 10
    print("func1()에서 a의 값 %d" % a)

def func2() :
    print("func2()에서 a의 값 %d" % a)

## 전역변수 선언부
a = 20    # 전역변수

## 메인 코드
func1()
func2()
