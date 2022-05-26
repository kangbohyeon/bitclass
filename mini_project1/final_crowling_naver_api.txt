import urllib.request
import pandas as pd
import time
from bs4 import BeautifulSoup


#path = '/Users/bohyenkang/Downloads/csv/2013_1.csv'   
path = 'C:/Users/BIT/Desktop/csv/2014_1.csv'
df = pd.read_csv(path)
df2 = df['영화명']
site_url = 'https://openapi.naver.com/v1/search/movie.xml'
cid = 'X-Naver-Client-Id'
csec = 'X-Naver-Client-Secret'
client_id = 'ICJJx6x7ygogtezSfUgx'
client_secret = 'Saaw1DiedV'
cnt = 0
name = []
value = []
print(len(df2))
try : 
    for i in range(len(df2)-1):
        print(cnt)
        cnt += 1
        query = df2[i]
        print(query)
        if str(type(query)) == "<class 'float'>":
            name.append('nan')
            value.append(0)
            continue
    
        q_param = "query=" + urllib.parse.quote(query)
        yf = 'yearfrom=2013'
        yt = 'yearto=2014'
        query_str = site_url + '?' + q_param + '&' + yf + '&' + yt
    
        request = urllib.request.Request(query_str)
        request.add_header(cid, client_id)
        request.add_header(csec, client_secret)
        response = urllib.request.urlopen(request)
    
        time.sleep(1)
    
        data = response.read().decode('utf-8')
        hdoc = BeautifulSoup(data, 'html.parser')
        items = hdoc.find_all('item')
        if len(items) == 0:
            name.append(query)
            value.append(0)
            continue
        j = 0
        f = 0
    
        while True:
            if (items[j].find('pubdate').get_text() == '2013' or items[j].find('pubdate').get_text() == '2014'):
                f = 1
                # print(items[j].find('title').get_text(), items[j].find('userrating').get_text())
                name.append(query)
                value.append(items[j].find('userrating').get_text())
                break
            j += 1
            if j == len(items):
                break
    
        if f == 1:
            continue
    
        name.append(query)
        value.append(0)
except :
    data = {
        '영화명': name,
        '평점': value
    }
    df = pd.DataFrame(data)
    df.to_csv('2014_1.csv', index=True)
# print(len(name))
# print(len(value))
# print(name)

