import turtle

## 전역 변수 선언 부분 ##
i, k, tX, tY = [0] * 4
swidth, sheight=800, 450

## 메인 코드 부분 ##
if __name__ == "__main__" :
     turtle.title('거북 구구단')
     turtle.shape('turtle')
     turtle.setup(width = swidth + 50, height = sheight + 50)
     turtle.screensize(swidth, sheight)
     turtle.penup()
     tX, tY = -500, 250
     turtle.goto(tX, tY)

     for i in range(1, 10) :
          for k in range(2, 10) :
               turtle.goto(tX + 80 * k, tY - 40 * i)
               gugu = str(k) + ' x ' + str(i) + ' = ' + str(k * i)
               turtle.write(gugu, font=('Arial', 12, 'bold'))
				  
     turtle.done()
