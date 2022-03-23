import sqlite3

con = sqlite3.connect("naverDB")
cur = con.cursor()
cur.execute("SELECT * FROM userTable")

print("사용자ID    사용자이름 ")
print("---------------------")

while (True) :
    row = cur.fetchone()
    if row == None :
        break
    data1 = row[0]
    data2 = row[1]
    print("%5s   %15s" % (data1, data2))

con.close()
