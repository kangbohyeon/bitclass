from tkinter import *

## 함수 선언 부분 ##
def loadImage(fname) :
    global inImage, XSIZE, YSIZE
    fp = open(fname, 'rb')

    for i in range(0, XSIZE) :
        tmpList = []
        for k in range(0, YSIZE) :
            data = int(ord(fp.read(1)))
            tmpList.append(data)
        inImage.append(tmpList)

    fp.close()

def displayImage(image) :
    global XSIZE, YSIZE
    rgbString = ""
    for i in range(0, XSIZE) :
        tmpString = ""
        for k in range(0, YSIZE) :
            data = image[i][k]
            tmpString += "#%02x%02x%02x " % (data, data, data) # x 뒤에 한칸 공백
        rgbString += "{" + tmpString +  "} " # } 뒤에 한칸 공백
    paper.put(rgbString)

## 전역 변수 선언 부분 ##
window = None
canvas = None
XSIZE, YSIZE=256,256
inImage=[] # 2차원 리스트 (메모리)

## 메인 코드 부분 ##
window = Tk()
window.title("흑백 사진 보기")
canvas = Canvas(window, height = XSIZE, width = YSIZE)
paper = PhotoImage(width = XSIZE, height = YSIZE)
canvas.create_image((XSIZE/2, YSIZE/2), image = paper, state = "normal")

# 파일 --> 메모리
filename = 'RAW/tree.raw'  # C:/CookPython/RAW/tree.raw
loadImage(filename)

# 메모리 --> 화면 
displayImage(inImage)

canvas.pack()
window.mainloop()
