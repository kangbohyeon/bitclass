import urllib.request
import pandas as pd
import time
from bs4 import BeautifulSoup

path = '/Users/bohyenkang/Downloads/2001_2.csv'
# path = '/Users/bohyenkang/Downloads/csv/2013_1.csv'
#path = 'C:/Users/BIT/Desktop/csv/2014_1.csv'
df = pd.read_csv(path)
df2 = df['영화명']
df3 = df['제작연도']
df4 = df['감독']
site_url = 'https://openapi.naver.com/v1/search/movie.xml'
cid = 'X-Naver-Client-Id'
csec = 'X-Naver-Client-Secret'
client_id = 'ICJJx6x7ygogtezSfUgx'
client_secret = 'Saaw1DiedV'
cnt = 0
name = []
rating = []
actor = []
print(len(df2))

try :
    for i in range(2001):
        print(cnt)
        cnt += 1
        query = df2[i]
        year = str(df3[i])
        #print(query)
        if str(type(query)) == "<class 'float'>":   #영화제목없는오류
            name.append('nan')
            actor.append('nan')
            rating.append(0)
            continue

        q_param = "query=" + urllib.parse.quote(query)
        yf = 'yearfrom=' + year
        yt = 'yearto=' + year
        query_str = site_url + '?' + q_param + '&' + yf +'&' + yt
        request = urllib.request.Request(query_str)
        request.add_header(cid, client_id)
        request.add_header(csec, client_secret)
        response = urllib.request.urlopen(request)

        time.sleep(1)

        data = response.read().decode('utf-8')
        #print(data)
        hdoc = BeautifulSoup(data, 'html.parser')
        #print(hdoc)
        items = hdoc.find_all('item')
        #print(items)
        if len(items) == 0:             # itme에 아무것도 안잡히면 내용이 없는거
            name.append(query)
            actor.append('nan')
            rating.append(0)
            continue
        j=0
        while True:
            if (items[j].find('director').get_text() not in df4[i]):            #감독명이 비슷한지 비교후 저장
                name.append(query)
                rating.append(items[j].find('userrating').get_text())
                actor.append(items[j].find('actor').get_text())
                break
            j += 1
            if j == len(items):     #items의 크기와 같으면 종료
                name.append(query)
                actor.append('nan')
                rating.append(0)
                break

    data = {
        '영화명': name,
        '평점': rating,
        '배우': actor
    }
    df = pd.DataFrame(data)
    df.to_csv('2011.csv', index=True)

except:
    data = {
        '영화명': name,
        '평점': rating,
        '배우' : actor
    }
    df = pd.DataFrame(data)
    df.to_csv('2000.csv', index=True)
