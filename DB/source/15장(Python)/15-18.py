from tkinter import *
from tkinter.simpledialog import *

# 함수 정의 부분
window = Tk()

canvas = Canvas(window, height=300, width=300) # 캔버스를 윈도창에 부착
canvas.pack()

canvas.create_line([[0,0], [70,70], [30,170]], fill="blue", width=3)
canvas.create_polygon([[100,100], [100,150], [150,150], [150,100]], fill="red")
canvas.create_text([200, 200], text="이것이 MySQL이다", font=("굴림", 15))

window.mainloop()
