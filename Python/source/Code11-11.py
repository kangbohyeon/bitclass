from tkinter import *

## 변수 선언 부분 ##
window = None
canvas = None
XSIZE, YSIZE = 256, 256

## 메인 코드 부분 ##
window = Tk()
canvas = Canvas(window, height = XSIZE, width = YSIZE)

canvas.pack()
window.mainloop()
