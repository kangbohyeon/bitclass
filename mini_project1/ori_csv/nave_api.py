import urllib.request
import pandas as pd
import time
from bs4 import BeautifulSoup

path = '/Users/bohyenkang/Downloads/csv/2011_1.csv'
df = pd.read_csv(path)
df2 = df['영화명'].unique()
site_url = 'https://openapi.naver.com/v1/search/movie.xml'
cid = 'X-Naver-Client-Id'
csec = 'X-Naver-Client-Secret'
client_id = 'NDMRiR8oZrXW2jqlOWRM'
client_secret = 'ousIWP7gpJ'
cnt = 0
name = []
value = []
print(len(df2))
for i in range(len(df2)-1):
    print(cnt)
    cnt += 1
    query = df2[i]

    q_param = "query=" + urllib.parse.quote(query)
    query_str = site_url + '?' + q_param

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
        if (items[j].find('pubdate').get_text() == '2011'):
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

    query2 = df2[i] + ' 2011'
    q_param = "query=" + urllib.parse.quote(query2)
    query_str = site_url + '?' + q_param

    request = urllib.request.Request(query_str)
    request.add_header(cid, client_id)
    request.add_header(csec, client_secret)
    response = urllib.request.urlopen(request)

    time.sleep(1)

    data = response.read().decode('utf-8')
    hdoc = BeautifulSoup(data, 'html.parser')
    items = hdoc.find_all('item')

    for item in items:
        if (item.find('pubdate').get_text() == '2011'):
            # print(item.find('title').get_text(), item.find('userrating').get_text())
            name.append(query)
            value.append(item.find('userrating').get_text())
            f = 1
            break

    if f == 0:
        name.append(query)
        value.append(0)

data = {
    '영화명': name,
    '평점': value
}
df = pd.DataFrame(data)
df.to_csv('2011.csv', index=True)
# print(len(name))
# print(len(value))
# print(name)
