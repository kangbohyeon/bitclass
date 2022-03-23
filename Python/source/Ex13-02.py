from tkinter import *
from tkinter.filedialog import *
from tkinter.simpledialog import *
import os.path
import math
import sqlite3

## 함수 선언 부분 ##
def func_open():
    global window, canvas, paper, filename, XSIZE, YSIZE, inImage, filename

    filename = askopenfilename(parent=window, filetypes=(("RAW 파일", "*.raw"), ("모든 파일", "*.*")))
    if filename == '':  # 대화상자에서 취소를 눌렀으면
        return

    if canvas != None:  # 기존에 열린 적이 있으면 제거
        canvas.destroy()

    # 파일 --> 메모리
    loadImage(filename)

    window.geometry(str(XSIZE) + 'x' + str(YSIZE))  # 윈도창 크기
    canvas = Canvas(window, height=XSIZE, width=YSIZE)
    paper = PhotoImage(width=XSIZE, height=YSIZE)
    canvas.create_image((XSIZE / 2, YSIZE / 2), image=paper, state="normal")

    # 메모리 --> 화면
    loadImage(filename) # 파일 --> 데이터베이스
    loadDatabase() # 데이터베이스 --> 메모리
    displayImage(inImage) # 메모리 --> 화면

    canvas.pack()

def loadImage(fname) :  # raw --> DB
    global inImage, XSIZE, YSIZE
    con, cur = None, None
    row, col, data, sql = 0, 0, 0, ''
    con = sqlite3.connect("C:/CookPython/rawDB")  # DB가 저장된 폴더까지 지정
    cur = con.cursor()
    fp = open(fname, 'rb')
    for row in range(0, XSIZE) :
        for col in range(0, YSIZE) :
            data = int(ord(fp.read(1)))
            sql = "INSERT INTO rawTable VALUES(" + str(row) + "," + str(col) + "," + str(data) + ")"
            cur.execute(sql)

    fp.close()
    con.commit()
    con.close()

def loadDatabase() :  # DB --> 메모리
    global inImage, XSIZE, YSIZE
    con, cur = None, None
    row, col, data = 0, 0, 0
    record = None # 테이블에서 읽어온 한 행
    con = sqlite3.connect("C:/CookPython/rawDB")
    cur = con.cursor()  
    cur.execute("SELECT * FROM rawTable")
    # 빈 inImage 생성
    for i in range(0, XSIZE) :
        tmpList = []
        for k in range(0, YSIZE) :
            data = 0
            tmpList.append(data)
        inImage.append(tmpList)

    # 테이블 --> inImage
    while (True) :
        record = cur.fetchone()
        if record== None :
            break;
        row = record[0]; col = record[1]; data = record[2]
        inImage[row][col] = data
    
    con.close()

def displayImage(image) :
    global XSIZE, YSIZE
    rgbString = ""
    for i in range(0, XSIZE) :
        tmpString = ""
        for k in range(0, YSIZE) :
            data = image[i][k]
            tmpString += "#%02x%02x%02x " % (data, data, data)
        rgbString += "{" + tmpString +  "} "
    paper.put(rgbString)


def func_exit() :
    window.quit()
    window.destroy()

def brightPhoto() :
    global window, canvas, paper, filename, XSIZE, YSIZE, inImage, filename, addValue
    value = 0
    value = askinteger('밝게', '값 입력', minvalue=1, maxvalue=255)

    con = sqlite3.connect("C:/CookPython/rawDB")  # DB가 저장된 폴더까지 지정
    cur = con.cursor()
    sql = "UPDATE rawTable SET data = data +" + str(value)
    cur.execute(sql)
    sql = "UPDATE rawTable SET data = 255 WHERE data > 255"
    cur.execute(sql)
    sql = "UPDATE rawTable SET data = 0 WHERE data < 0"
    cur.execute(sql)
    con.commit()
    con.close()

    loadDatabase()  # 데이터베이스 --> 메모리
    displayImage(inImage)

def darkPhoto() :
    global window, canvas, paper, filename, XSIZE, YSIZE, inImage, filename, addValue
    value = 0
    value = askinteger('어둡게', '값 입력', minvalue=1, maxvalue=255)

    con = sqlite3.connect("C:/CookPython/rawDB")  # DB가 저장된 폴더까지 지정
    cur = con.cursor()
    sql = "UPDATE rawTable SET data = data -" + str(value)
    cur.execute(sql)
    sql = "UPDATE rawTable SET data = 255 WHERE data > 255"
    cur.execute(sql)
    sql = "UPDATE rawTable SET data = 0 WHERE data < 0"
    cur.execute(sql)
    con.commit()
    con.close()

    loadDatabase()  # 데이터베이스 --> 메모리
    displayImage(inImage)

def reversePhoto() :
    global window, canvas, paper, filename, XSIZE, YSIZE, inImage, filename, addValue
    con = sqlite3.connect("C:/CookPython/rawDB")  # DB가 저장된 폴더까지 지정
    cur = con.cursor()
    sql = "UPDATE rawTable SET data = 255 - data"
    cur.execute(sql)
    con.commit()
    con.close()

    loadDatabase()  # 데이터베이스 --> 메모리
    displayImage(inImage)

## 전역 변수 선언 부분
window, canvas, XSIZE, YSIZE = None, None, 256, 256
inImage = [] # 2차원 리스트 (메모리)

## 메인 코드 부분 ##
if __name__ == "__main__" :
    window = Tk()
    window.title("연습문제")
    canvas = Canvas(window, height = XSIZE, width = YSIZE)
    paper = PhotoImage(width = XSIZE, height = YSIZE)
    canvas.create_image((XSIZE/2, YSIZE/2), image = paper, state = "normal")

    # 테이블 초기화
    con = sqlite3.connect("C:/CookPython/rawDB")  # 소스코드가 저장된 폴더에 생성됨
    cur = con.cursor()
    cur.execute("DROP TABLE IF EXISTS rawTable")
    cur.execute("CREATE TABLE rawTable(row  int , col int, data int)") # 행,열,픽셀값
    con.commit()
    con.close()

    # 메뉴 추가
    mainMenu = Menu(window)
    window.config(menu=mainMenu)
    fileMenu = Menu(mainMenu)
    mainMenu.add_cascade(label="파일", menu=fileMenu)
    fileMenu.add_command(label="파일 열기", command=func_open)
    fileMenu.add_separator()
    fileMenu.add_command(label="프로그램 종료", command=func_exit)

    photoMenu = Menu(mainMenu)
    mainMenu.add_cascade(label="사진효과", menu=photoMenu)
    photoMenu.add_command(label="밝게하기", command=brightPhoto)
    photoMenu.add_command(label="어둡게하기", command=darkPhoto)
    photoMenu.add_command(label="반전 이미지", command=reversePhoto)

    #filename = 'RAW/tree.raw'  # C:/CookPython/RAW/tree.raw


    canvas.pack()
    window.mainloop()
