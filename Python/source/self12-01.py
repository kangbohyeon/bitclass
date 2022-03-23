# 클래스 정의 부분
class  Car :
    color = ""
    speed = 0

    def  upSpeed(self, value) :
        self.speed += value
        if self.speed > 150 :
            self.speed = 150
    
    def  downSpeed(self, value) :
        self.speed -= value

# 메인 코드 부분
myCar1 = Car()
myCar1.color = "빨간색"
myCar1.speed = 0

myCar2 = Car()
myCar2.color = "파란색"
myCar2.speed = 0

myCar3 = Car()
myCar3.color = "노란색"
myCar3.speed = 0

myCar1.upSpeed(30)
print("자동차1의 색상은 %s이며, 현재속도는 %d km 입니다." % (myCar1.color, myCar1.speed))

myCar2.upSpeed(60)
print("자동차2의 색상은 %s이며, 현재속도는 %d km 입니다." % (myCar2.color, myCar2.speed))

myCar3.upSpeed(200)
print("자동차3의 색상은 %s이며, 현재속도는 %d km 입니다." % (myCar3.color, myCar3.speed))
