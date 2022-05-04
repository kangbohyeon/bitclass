import urllib.request
from bs4 import BeautifulSoup
import json
site_url = 'https://openapi.naver.com/v1/search/shop.json'

query = input("검색어:")

q_param = "query="+urllib.parse.quote(query)
print(q_param)
query_str = site_url+'?'+q_param
print(query_str)
cid='X-Naver-Client-Id'
csec = 'X-Naver-Client-Secret'
client_id = 'ICJJx6x7ygogtezSfUgx'
client_secret = 'Saaw1DiedV'
request = urllib.request.Request(query_str)
request.add_header(cid,client_id)
request.add_header(csec,client_secret)
response = urllib.request.urlopen(request)
if response.getcode() != 200:
  print("요청실패!!")
else :
  print("성공!!")

data = response.read().decode()
jdata = json.loads(data)
meta = jdata['items']
for item in meta:
  print("제목:", item['title'])


