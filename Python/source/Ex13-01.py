import sqlite3

## 전역 변수 선언 부분 ##
inStr = '''죽는 날까지 하늘을 우러러 한 점 부끄럼이 없기를,
잎새에 이는 바람에도 나는 괴로워했다.
별을 노래하는 마음으로 모든 죽어가는 것을 사랑해야지.
그리고 나한테 주어진 길을 걸어가야겠다.
오늘 밤에도 별이 바람에 스치운다. '''
con, cur = None, None
onechar, count = "", 0

## 메인 코드 부분 ##
if __name__ == "__main__" :
    con = sqlite3.connect("C:/CookPython/countDB")  
    cur = con.cursor()
    cur.execute("DROP TABLE IF EXISTS countTable")
    cur.execute("CREATE  TABLE  countTable(onechar  TEXT , count INT)") # 문자, 개수
    
    for ch in inStr :
        if  'ㄱ' <= ch <= '힣' :
            cur.execute("SELECT * FROM countTable WHERE onechar = '" + ch + "'")
            row = cur.fetchone()
            if row == None :
                cur.execute("INSERT INTO countTable VALUES('" + ch + "'," + str(1) + ")")
            else :
                cnt = row[1]
                cur.execute("UPDATE countTable SET count =" + str(cnt+1) + " WHERE onechar = '" + ch + "'")

    con.commit()
        
    cur.execute("SELECT * FROM countTable order by count DESC")
    print('원문\n', inStr)
    print('-------------------------')
    print('문자\t빈도수')
    print('-------------------------')
    while (True) :
        row = cur.fetchone()
        if row== None :
            break;
        ch = row[0]
        cnt = row[1]
        print("%4s   %5d" % (ch, cnt))

    con.close()
