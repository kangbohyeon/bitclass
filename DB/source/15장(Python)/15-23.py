import pymysql
from tkinter import *
from tkinter import messagebox
from tkinter.simpledialog import *
import random

## 함수 선언 부
def connectMySQL() :
    global conn, curr, window, canvas
    conn = pymysql.connect(host='127.0.0.1', user='root', password='1234', db='KingHotDB', charset='utf8')
    curr = conn.cursor()

def closeMySQL() :
    global conn, curr, window, canvas
    curr.close()
    conn.close()
    curr, conn = None, None

def randomColor() :
    COLORS = ["black",  "red", "green", "blue", "magenta", "orange", "brown", "maroon", "coral"]
    return random.choice(COLORS)

def clearMap() :
    global conn, curr, window, canvas
    canvas.destroy()
    canvas = Canvas(window, height=SCR_HEIGHT, width=SCR_WIDTH) 
    canvas.pack()

def displayRestaurant() :
    global conn, curr, window, canvas
    pass

def displayManager() :
    global conn, curr, window, canvas
    pass

def displayRoad() :
    global conn, curr, window, canvas
    pass

def showResMan() :
    global conn, curr, window, canvas
    pass

def showNearest() :
    global conn, curr, window, canvas    
    pass

## 전역 변수부
conn, curr = None, None
window, canvas = None, None

SCR_WIDTH, SCR_HEIGHT = 360, 360

## 메인 코드부
window=Tk()
window.title("왕매워 짭뽕 Ver 0.1")
canvas = Canvas(window, height=SCR_HEIGHT, width=SCR_WIDTH) 
canvas.pack()

mainMenu = Menu(window)
window.config(menu=mainMenu)

gis1Menu = Menu(mainMenu)
mainMenu.add_cascade(label="GIS 데이터 보기", menu=gis1Menu)
gis1Menu.add_command(label="체인점 보기", command=displayRestaurant)
gis1Menu.add_command(label="관리자 보기", command=displayManager)
gis1Menu.add_command(label="도로 보기", command=displayRoad)
gis1Menu.add_separator()
gis1Menu.add_command(label="화면 지우기", command=clearMap)
gis1Menu.add_separator()

gis2Menu = Menu(mainMenu)
mainMenu.add_cascade(label="GIS 데이터 분석", menu=gis2Menu)
gis2Menu.add_command(label="관리자별 담당 체인점", command=showResMan)
gis2Menu.add_command(label="가장 가까운 체인점", command=showNearest)

window.mainloop()
