## 전역 변수 선언 부분 ##
year = 0 

## 메인 코드 부분 ##
if __name__ == "__main__" :
    year=int(input("연도를 입력하세요 : "))

    if (((year % 4 == 0) and (year % 100 != 0)) or (year % 400 == 0)) :
        print("%d년은 윤년입니다." % year);
    else :
        print("%d년은 윤년이 아닙니다." % year);
