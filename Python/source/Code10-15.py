from tkinter import *

## 함수 선언 부분 ##
def clickMouse(event) :
    txt = ""
    if event.num == 1 :
        txt += "마우스 왼쪽 버튼이 ("
    elif event.num == 3 :
        txt += "마우스 오른쪽 버튼이 ("

    txt += str(event.y) + "," + str(event.x) + ")에서 클릭됨"
    label1.configure(text = txt)


## 메인 코드 부분 ##
window = Tk()
window.geometry("400x400")

label1 = Label(window, text = "이곳이 바뀜")

window.bind("<Button>", clickMouse)

label1.pack(expand = 1, anchor = CENTER)
window.mainloop()
