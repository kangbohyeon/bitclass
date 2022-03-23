from tkinter import *
from tkinter.ttk import *
import random
import time
import threading

## 클래스 선언 부분 ##
class ThreadProgressBar():
    thread = None
    progress = None
    def __init__(self, parent):
            self.progress = Progressbar(parent, orient = HORIZONTAL, length = 500)
            self.progress.pack(side = TOP, fill = X, ipadx = 10, ipady = 10, padx = 10, pady = 10)
            self.thread = threading.Thread(target=self.runProgress, args = (self.progress))
            self.thread.start()

    def runProgress(self, progress) :
        hop = 0
        while True :
            hop = random.randrange(0, 10)
            if  progress['value'] >= 100 :   # 프로그레스가 100이면 멈춤
                break
            progress['value'] += hop
            time.sleep(0.5) 

## 함수 선언 부분 ##
def runThreadProgress() :
    thBar1 = ThreadProgressBar(window)
    thBar2 = ThreadProgressBar(window)
    thBar3 = ThreadProgressBar(window)

## 메인 코드 부분 ##
if __name__ == "__main__" :
    window = Tk()
    window.geometry("300x250")
    window.title('멀티 스레드')
    threadtButton = Button(window, text = '멀티 스레드 시작', command = runThreadProgress)
    threadtButton.pack(side = TOP, fill = X, ipadx  = 10, ipady = 10, padx = 10, pady = 10)
    
    window.mainloop()
