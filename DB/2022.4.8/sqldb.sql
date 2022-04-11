use shopdb;
create table usertb1  -- 회원 테이블
(
		-- 컬럼 형식(크기)
	userid    char(8) not null primary key, -- 아이디
    name      varchar(10) not null, -- 이름
    birthyear int not null, -- 출생년도
    addr      char(2) not null,  -- 지역(경기, 서울, 경남 식으로 2글자만 입력)
    mobile1   char(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
    mobile2   char(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
    height    smallint, -- 키
    mDate     date -- 회원 가입일

);
insert into usertb1 values('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
insert into usertb1 values('KBs','김범수',1979,'경남','011','2222222',173,'2012-4-4');
insert into usertb1 values('KKH','김경호',1971,'전남','019','3333333',177,'2007-7-7');
insert into usertb1 values('JYP','조용필',1950,'경기','011','4444444',166,'2009-4-4');
insert into usertb1 values('SSK','성시경',1979,'서울',NULL,null,186,'2013-12-12');
insert into usertb1 values('LJB','임재범',1963,'서울','016','6666666',182,'2009-9-9');
insert into usertb1 values('YJS','윤종신',1969,'경남',null,null,170,'2005-5-5');
insert into usertb1 values('EJW','은지원',1972,'경북','011','8888888',174,'2014-3-3');
insert into usertb1 values('JKW','조관우',1965,'경기','018','9999999',172,'2010-10-10');
insert into usertb1 values('BBK','바비킴',1973,'서울','010','0000000',176,'2013-5-5');



create table buytb1 -- 회원 구매 테이블
(num	int auto_increment not null primary key, -- 순번(pk)
 userID char(8) not null, -- 아이디(fk)
 prodName char(6) not null, -- 물품명
 groupName char(4) , -- 분류
 price int not null , -- 단가
 amount smallint not null , -- 수량
 foreign key (userID) references usertb1(userID) -- 외래키 ( buytb1 userid와 usertb1 userid연결)

);

insert into buytb1 values(null, 'KBS','운동화',null,30,2);
insert into buytb1 values(null, 'KBS','노트북','전자',1000,1);
insert into buytb1 values(null, 'JYP','모니터','전자',200,1);
insert into buytb1 values(null, 'BBK','모니터','전자',200,5);
insert into buytb1 values(null, 'KBS','청바지','의류',50,3);
insert into buytb1 values(null, 'BBK','메모리','전자',80,10);
insert into buytb1 values(null, 'SSK','책','서적',15,5);
insert into buytb1 values(null, 'EJW','책','서적',15,2);
insert into buytb1 values(null, 'EJW','청바지','의류',50,1);
insert into buytb1 values(null, 'BBK','운동화',null,30,2);
insert into buytb1 values(null, 'EJW','책','서적',15,1);
insert into buytb1 values(null, 'BBK','운동화',null,30,2);