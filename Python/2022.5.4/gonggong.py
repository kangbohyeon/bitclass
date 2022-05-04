#xml방식
import urllib.request
from bs4 import BeautifulSoup
siteurl = 'http://apis.data.go.kr/1480523/MetalMeasuringResultService/MetalService'
num_param = 'numOfRows=1'
page_param = 'pageNo=1'
res_param='resultType=xml'
sta_num=input("station선택:1 수도권,2 백령도,3 호남권,4 중부권,5 제주권,6 영남권,7 경기권,8 충청권,9 전북권,10 강원권")
sta_param= 'stationcode='+str(sta_num)
year=int(input('검색 년도:'))
month=int(input("월:"))
day=int(input("일:"))
date_parm=f'date={year}{month:02d}{day:02d}'
tc_param='timecode=RH02'
it_param='itemcode=90303'
sk_param='serviceKey=P2qtJqu0LQoXEAsNwqA%2BeQt7OKU2%2FVO6tI5QmuM%2BzodGVizcPShmjV6adrylhBrgqu6qGaqv2yjO4yYAuRaUnA%3D%3D'
query_str=siteurl+'?'+num_param+'&'+page_param+'&'+res_param+'&'+sta_param+'&'+date_parm+'&'+tc_param+'&'+it_param+'&'+sk_param
print(query_str)
response = urllib.request.urlopen(query_str)
if response.getcode()!=200:
  print("허거거거걱")
else :
  print("성공")


data = response.read().decode('utf-8')
hdoc = BeautifulSoup(data,'html.parser')


vtag = hdoc.find('value')
print(vtag.get_text(),'ng/mm')