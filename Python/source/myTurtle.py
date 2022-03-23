import random
from tkinter.simpledialog import *

def getString() :
    retStr = ''
    retStr = askstring('문자열 입력', '거북이 쓸 문자열을 입력')
    return retStr

def getRGB() :
    r, g, b = 0, 0, 0
    r = random.random() 
    g = random.random()
    b = random.random()
    return (r, g, b)

def getXYAS(sw, sh) :
    x, y, angle, size = 0, 0, 0, 0
    x  = random.randrange(-sw / 2, sw / 2)
    y = random.randrange(-sh / 2, sh / 2)
    angle = random.randrange(0, 360)
    size = random.randrange(10, 50)
    return [x, y, angle, size]
