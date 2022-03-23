## 클래스 선언 부분 ##
class  Car :
    def method(self):
        print("슈퍼 클래스 ", end=' ')

class Sedan(Car) :
    def method(self):
        print("서브 클래스 ", end=' ')

myCar = Car()
mySedan = Sedan()
myCar.method()
mySedan.method()
