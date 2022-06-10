참고사이트 : https://www.w3schools.com/


tomcat 

20번째줄 수정

port : 8001

127번째줄 수정

    <Connector protocol="AJP/1.3"
               address="::1"
               port="8009"
               redirectPort="8443" 
               secretRequired="false"/>



eclipc.ini

-vm

C:/Program Files/Java/11.0.15.1/bin/javaw.exe

-vmargs

-javaagent:C:\Users\BIT\Downloads\eclipse-jee-2021-03-R-win32-x86_64\eclipse\lombok.jar


lombok dowload

https://projectlombok.org/download

다운로드폴더에서 shift+우클릭 -> 여기서 powershell

java -jar lombok.jar

lombok 설치완료후 eclipce폴더에 lombok 복사


import 후 
ex00/pom.xml에서 mysql검색후 밑에내용 추가

<dependency>
  
<groupId>com.oracle.ojdbc</groupId>
  
<artifactId>ojdbc8</artifactId>
  
<version>19.3.0.0</version>
  
</dependency>



ex00 우클릭 -> maven -> updata project 

window -> web server -> chrom
