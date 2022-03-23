import turtle
import random

## 클래스 선언 부분 ##
class Shape:  # 부모 클래스
    myTurtle = None
    cx, cy = 0, 0  # 사각형 및 원의 중심점.

    def __init__(self):
        self.myTurtle = turtle.Turtle('turtle') # 거북이 생성.
   
    def setPen(self) : # 펜 색상과 두께를 랜덤하게 뽑기
        r = random.random()
        g = random.random()
        b = random.random()
        self.myTurtle.pencolor((r, g, b))
        pSize = random.randrange(1,10)
        self.myTurtle.pensize(pSize)                

    def drawShape(self):  # 하위 클래스에서 상속받아서 오버라이딩
        pass

class Rectangle(Shape): # 자식 클래스
    width, height = [0] * 2
    def __init__(self, x, y):
        Shape.__init__(self)  
        self.cx = x
        self.cy = y
        self.width = random.randrange(20, 100)
        self.height = random.randrange(20, 100)
        
    def drawShape(self) :
        # 네모 그리기
        sx1, sy1, sx2, sy2 = [0] * 4  # 왼쪽 위 X, Y와 오른쪽 아래 X,Y
        
        sx1 = self.cx - self.width/2
        sy1 = self.cy - self.height /2
        sx2 = self.cx + self.width/2
        sy2 = self.cy + self.height /2

        self.setPen() # 부모 클래스 메서드
        self.myTurtle.penup()
        self.myTurtle.goto(sx1, sy1)
        self.myTurtle.pendown()
        self.myTurtle.goto(sx1, sy2)
        self.myTurtle.goto(sx2, sy2)
        self.myTurtle.goto(sx2, sy1)
        self.myTurtle.goto(sx1, sy1)
        
## 함수 선언 부분 ##
def  screenLeftClick(x,y):
    rect = Rectangle(x, y)
    rect.drawShape()
    
## 메인 코드 부분 ##
turtle.title('연습문제')
turtle.onscreenclick(screenLeftClick,1)
turtle.done()
