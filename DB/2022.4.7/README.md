## Chapter2 MySQL설치
  - MySQL 설치 전 준비사항
    - 소프트웨어 요구사항
  - MySQL 설치
  - 샘플 데이터베이스 설치
  - 설치 후에 확인할 사항
  - MySQL 제거
  
## Chapter3 MySQL 전체 운영 실습
  - 요구사항 분석과 시스템 설계 그리고 모델링
    - 정보시스템 구축 절차 요약
    - 데이터베이스 모델링과 필수 용어
  - MySQL을 이용한 데이터베이스 구축 절차
    - 데이터베이스 생성
    - 테이블 생성
    - 데이터 입력
    - 데이터 활용 
  - 테이블 외의 데이터베이스 개체의 활용
    - 인덱스


# MySQL 다운로드 방법 및 employees import
    https://dev.mysql.com/downloads/
    -> MySQL installer for windows
    -> windows, MSI installer (사이즈큰거 web말고)

    https://cafe.naver.com/thisisMYSQL 접속
    -> 교재 자료실
    -> 1144번 [MySQL 8.0] 샘플 데이터베이스(employees) 다운로드
    -> 알집풀어서 바탕화면 저장

    cmd 
    -> cd desktop\employees

    ->"program files\MySQL\MySQL Server8.0\bin\mysql.exe" -uroot -p 

    -> source employees.sql;

# p60 ~ p76까지 실습
    - 테이블 생성
    - 데이터 insert
    - 인덱스
