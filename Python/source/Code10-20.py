from tkinter import *
from tkinter.filedialog import *

## 함수 정의 부분 ##
window = Tk()
window.geometry("400x100")

label1 = Label(window, text = "선택된 파일 이름 ")
label1.pack()

filename = askopenfilename(parent = window, filetypes = (("GIF 파일", "*.gif"), ("모든 파일", "*.*")))

label1.configure(text=str(filename))

window.mainloop()
