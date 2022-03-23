## 전역 변수 선언 부분 ##
i, k = 0, 0

## 메인 코드 부분 ##
i = 0
for i in range(0, 9, 1) :
    if i<5 :
        for k in range(0,  4-i, 1) :
            print('  ', end = '')
        for k in range(0, i * 2 + 1, 1) :
            print('\u2665',  end = '')
    else :
        k = 0
        while k < i - 4 :
            print('  ', end = '')
            k += 1
        k = 0
        while k < (9 - i) * 2 - 1 :
            print('\u2665',  end = '')
            k += 1
    print()

                
