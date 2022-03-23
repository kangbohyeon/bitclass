import sqlite3

# 변수 선언 부분
con, cur = None, None
data1, data2, data3, data4 = "", "", "", ""
sql=""

# 메인 코드 부분
con = sqlite3.connect("C:/CookPython/naverDB")
cur = con.cursor()
cur.execute("CREATE TABLE productTable(pCode char(5), pName, price int, amount int)")

while (True) :
    data1 = input("제품코드 ==> ")
    if data1 == "" :
        break;
    data2 = input("제품명 ==> ")
    data3 = input("가격 ==> ")
    data4 = input("재고수량 ==> ")
    sql = "INSERT INTO productTable VALUES('" + data1 + "','" + data2 + "'," + data3 + "," + data4 + ")"
    cur.execute(sql)
    
con.commit()
con.close()
