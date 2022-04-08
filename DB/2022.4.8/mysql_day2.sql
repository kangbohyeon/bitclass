select 1+1 as result;

-- 대소문자 구분 x
use employees;

show tables;

-- 상대경로

select * from departments;
select * from dept_emp;
select * from dept_manager;

-- count() 내장함수
select count(*) from employees;
select count(*) from salaries;
select count(*) from titles;

desc titles;
select * from titles;

-- 절대경로 :  database.table
select * from employees.titles;

select * from sakila.actor;

desc sakila.city;

-- p188 컬럼 선택!
select emp_no, first_name, last_name
from employees;

desc dept_manager;
select dept_no, emp_no from dept_manager;

-- 다른 데이터 베이트
show tables from sakila;
desc sakila.actor;
select first_name , last_name from sakila.actor;


-- sakila의 city,customer_list 조회!
show tables from sakila;
select * from sakila.city;
select * from sakila.customer_list;

-- 실습 :
-- 1. use 사용하지 않은 상태에서 show databases로 확인
-- 2. sakila db의 테이블 확인
-- 3. 절대 경로 방식으로 sakila db의 film, film_actor, actor 테이블 조회
-- 4. 절대 경로 방식으로 world 의 테이블 row를 count

-- 1.
show databases;
-- 2.
show tables from sakila;
-- 3.
desc sakila.film;
select * from sakila.film;
select * from sakila.film_actor; 
select * from sakila.actor;
-- 4.
show tables from world;
select count(*) from world.city;
select count(*) from world.country;
select count(*) from world.countrylanguage;

-- p194 테이블 생성
-- 데이터 삽입!

drop database if exists sqldb;
create database sqldb;
use sqldb;

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

create table buytb1 -- 회원 구매 테이블
(num	int auto_increment not null primary key, -- 순번(pk)
 userID char(8) not null, -- 아이디(fk)
 prodName char(6) not null, -- 물품명
 groupName char(4) , -- 분류
 price int not null , -- 단가
 amount smallint not null , -- 수량
 foreign key (userID) references usertb1(userID) -- 외래키 ( buytb1 userid와 usertb1 userid연결)

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

show tables;
desc usertb1;
desc buytb1;
select * from usertb1;
select * from buytb1;

-- varchar 글자수에 맞춰 변함 (가변)
-- char 고정

-- p200 where 조건절
-- select ... from ... where 조건식 [ and, or] 
select * from usertb1
where name = '김경호';

desc usertb1;
select * from usertb1
where birthyear = 1972;


select * from usertb1
where birthyear >= 1972;


select * from usertb1
where mobile1 = '011';


select * from usertb1
where birthyear > 1970 or height > 180;

-- not
select * from usertb1
where not birthyear > 1970;

select * from usertb1
where birthyear != 1970;

select * from usertb1
where birthyear <> 1970;

-- = , >, <, <=, >=, <>, !=
-- and, or, not

-- 예) 주소가 서울이고 키가 179 이하인 사람
select * from usertb1
where addr = '서울' and height <= 179;

-- NULL
select * from usertb1
where mobile1 is NULL;

-- 예) buytb1에서 가격이 100 이상이고 그룹이름이 전자인거 
select * from buytb1
where price >= 100 and groupname = '전자';

-- 예) buytb1에서 가격이 10 이상이고 그룹이름이 전자가 아닌거 
select * from buytb1
where price >= 10 and groupname != '전자';

select * from buytb1
where price >= 10 and groupname <> '전자';

select * from buytb1
where price >= 10 and not groupname = '전자';

-- p201 between ..and, in
-- 키가 180~183인 사람
select * from usertb1
where height >= 180 and height <=183;

select * from usertb1
where height between 180 and 183;

select * from usertb1
where addr in ('경남','전남','경북');

select * from usertb1
where addr='경남' or addr = '전남' or addr ='경북';

-- 패턴 매칭.
select * from usertb1
where name like '김%'; -- 김으로 시작하는 모든 문자

select * from usertb1
where name like '%신';  -- 신으로 끝나는 모든 문자

select * from usertb1
where name like '%지%'; -- 지를 포함한 모든 이름

-- '_' 한글자
select * from usertb1
where name like '_종신'; 


-- 서브 쿼리 : 쿼리 안의 쿼리.

-- 예) 김경호보다 키가 큰사람.
 select * from usertb1
 where height > 177;
 
 select * from usertb1
 where height > (select height from usertb1 where name ='김경호');

-- p203 any/all/some
select name, height from usertb1
 where height >= (select height from usertb1 where addr ='경남');
 
 -- ANY
 select name, height from usertb1
 where height >= any (select height from usertb1 where addr ='경남');
 
  select name, height from usertb1
 where height = any (select height from usertb1 where addr ='경남');
 
   select name, height from usertb1
 where height in (select height from usertb1 where addr ='경남');
 
 -- all
 select name, height from usertb1
 where height >= all (select height from usertb1 where addr ='경남');


 select name, height from usertb1
order by name desc;

 select name, height,birthyear from usertb1
order by name,birthyear;

 select name, height,birthyear from usertb1
order by name desc ,birthyear asc;

-- distinct 중복 배제!!!
select addr from usertb1;

select distinct addr from usertb1;

-- 응용 : count(column) 
select count(*) from usertb1;

select count(distinct addr) from usertb1;

-- 응용 : count : null 인거
select count(*) from usertb1
where mobile1 is null;


create table buytb12 (select * from buytb1);

show tables;
desc buytb12;

-- p211 group by

select userid, sum(amount) from buytb1 order by userid;


-- group by를 사용해서
select userid, sum(amount) from buytb1 group by userid;

select amount from buytb1 where userid='kbs';
select amount from buytb1 where userid='bbk';


-- p192 alias
select userid as '아이디', sum(amount) as '합계' from buytb1 group by userid;

-- column index :1부터 시작...
select userid as '아이디', sum(amount) as '합계' 
from buytb1 group by userid
-- order by '합계'
-- order by 1
;

select name, addr, height, mDate, addr, mobile1, mobile2
from usertb1
-- order by height
order by 3
;

select * from buytb1;
select userid as '사용자', sum(price*amount) as '총구매액'
from buytb1
group by userid;


-- 예) 제품 그룹별 사용자가 구매한개수 (amount)합산
select * from buytb1;
select groupname, sum(amount) as '개수' from buytb1
group by groupname;

-- 예) 제품 그룹별 사용자가 제품별 매출액 (amount)합산
select * from buytb1;
select groupname, sum(amount*price) as '매출액' from buytb1
group by groupname;

-- 예) 사용자가 구매한 제품별 수량
-- 예) 제품별 사용자 구매 수량
select * from buytb1;
select groupname, count(prodname) as '수량' from buytb1
group by groupname;


select avg(amount) as '평균 구매 개수' from buytb1;
select userid,avg(amount) as '평균 구매 개수' from buytb1 group by userid;
select name, max(height), min(height) from usertb1;
select name, max(height), min(height) from usertb1 group by name;

select name , height from usertb1
where height = (select max(height) from usertb1)
 or height = (select min(height) from usertb1);
 
 -- 예) 가격이 평균가격보다 높은 가격을 가진 제품
 select * from buytb1;
 select prodname,price from buytb1
 where price > (select avg(price) from buytb1)
 ;

-- p215 카운트 : null 의미
-- p215 havomg 절

-- 사용자별 총구매액
select userid as '사용자' , sum(price * amount) as '총구매액' 
from buytb1 
group by userid;

-- 사용자별 총구매액에서 총구매액이 1000이상인 사용자
select userid as '사용자' , sum(price * amount) as '총구매액' 
from buytb1 
where sum(price*amount) > 1000
group by userid;

select userid as '사용자' , sum(price * amount) as '총구매액' 
from buytb1 
group by userid
having sum(price*amount) > 1000 ;

select userid as '사용자' , sum(price * amount) as '총구매액' 
from buytb1 
where groupname = '노트북'
group by userid
having sum(price*amount) > 1000 ;

select userid as '사용자' , sum(price * amount) as '총구매액' 
from buytb1 
group by userid
having sum(price*amount) > 1000 
order by 2;


-- p217 rollup
select num, groupname, sum(price * amount) as '비용'
from buytb1
group by groupname, num
with rollup;


-- p220 insert
create table testtbl1(
	id int,
    username char(3),
    age int
);

desc testtbl1;


insert into testtbl1 values(2,'홍길동',25);
select * from testtbl1;

-- 컬럼을 명시
insert into testtbl1(id, username) values(2,'설현');
select * from testtbl1;


-- p221  auto_increment

create table testtbl2(
	id int auto_increment primary key,
    username char(3),
    age int
);

desc testtbl2;
insert into testtbl2 values(null,'지민',25);
insert into testtbl2 values(null,'민주',20);
select * from testtbl2;

select last_insert_id();

-- p221 alter
alter table testtbl2 auto_increment = 100;
insert into testtbl2 values(null,'지민',25);
select * from testtbl2;

-- p222, p223
-- bulk insert

insert into testtbl2 values(null, '지민',21),
(null, '지민',22),
(null, '지민',23);
select * from testtbl2;

create table testtbl4(
id int, fname varchar(50), lname varchar(50)
);

insert into testtbl4
select emp_no, first_name, last_name
from employees.employees;

create table testtbl5(
select emp_no, first_name, last_name
from employees.employees
);

-- delete, update 적용!!
set sql_safe_updates = 0;
delete from testtbl4;


-- 과제1 buytbl 에서 가격이 평균가격보다 높은 가격을 가진 제품 이름과 평균가격.
select * from buytb1;
select prodname ,avg(price) as '평균가격'
from buytb1
where price>= (select avg(price) from buytb1)
group by prodname;

-- 과제 2 usertbl 에서 mobile1에 있는 null의 개수는?
select * from usertb1;
select count(*) from usertb1 where mobile1 is null;

-- 과제3 p222 auto_increment 의 step값 실습
create table testtbl3(
id int auto_increment primary key,
username char(3),
age int
);

alter table testtbl3 auto_increment=1000;

set @@auto_increment_increment=3;

insert into testtbl3 values(null, '나연', 20);
insert into testtbl3 values(null, '정연', 18);
insert into testtbl3 values(null, '모모', 19);
select * from testtbl3;