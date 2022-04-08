-- varchar 글자수에 맞춰 변함 (가변)
-- char 고정

-- delete, update 적용!!
set sql_safe_updates = 0;



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
