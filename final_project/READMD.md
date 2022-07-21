6.29~7.3 : 주제선정 및 Django 공부

7.4 ~ 7.6 : spring boot 공부 및 aws spring boot 배포 및 spring boot, react 연동

7.7 ~ 7.10 : 데이터 전처리 

7.11 ~ 7.12 :spring boot security 공부

7.13 ~ 7.15 : spring boot JWT 공부  

7.16 ~ 7.18 : spring boot dto를 이용한 CRUD

7.18 ~ 7.19 : react, spring boot aws에 올려서 연동, git 공부

7.20 : spring boot rest api 공부

7.21 : spring boot rest api 공부, security 공부 및 구현



프로젝트하면서 어려웠던점

1. spring boot구조 파악

2. 개념부족으로 서버연동하는데 어려웠음 ( ex. localhost:8000/api 랑 localhost:3000/api랑 api만 맞으면 연동가능)


개념 공부 

csrf를 사용하지 않는 이유 : rest api를 이용한 서버라면, session 기반 인증과는 다르게 stateless하기 때문에 서버에 인증정보를 보관하지 않는다. rest api에서 client는 권한이 필요한 요청을 하기 위해서는 요청에 필요한 인증 정보를(OAuth2, jwt토큰 등)을 포함시켜야 한다. 따라서 서버에 인증정보를 저장하지 않기 때문에 굳이 불필요한 csrf 코드들을 작성할 필요가 없다.
