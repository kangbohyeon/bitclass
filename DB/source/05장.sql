
/* 05장 */


-- <실습 1> --

-- </실습 1> --



-- <실습 2> --

-- </실습 2> --



-- <실습 3> --

USE employees;
SELECT * FROM employees;

use shopDB;
select * from membertbl;

USE ShopDB;
CREATE TABLE test (id INT);

USE ShopDB;
CREATE TABLE test (id INT);
INSERT INTO test VALUES(1);

USE employees;
SELECT * FROM employees;

SELECT * FROM employees ;

-- </실습 3> --



-- <실습 4> --

/*
ip addr 
cmd
ping Linux_IP_주소 
*/

show databases;
create database mydb;
use mydb;
create table mytbl (uname char(10));
insert into mytbl values ('마이리틀텔레비전');
select * from mytbl;

use mydb;
insert into mytbl values ('MyLittleTV');
select * from mytbl;


/*
exit 
shutdown -h now 
*/

-- </실습 4> --



-- <실습 5> --

CREATE USER director@'%' IDENTIFIED BY 'director';
GRANT ALL ON *.* TO director@'%' WITH GRANT OPTION;

CREATE USER ceo@'%' IDENTIFIED BY 'ceo';
GRANT SELECT ON *.* TO ceo@'%';

CREATE USER staff@'%' IDENTIFIED BY 'staff';
GRANT SELECT, INSERT, UPDATE, DELETE ON shopdb.* TO staff@'%';
GRANT SELECT ON employees.* TO staff@'%';

CREATE DATABASE sampleDB;
DROP DATABASE sampleDB;

USE ShopDB;
SELECT * FROM membertbl;

USE ShopDB;
SELECT * FROM memberTBL;
DELETE FROM memberTBL WHERE memberID = 'Sang';

DROP TABLE memberTBL;

USE employees;
SELECT * FROM employees;

-- </실습 5> --
