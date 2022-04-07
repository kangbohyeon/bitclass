show tables;

use shopdb;

show tables;


select * from producttbl;

select memberName, memberAddress from membertbl;
select * from membertbl;

select * from membertbl
where memberName = '지운이';

create table `my_table`(
id int not null,
name varchar(10)
);

drop table my_table;

create table indexTBL (
first_name varchar(14),
last_name varchar(16),
 hire_date date);

insert into indexTBL 
	select first_name, last_name,hire_date
	from employees.employees
	limit 500;
    
select * from indexTBL;

select * from indexTBL where first_name = 'Mary';

create index idx_indextbl_firstname
		on indextbl(first_name);
        
select * from indexTBL where first_name = 'Mary';


create table indexTBL (
first_name varchar(14),
last_name varchar(16),
 hire_date date,
 primary key(first_name,last_name)
 );
 
 insert into indexTBL 
	select first_name, last_name,hire_date
	from employees.employees
	limit 500;
    
select * from indexTBL where first_name = 'Mary';

    