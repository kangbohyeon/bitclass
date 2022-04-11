from tkinter import *

window = Tk()
window.geometry("200x200")

upFrame = Frame(window)
upFrame.pack()
downFrame = Frame(window)
downFrame.pack()

editBox = Entry(upFrame, width = 10, bg = 'green')
editBox.pack(padx = 20, pady = 20)

listbox = Listbox(downFrame, bg = 'yellow');
listbox.pack()

listbox.insert(END, "하나")
listbox.insert(END, "둘")

window.mainloop()
