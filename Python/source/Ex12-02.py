from tkinter import *
import math
import random


## 클래스 선언
class Shape:  # 슈퍼 클래스
    color, width = '', 0
    shX1, shY1, shX2, shY2 = [0] * 4  # 도형을 포함하는 두 점

    def drawShape(self):  # 추상 메소드
        raise NotImplementedError()


class Rectangle(Shape):  # 서브 클래스
    objects = None  # 사각형 선분 리스트

    def __init__(self, x1, y1, x2, y2, c, w):
        self.shX1 = x1
        self.shY1 = y1
        self.shX2 = x2
        self.shY2 = y2
        self.color = c
        self.width = w
        self.drawShape()

    def __del__(self):  # 사각형의 4개 선분을 제거함
        for obj in self.objects:
            canvas.delete(obj)

    def drawShape(self):  # 네모 그리기로 재정의
        sx1 = self.shX1;
        sy1 = self.shY1;
        sx2 = self.shX2;
        sy2 = self.shY2
        squreList = []
        squreList.append(canvas.create_line(sx1, sy1, sx1, sy2, fill=self.color, width=self.width))
        squreList.append(canvas.create_line(sx1, sy2, sx2, sy2, fill=self.color, width=self.width))
        squreList.append(canvas.create_line(sx2, sy2, sx2, sy1, fill=self.color, width=self.width))
        squreList.append(canvas.create_line(sx2, sy1, sx1, sy1, fill=self.color, width=self.width))
        self.objects = squreList  # 선분 리스트(=사각형)을 objects에 넣음.


class Circle(Shape):  # 서브 클래스
    objects = None

    def __init__(self, x1, y1, x2, y2, c, w):
        self.shX1 = x1
        self.shY1 = y1
        self.shX2 = x2
        self.shY2 = y2
        self.color = c
        self.width = w
        self.drawShape()

    def __del__(self):  # 원은 객체 1개만 제거
        canvas.delete(self.objects)

    def drawShape(self):  # 원형 그리기로 재정의
        sx1 = self.shX1;
        sy1 = self.shY1;
        sx2 = self.shX2;
        sy2 = self.shY2
        self.objects = canvas.create_oval(sx1, sy1, sx2, sy2, outline=self.color, width=self.width)


## 함수 정의 부분
def getColor():  # 임의의 색상 선택
    r = random.randrange(16, 256)  # 16진수로 변환시 0~A는 제외
    g = random.randrange(16, 256)
    b = random.randrange(16, 256)
    return "#" + hex(r)[2:] + hex(g)[2:] + hex(b)[2:]  # '#rrggbb' 형태로 만듬


def getWidth():  # 임의의 펜 두께 선택
    return random.randrange(1, 9)


## 이벤트 함수 정의 부분
def startDrawRect(event):
    global x1, y1, x2, y2, shapes
    x1 = event.x
    y1 = event.y


def endDrawRect(event):
    global x1, y1, x2, y2, shapes
    x2 = event.x
    y2 = event.y
    rect = Rectangle(x1, y1, x2, y2, getColor(), getWidth())  # 사각형 생성
    shapes.append(rect)  # 전체 도형 리스트에 추가


def startDrawCircle(event):
    global x1, y1, x2, y2, shapes
    x1 = event.x
    y1 = event.y


def endDrawCircle(event):
    global x1, y1, x2, y2, shapes
    x2 = event.x
    y2 = event.y
    cir = Circle(x1, y1, x2, y2, getColor(), getWidth())  # 원 생성
    shapes.append(cir)  # 전체 도형 리스트에 추가


def deleteObject(event, objType):  # 마지막 그린 원제거
    global shapes
    if len(shapes) != 0:  # 화면에 도형이 있으면 마지막 도형 제거
        for i in range(len(shapes) - 1, -1, -1):
            strObj = str(shapes[i])
            if strObj.find(objType) != -1:  # 원 또는 사각형 객체 확인
                del (shapes[i])
                break


def deleteCircle(event, objType):  # 마지막 그린 원제거
    global shapes
    if len(shapes) != 0:  # 화면에 도형이 있으면 마지막 도형 제거
        for i in range(len(shapes) - 1, -1, -1):
            strObj = str(shapes[i])
            if strObj.find(objType) != -1:  # 원 객체 확인
                del (shapes[i])
                break


def deleteRectangle(event, objType):  # 마지막 그린 사각형 제거
    global shapes
    if len(shapes) != 0:  # 화면에 도형이 있으면 마지막 도형 제거
        for i in range(len(shapes) - 1, -1, -1):
            strObj = str(shapes[i])
            if strObj.find(objType) != -1:  # 사각형 객체 확인
                del (shapes[i])
                break


## 전역  변수 선언
shapes = []  # 화면에 그려진 전체 도형 리스트
window = None
canvas = None
x1, y1, x2, y2 = None, None, None, None  # 클릭한 두 지점의 X, Y

## 메인 코드 부분 ##
if __name__ == "__main__":
    window = Tk()
    window.title("연습 문제")
    canvas = Canvas(window, height=300, width=300)

    window.bind("<Delete>", lambda event: deleteCircle(event, 'Circle'))
    window.bind("<BackSpace>", lambda event: deleteRectangle(event, 'Rectangle'))

    canvas.bind("<Button-1>", startDrawRect)
    canvas.bind("<ButtonRelease-1>", endDrawRect)

    canvas.bind("<Button-3>", startDrawCircle)
    canvas.bind("<ButtonRelease-3>", endDrawCircle)

    canvas.pack()
    window.mainloop()
