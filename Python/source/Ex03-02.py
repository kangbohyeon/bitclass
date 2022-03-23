## 전역 변수 선언 부분 ##
inStr = ''

## 메인 코드 부분 ##
if __name__ == "__main__" :
    inStr = input('문자열을 입력 -->')

    for i in range(len(inStr) - 1, -1, -1) :
        print('%c' % inStr[i], end = '')

        
 
