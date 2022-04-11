use sqldb;
drop table membertbl;
create table memberTBL (select userid, name, addr from usertb1 limit 3);
alter table membertbl add constraint pk_membertbl primary key (userid);
desc membertbl;

insert into membertbl values('BBK','비비코','미국');
insert into membertbl values('SJH','서장훈','서울');
insert into membertbl values('HJY','현주협','경기');


insert ignore membertbl values('BBK','비비코','미국');
insert ignore into membertbl values('SJH','서장훈','서울');
insert ignore into membertbl values('HJY','현주협','경기');
select * from membertbl;

insert into membertbl values('BBK','비비코','미국')
on duplicate key update name='비비코', addr='미국';
insert into membertbl values('DJM','동짜몽','일본')
on duplicate key update name='동짱몽', addr='일본';
select * from membertbl;

SELECT userid as '사용자', sum(price*amount) as '총구매액'
 from buytb1 group by userid
 order by 2 desc;
 
 
  with abc(userid, total)
 as
 (select userid as '사용자', sum(price*amount) as ' 총구매액'
 from buytb1 group by userid)
 select  * from abc order by total desc;
 
 with abc(사용자, 총구매액)
 as
 (select userid as '사용자', sum(price*amount) as ' 총구매액'
 from buytb1 group by userid)
 select  * from abc order by 총구매액 desc;
 
 with cte_usertb1(addr,maxHeight)
 as
 (select addr, max(height) from usertb1 group by addr)
 select avg(maxHeight*1.0) as '각 지역별 최고키의 평균' from cte_usertb1;
 
 select now();
 
select cast('2022-4-11 10:35:29.123' as date) as 'date';
select cast('2022-4-11 10:35:29.123' as time) as 'time';
select cast('2022-4-11 10:35:29.123' as datetime) as 'datetime';
 
-- p234 
-- SET @변수이름 = 변수의 값;   변수의 선언 및 값 대입
-- SELECT @변수이름;   변수의 값 출력  
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 4.25;
set @myVar4 = '가수 이름 ==>';
select @myVar1;
select @myvar2+@myvar3;
select @myvar4, name from usertb1 where height>180;

set @myvar1 = 3;
prepare myquery from 'select name, height from usertb1 order by height limit ?';
execute myquery using @myvar1;

select cast(avg(amount) as signed int)
as '평균 구매 개수' from buytb1;
select convert(avg(amount) ,signed int)
as '평균 구매 개수' from buytb1;

select '안녕','하세요';
select concat('안녕','하세요');

select num, concat(cast(price as char(10)), 'x',
					cast(amount as char(4)),'=') as '단가*수량',
		price*amount as '구매액'
from buytb1;
select concat(100,'200');
select 1> '2mega';
select 3> '2mega';
select 0 = 'mega';

select if (100>200, '참이다','거짓이다');

select ifnull(null, '널이군요'), ifnull(100,'널이군요');

select nullif(100,100),nullif(200,100);

select case 10
when 1 then'일'
when 5 then'오'
when 10 then'십'
else '모름'
end as 'case';

select case amount
	when 1 then'일'
	when 5 then'오'
	when 10 then'십'
	else '모름'
end as 'case'
from buytb1;

select ascii('A'), char(65);

select bit_length('abc'), char_length('abc'),length('abc');
select bit_length('가나다'), char_length('가나다'),length('가나다');

select elt(2,'하나','둘','셋'),
 field('둘','하나','셋'), find_in_set('둘','하나,둘,셋'), instr('하나둘셋','둘'),locate('둘','하나둘셋');
 
 select format(123456.123456,4);
 
 select bin(31), hex(31),oct(31);
 
 select insert('abcdefghi',3,4,'@@@@'), insert('abcdefghi',3,2,'@@@@');
 
 select left('abcdefghi',3),right('abcdefghi',3);
 
 select lower('abcdefghi'),upper('abcdefghi');
 
 select lpad('이것이',5,'##'), rpad('이것이',5,'##');
 
 select current_user(),database();
 select * from usertb1;
 select found_rows();
 select version();
 
 
 USE moviedb;
 select database();
CREATE TABLE movietbl 
  (movie_id        INT,
   movie_title     VARCHAR(30),
   movie_director  VARCHAR(20),
   movie_star      VARCHAR(20),
   movie_script    LONGTEXT,
   movie_film      LONGBLOB
) DEFAULT CHARSET=utf8mb4;

show tables;
select * from movietbl;

INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',  
	LOAD_FILE('C:/Desktop/Movies/Schindler.txt'), 
    LOAD_FILE('C:/Desktop/Movies/Schindler.mp4') );
select * from movietbl;

show variables like 'max_allowed_packet';
show variables like 'secure_file_priv';

TRUNCATE movietbl; -- 기존 행 모두 제거
INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',  
	LOAD_FILE('C:/Desktop/Movies/Schindler.txt'), 
    LOAD_FILE('C:/Desktop/Movies/Schindler.mp4') );
    
show tables;
use moviedb;
select * from movietbl;
TRUNCATE movietbl; -- 기존 행 모두 제거    
INSERT INTO movietbl VALUES ( 2, '쇼생크 탈출', '프랭크 다라본트', '팀 로빈스',  
	LOAD_FILE('C://Users//BIT//Desktop//movies//Shawshank.txt'), LOAD_FILE('C://Users//BIT//Desktop//movies//Shawshank.mp4') );    
    
use shopdb;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
	FROM usertb1 
    WHERE height >= 180;

SET @json='{ "usertbl" :
  [
	{"name":"임재범","height":182},
	{"name":"이승기","height":182},
	{"name":"성시경","height":186}
  ]
}' ;

SELECT JSON_VALID(@json) AS JSON_VALID;
SELECT JSON_SEARCH(@json, 'one', '성시경') AS JSON_SEARCH;
SELECT JSON_EXTRACT(@json, '$.usertbl[2].name') AS JSON_EXTRACT;
SELECT JSON_INSERT(@json, '$.usertbl[0].mDate', '2009-09-09') AS JSON_INSERT;
SELECT JSON_REPLACE(@json, '$.usertbl[0].name', '홍길동') AS JSON_REPLACE;
SELECT JSON_REMOVE(@json, '$.usertbl[0]') AS JSON_REMOVE;



-- p273 조인
-- 네츄럴조인(동등조인)
select name, userid
from usertb1;

-- 구매한 사용자 이름, 아이디, 주소?
select name, usertb1.userid,addr
from usertb1, buytb1
where usertb1.userid = buytb1.userid
;

select * from buytb1
inner join usertb1
on buytb1.userid = usertb1.userid;

select name, usertb1.userid,addr from buytb1
inner join usertb1
on buytb1.userid = usertb1.userid;

SELECT * 
   FROM buytb1
     INNER JOIN usertb1
        ON buytb1.userID = usertb1.userID
   WHERE buytb1.userID = 'JYP';    
   
   
   
-- p278 테이블 이름 alias
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buytb1 B
     INNER JOIN usertb1 U
        ON B.userID = U.userID
   ORDER BY B.num; 
   
SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buytb1 B
     INNER JOIN usertb1 U
        ON B.userID = U.userID
   WHERE B.userID = 'JYP';
   
  -- 전체회원의 구매 목록 
SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM usertb1 U
     INNER JOIN buytb1 B
        ON U.userID = B.userID 
   WHERE B.userID = 'JYP';
   
   
SELECT DISTINCT U.userID, U.name,  U.addr
   FROM usertb1 U
     INNER JOIN buytb1 B
        ON U.userID = B.userID 
   ORDER BY U.userID ;
   
   create database sqldb;
   use sqldb;
   CREATE TABLE stdtbl 
( stdName    VARCHAR(10) NOT NULL PRIMARY KEY,
  addr	  CHAR(4) NOT NULL
);
CREATE TABLE clubtbl 
( clubName    VARCHAR(10) NOT NULL PRIMARY KEY,
  roomNo    CHAR(4) NOT NULL
);
CREATE TABLE stdclubtbl
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   stdName    VARCHAR(10) NOT NULL,
   clubName    VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
INSERT INTO stdtbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'),('바비킴','서울');
INSERT INTO clubtbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubtbl VALUES (NULL, '김범수','바둑'), (NULL,'김범수','축구'), (NULL,'조용필','축구'), (NULL,'은지원','축구'), (NULL,'은지원','봉사'), (NULL,'바비킴','봉사');

SELECT S.stdName, S.addr, SC.clubName, C.roomNo
   FROM stdtbl S 
      INNER JOIN stdclubtbl SC
           ON S.stdName = SC.stdName
      INNER JOIN clubtbl C
           ON SC.clubName = C.clubName 
   ORDER BY S.stdName;
-- natural join   
select S.stdName, S.addr, SC.clubName, C.roomNo
from stdtbl S , stdclubtbl SC,  clubtbl C
where S.stdName = SC.stdName and SC.clubName = C.clubName 
order by S.stdName;

select  userid, name,  mobile1, mobile2 from usertb1;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM usertb1 U
      LEFT OUTER JOIN buytb1 B
         ON U.userID = B.userID 
   ORDER BY U.userID;
   
   -- cross join
  select * from buytb1 cross join usertb1; 
  
  -- self join
  select * from usertb1 a, usertb1 b
  where a.userid = b.userid;
  
  drop database tabledb;
  create database tabledb;
  use tabledb;
  

DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  addr	  CHAR(2) NOT NULL,
  mobile1	CHAR(3) NULL, 
  mobile2   CHAR(8) NULL, 
  height    SMALLINT NULL, 
  mDate    DATE NULL 
);
CREATE TABLE buytbl 
(  num INT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
);


DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
);


DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
   , FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

desc buytbl;
desc usertbl;

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
select * from usertbl;

INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
  
  
  
DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl 
(
   userid  CHAR(8) NOT NULL,
   prodName CHAR(6) NOT NULL,
   groupName CHAR(4) NULL , 
   price     INT  NOT NULL,
   amount    SMALLINT  NOT NULL 
   , constraint primary key pk_buytbl_userid(userid)
);
desc buytbl;  


DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
(   userID  CHAR(8) NOT NULL, 
    name    VARCHAR(10) NOT NULL, 
    birthYear   INT NOT NULL
);
ALTER TABLE usertbl
     ADD CONSTRAINT PK_usertbl_userID 
     PRIMARY KEY (userID);
DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL
);
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) ;
    
    
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) primary key ,
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL
 
);
CREATE TABLE buytbl 
(  num INT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   foreign key(userid) references usertbl(userid)
);

show index from buytbl;
desc usertbl;
desc buytbl;

INSERT INTO usertbl VALUES('LSG', '이승기', 1987);
select * from usertbl;
INSERT INTO buytbl VALUES(null, 'KBS', '운동화');


ALTER TABLE buytbl
    ADD CONSTRAINT FK_usertbl_buytbl 
    FOREIGN KEY (userID) 
    REFERENCES usertbl(userID);

SHOW INDEX FROM buytbl ;


DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) primary key ,
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL
 
);
CREATE TABLE buytbl 
 (num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   userid  CHAR(8) NOT NULL ,
   prodName CHAR(6) NOT NULL,
   foreign key(userid) references usertbl(userid)
   ON UPDATE CASCADE
   on delete cascade
);


show index from buytbl;
INSERT INTO usertbl VALUES('LSG', '이승기', 1987);
INSERT INTO buytbl VALUES(null, 'LSG', '운동화');
select * from usertbl;
select * from buytbl;

delete from usertbl;

-- p333~ 335

-- unique
USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL  UNIQUE
);

insert into usertbl values ('AAA','이름',1777,'a@com');
insert into usertbl values ('AAB','이름',1777,'a@com');

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL ,  
  CONSTRAINT AK_email  UNIQUE (email)
);


-- check
-- 출생연도가 1900년 이후 그리고 2023년 이전, 이름은 반드시 넣어야 함.
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8) PRIMARY KEY,
  name    VARCHAR(10) , 
  birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2023),
  mobile1	char(3) NULL, 
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)  
);

-- 휴대폰 국번 체크
ALTER TABLE usertbl
	ADD CONSTRAINT CK_mobile1
	CHECK  (mobile1 IN ('010','011','016','017','018','019')) ;
-- default
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  	CHAR(8) NOT NULL PRIMARY KEY,  
  name    	VARCHAR(10) NOT NULL, 
  birthYear	INT NOT NULL DEFAULT -1,
  addr	  	CHAR(2) NOT NULL DEFAULT '서울',
  mobile1	CHAR(3) NULL, 
  mobile2	CHAR(8) NULL, 
  height	SMALLINT NULL DEFAULT 170, 
  mDate    	DATE NULL
);
desc usertbl;

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl 
( userID  	CHAR(8) NOT NULL PRIMARY KEY,  
  name    	VARCHAR(10) NOT NULL, 
  birthYear	INT NOT NULL,
  addr	  	CHAR(2) NOT NULL,
  mobile1	CHAR(3) NULL, 
  mobile2	CHAR(8) NULL, 
  height	SMALLINT NULL, 
  mDate    	DATE NULL
);
ALTER TABLE usertbl
	ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE usertbl
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE usertbl
	ALTER COLUMN height SET DEFAULT 170;

-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO usertbl VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2023.12.12');
-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO usertbl(userID, name) VALUES('KAY', '김아영');
-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO usertbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2020.5.5');
SELECT * FROM usertbl;

-- p355
create view v_usertbl
as select userid,name,addr from usertbl;

select * from v_usertbl;
desc usertbl;
desc v_usertbl;

create or replace view v_usertbl
as select userid,addr from usertbl;

select * from v_usertbl;


-- p 346 ~ 354

USE tabledb;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl 
( userID  CHAR(8), 
  name    VARCHAR(10),
  birthYear   INT,  
  addr	  CHAR(2), 
  mobile1	CHAR(3), 
  mobile2   CHAR(8), 
  height    SMALLINT, 
  mDate    DATE 

);
CREATE TABLE buytbl 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  CHAR(8),
   prodName CHAR(6),
   groupName CHAR(4),
   price     INT ,
   amount   SMALLINT
);


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL,'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);


ALTER TABLE usertbl
	ADD CONSTRAINT PK_usertbl_userID
	PRIMARY KEY (userID);

DESC usertbl;
desc buytbl;

ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);
select * from buytbl;
DELETE FROM buytbl WHERE num = 4;
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID);

INSERT INTO buytbl VALUES(NULL,'BBK', '모니터', '전자', 200,  5);

SET foreign_key_checks = 0;
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
SET foreign_key_checks = 1;

ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );

UPDATE usertbl SET birthYear=1979 WHERE userID='KBS';
UPDATE usertbl SET birthYear=1971 WHERE userID='KKH';

ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2023) AND (birthYear IS NOT NULL) );
    
INSERT INTO usertbl VALUES('TKV', '태권뷔', 2999, '우주', NULL  , NULL , 186, '2023-12-12');

INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';

SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid ;


SELECT COUNT(*) FROM buytbl;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     LEFT OUTER JOIN usertbl U
        ON B.userid = U.userid
   ORDER BY B.userid ;


SET foreign_key_checks = 0;
UPDATE usertbl SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

desc buytbl;

desc usertbl;

ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE;

UPDATE usertbl SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userid = U.userid
  ORDER BY B.userid;

DELETE FROM usertbl WHERE userID = 'VVK';

ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
ALTER TABLE buytbl 
	ADD CONSTRAINT FK_usertbl_buytbl
		FOREIGN KEY (userID)
		REFERENCES usertbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

DELETE FROM usertbl WHERE userID = 'VVK';
SELECT * FROM buytbl ;

ALTER TABLE usertbl
	DROP COLUMN birthYear ;