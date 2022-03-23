import threading
## 클래스 선언 부분 ##
class Calculator :
    number = ''
    def  __init__(self, number) :
        self.number = number

    def runCalc(self) :
        hap = 0
        for i in range(0, self.number+1) :
            hap += i
        print("1+2+3+.....+", self.number, "=", hap)

## 메인 코드 부분 ##
calc1 = Calculator(1000)
calc2 = Calculator(100000)
calc3 = Calculator(10000000)

th1 = threading.Thread(target = calc1.runCalc)
th2 = threading.Thread(target = calc2.runCalc)
th3 = threading.Thread(target = calc3.runCalc)

th1.start()
th2.start()
th3.start()
