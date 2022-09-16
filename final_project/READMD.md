6.29~7.3 : 주제선정 및 Django 공부

7.4 ~ 7.6 : spring boot 공부 및 aws spring boot 배포 및 spring boot, react 연동

7.7 ~ 7.10 : 데이터 전처리 

7.11 ~ 7.12 :spring boot security 공부

7.13 ~ 7.15 : spring boot JWT 공부  

7.16 ~ 7.18 : spring boot dto를 이용한 CRUD

7.18 ~ 7.19 : react, spring boot aws에 올려서 연동, git 공부

7.20 : spring boot rest api 공부

7.21 : spring boot rest api 공부, security 공부 및 구현

7.22 ~ 7.24 : spring boot security, jwt 공부 및 구현

7.25 : 회원가입 구현

7.26 : 로그인 구현

7.27 : jwt 토큰 이용하여 로그인 구현

7.28 : access, refresh token 구현

7.29 : react와 토큰을 이용한 로그인, 회원가이 연동

7.30 : 로그아웃 구현

7.31 ~ 8.1 : 휴가

8.2 : react 와 login, signup 연동

8.3 : react 와 board get 연동

8.4 : flask를 이용한 챗봇 공부

8.5 : react와 flask를 이용한 챗봇 공부,  react 와 board post 연동

8.6 : 프로젝트에 쓸 스택 찾기

8.7 : 농사로 api 자료 신청, 프로젝트 이벤트를 신청도와주는 챗봇정보찾음

8.8 : 농사로 api 자료 크롤링, 프로젝트 이벤트를 신청도와주는 챗봇정보찾음, 게시판 첨부파일 연동중

8.9 : 프로젝트 이벤트를 신청도와주는 챗봇정보찾음

8.10 : react와 spring boot board 연동(get, post,첨부파일)

8.11 : react와 spring boot myplant 연동(get, post,첨부파일)

8.12 : spring boot 게시판 post 첨부파일 저장

8.13 : react와 spring boot 게시판 post 첨부파일 저장끝, get 첨부파일

8.14 : react와 spring boot 게시판 첨부파일 get 끝

8.15 : 챗봇 데이터 수집

8.16 : react와 spring boot 게시판 첨부파일 delete 끝

8.17 : 식물 데이터 selenium을 이용한 웹크롤링

8.18 : 기존 react에 챗봇 react 추가중 

8.19 : 기존 react에 챗봇 react 추가 완료, 가족졸업식

8.20 : ec2와 s3연동 찾아보기

8.21 : aws에 백엔드 배포(aws bucket에 파일업로드후 ec2로 다운로드해보기, build는 실패, 

8.22 : aws 백앤드 s3파일업로드하기, 게시판 update 완료 

8.23 : aws 백앤드 s3파일업로드하기

8.24 : ppt제작후 강사님 피드백

8.25 : 식물검색 페이지 제작

8.26 : 중간발표

8.27 ~ 8.28 : 멘탈정리, 질병데이터 검색

8.29 : 레코그니션을 통하여 질병분류 

8.30 : s3 board CRUD업로드 완료

8.31 : myplant s3 CRUD완료, aws인스턴스 테러발생(4700달러)

9.1 : rekgnition 모델 완료

9.2 : 카카오 로그인 구현

9.3 : 카카오 로그인 구현

9.4 : 카카오 로그인 구현 완료

9.5 : spring web client활용하여 flask와 연결

9.6 : spring web client활용하여 flask chatbot와 연결완료

9.7 : spring web client활용하여 flask rekognition와 연결완료

9.8 : 이력서 작성

9.9 : 이력서 작성

9.10 ~ 9.12 : 추석

9.13 : spring boot naver login 연결 완료

9.14 : chatterbot storage를 sqlite3에서 mongodb로 변경, flask chat_server와 rekognition_server로 나누는중 

9.15 : flask chat_server와 rekognition_server로 나누기완료 

9.16 : 코드 refactory, npm install --save --legacy-peer-deps로 node_modules 설치

프로젝트하면서 어려웠던점

1. spring boot구조 파악

2. 개념부족으로 서버연동하는데 어려웠음 ( ex. localhost:8000/api 랑 localhost:3000/api랑 api만 맞으면 연동가능)

3. 토큰교환 방식 고민
고민방식해결 : 
accesstoken만료시 back에서 accesstoken와 refreshtoken 재발급후 저장하고 권한거부를 내보내지않음
refreshtoken 만료시 권한거부를 내보내 재로그인할수 잇게 설정

4. @Transactional때문에 delete 와 try~catch가 같이 작동이 안됩니다.

5. web client를 사용하면서 json형태로 보내지 않으며 오류가 나는 현상

6. rekognition을 사용하면서 s3 디렉토리안에 있는 이미지를 사용할때 버킷이름이 아닌 image이름에 경로를 나타내야 접근가능

7. jpa를 사용하면서 dto명고 일치하지 않으면 의존성주입 거부

8. kakao login할때 인가코드를 받고 redirect 주소를 back로하면 front에서 href를 할수없어 front에서 인가코드를 받아 back로 보내주어 해결   




