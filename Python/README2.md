import urllib.request
from bs4 import BeautifulSoup
client_id = 'ICJJx6x7ygogtezSfUgx'
client_secret = 'Saaw1DiedV'
site_url = 'https://openapi.naver.com/v1/search/book.xml'
query = input("검색어:")
q_param = "query="+urllib.parse.quote(query)
print(q_param)
query_str = site_url+'?'+q_param
print(query_str)
cid='X-Naver-Client-Id'
csec = 'X-Naver-Client-Secret'
request = urllib.request.Request(query_str) #요청 가능한 개체 생성
request.add_header(cid,client_id) # 헤더에 client id 추가
request.add_header(csec,client_secret) # 헤더 client secret 추가
response = urllib.request.urlopen(request) #웹 서버에 요청
if response.getcode() != 200:
  print("요청실패!!")
else :
  print("성공!!")
data = response.read().decode('utf-8')
hdoc = BeautifulSoup(data,'html.parser')
items = hdoc.find_all('item')

for item in items:
  print("==========")
  print("제목:", item.find('title').get_text())
  print("저자:", item.find('author').get_text())
  print("가격:", item.find('price').get_text())
