#json 방식
import urllib.request
import json
from bs4 import BeautifulSoup
mykey = '1bc56ac190718591528ae1dfa1592db7' #카카오 애플리케이셔 REST API키
auth_key = "KakaoAK " + mykey # 공백 있습니다.
siteurl = "https://dapi.kakao.com/v3/search/book"
auth = "Authorization"
p_target = "target=title"
query = input("검색어:")
p_query = "query="+ urllib.parse.quote(query) # 쿼리를 utf-8로 인코딩한 후 p_query에 값으로 추가, .quote = utf-8로 자동인식하게해주는거
query_str = siteurl+'?'+p_target+'&'+p_query
print(query_str)
request= urllib.request.Request(query_str) # 인증 등의 헤더를 전달할 때는 requst 객체를 생성
request.add_header(auth,auth_key) #헤더 추가
response = urllib.request.urlopen(request) # 입력인자로 사이트 주소 혹은 request 개체 전달
if response.getcode() != 200 :
  print("허걱 실패!!")
else :
  print("요청 성공")


result = response.read().decode('utf-8')
print(result)

jdata = json.loads(result)
print(jdata)

meta = jdata['meta']
print(meta)
documents = jdata['documents']
print(documents)
for document in documents :
  print("=================")
  print(document)
  print()

for document in documents :
  print("=================")
  print("제목:",document['title'])
  print("저자 목록 :",document['authors'])
  print()

