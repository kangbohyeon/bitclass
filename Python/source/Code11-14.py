try :
    infp = open("c:/nofile", "r")
    value = 100 / 0
except IOError:
    print("파일 입출력 오류 입니다.")
except ZeroDivisionError:
    print("0으로 나눴습니다.")

print("프로그램 종료!")