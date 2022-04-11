
/* 03장 */

-- <실습 1> --

-- </실습 1> --



-- <실습 2> --

-- </실습 2> --



-- <실습 3> --

-- </실습 3> --



-- <실습 4> --

SELECT * FROM memberTBL;

SELECT memberName, memberAddress FROM memberTBL;

SELECT * FROM memberTBL WHERE memberName = '지운이' ;

CREATE TABLE `my TestTBL` (id INT);

DROP TABLE `my TestTBL` ;

-- </실습 4> --


SELECT * FROM productTBL WHERE prodName = '세탁기' ;


-- <실습 5> --

CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16) , hire_date date);
INSERT INTO indexTBL 
	SELECT first_name, last_name, hire_date 
	FROM employees.employees
	LIMIT 500;
SELECT * FROM indexTBL;

SELECT * FROM indexTBL WHERE first_name = 'Mary';

CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);

SELECT * FROM indexTBL WHERE first_name = 'Mary';

-- </실습 5> --



-- <실습 6> --

CREATE VIEW uv_memberTBL 
AS
	SELECT memberName, memberAddress FROM memberTBL ;

SELECT * FROM uv_memberTBL ;

-- </실습 6> --



-- <실습 7> --

SELECT * FROM memberTBL WHERE memberName = '당탕이';
SELECT * FROM productTBL WHERE productName = '냉장고';

DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '당탕이' ;
	SELECT * FROM productTBL WHERE productName = '냉장고' ;
END // 
DELIMITER ;

CALL myProc() ;

-- </실습 7> --



-- <실습 8> --

INSERT INTO memberTBL VALUES ('Figure', '연아', '경기도 군포시 당정동');

SELECT * FROM memberTBL ;

UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';

SELECT * FROM memberTBL ;

DELETE FROM memberTBL WHERE memberName = '연아';

SELECT * FROM memberTBL ;

CREATE TABLE deletedMemberTBL (  
	memberID char(8) ,
	memberName char(5) ,
	memberAddress  char(20),
	deletedDate date  -- 삭제한 날짜
);

DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL  -- 트리거 이름
	AFTER DELETE -- 삭제 후에 작동하게 지정
	ON memberTBL -- 트리거를 부착할 테이블
	FOR EACH ROW -- 각 행마다 적용시킴
BEGIN 
	-- OLD 테이블의 내용을 백업테이블에 삽입
	INSERT INTO deletedMemberTBL 
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() ); 
END //
DELIMITER ;

SELECT * FROM memberTBL;

DELETE FROM memberTBL WHERE memberName = '당탕이';

SELECT * FROM memberTBL;

SELECT * FROM deletedMemberTBL;

-- </실습 8> --



-- <실습 9> --

USE ShopDB;
SELECT * FROM productTBL;

DELETE FROM productTBL;

SELECT * FROM productTBL;

USE sys; -- 일단 다른 DB를 선택함

USE ShopDB;
SELECT * FROM productTBL

-- </실습 9> --



-- <실습 10> --

/*

C:\WINDOWS\syswow64\odbcad32.exe 

SELECT * FROM memberTBL 

*/

-- </실습 10> --


