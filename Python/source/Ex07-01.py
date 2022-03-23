import random

## 전역 변수 선언 부분 ##
data = []
i, k = 0, 0

## 메인 코드 부분 ##
if __name__ == "__main__" :
    for i in range (0, 10) :  # 임의의 데이터 10개 생성
        tmp = hex( random.randrange(0, 100000))
        data.append(tmp)

    print('정렬 전 데이터 : ', end = '')
    [print(num, end = ' ') for num in data] 

    for i in range(0, len(data)-1) :
        for k in range(i+1, len(data)) :
                if int(data[i], 16) > int(data[k], 16) :
                    tmp = data[i]
                    data[i]  = data[k]
                    data[k] = tmp

    print('\n정렬 후 데이터 : ', end = '')
    [print(num, end = ' ') for num in data] 
