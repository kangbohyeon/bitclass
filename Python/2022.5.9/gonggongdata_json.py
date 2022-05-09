import urllib.request
import json

site_url = 'http://apis.data.go.kr/B552061/frequentzoneOldman/getRestFrequentzoneOldman?'
service_key = 'ServiceKey=P2qtJqu0LQoXEAsNwqA%2BeQt7OKU2%2FVO6tI5QmuM%2BzodGVizcPShmjV6adrylhBrgqu6qGaqv2yjO4yYAuRaUnA%3D%3D'
end_key = '&searchYearCd=2017&siDo=11&guGun=680&type=json&numOfRows=10&pageNo=1'
site_str = site_url + service_key + end_key
print(site_str)
request = urllib.request.Request(site_str)

response = urllib.request.urlopen(request)
if response.getcode() != 200:
    print("요청실패!!")
else:
    print("성공!!")

data = response.read().decode()
jdata = json.loads(data)

meta = jdata['items']

meta2 = meta['item']

for i in meta2:
    print(i['caslt_cnt'])
    print(i['occrrnc_cnt'])
