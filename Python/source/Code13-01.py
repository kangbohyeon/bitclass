import sqlite3

con = sqlite3.connect("C:/CookPython/naverDB")
cur = con.cursor()

while (True) :
    data1 = input("사용자ID ==> ")
    if data1 == "" :
        break;
    data2 = input("사용자이름 ==> ")
    sql = "INSERT INTO userTable VALUES('" + data1 + "','" + data2 + "')"
    cur.execute(sql)
    
con.commit()
con.close()
