
/* 07장 */


SELECT CAST('2020-10-19 12:35:29.123' AS DATE) AS 'DATE' ;
SELECT CAST('2020-10-19 12:35:29.123' AS TIME) AS 'TIME' ;
SELECT CAST('2020-10-19 12:35:29.123' AS DATETIME) AS 'DATETIME' ; 


-- <실습 1> --

USE sqldb;

SET @myVar1 = 5 ;
SET @myVar2 = 3 ;
SET @myVar3 = 4.25 ;
SET @myVar4 = '가수 이름==> ' ;

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4 , Name FROM usertbl WHERE height > 180 ;

SET @myVar1 = 3 ;
PREPARE myQuery 
    FROM 'SELECT Name, height FROM usertbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1 ;

-- </실습 1> --

USE sqldb ;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수'  FROM buytbl ;
-- 또는
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수'  FROM buytbl ;

SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)) ,'=' )  AS '단가X수량',
	price*amount AS '구매액' 
  FROM buytbl ;

SELECT '100' + '200' ; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
SELECT CONCAT('100', '200'); -- 문자와 문자를 연결 (문자로 처리)
SELECT CONCAT(100, '200'); -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
SELECT 1 > '2mega'; -- 정수인 2로 변환되어서 비교
SELECT 3 > '2MEGA'; -- 정수인 2로 변환되어서 비교
SELECT 0 = 'mega2'; -- 문자는 0으로 변환됨

SELECT IF (100>200, '참이다', '거짓이다');

SELECT IFNULL(NULL, '널이군요'), IFNULL(100, '널이군요');

SELECT NULLIF(100,100), IFNULL(200,100);

SELECT 	CASE 10
		WHEN 1  THEN  '일'
		WHEN 5  THEN  '오'
		WHEN 10 THEN  '십' 
		ELSE '모름'
	END AS 'CASE연습';

SELECT ASCII('A'), CHAR(65);

SELECT BIT_LENGTH('abc'),  CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'),  CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT CONCAT_WS('/', '2025', '01', '01');

SELECT ELT(2, '하나', '둘', '셋'), FIELD('둘', '하나', '둘', '셋'), FIND_IN_SET('둘', '하나,둘,셋'), INSTR('하나둘셋', '둘'), LOCATE('둘', '하나둘셋');

SELECT FORMAT(123456.123456, 4);

SELECT BIN(31), HEX(31), OCT(31);

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##');

SELECT LTRIM('   이것이'), RTRIM('이것이   ');

SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

SELECT REPEAT('이것이', 3);

SELECT REPLACE ('이것이 MySQL이다', '이것이' , 'This is');

SELECT REVERSE ('MySQL');

SELECT CONCAT('이것이', SPACE(10), 'MySQL이다');

SELECT SUBSTRING('대한민국만세', 3, 2);

SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2),  SUBSTRING_INDEX('cafe.naver.com', '.', -2);

SELECT ABS(-100);

SELECT CEILING(4.7), FLOOR(4.7), ROUND(4.7);

SELECT CONV('AA', 16, 2), CONV(100, 10, 8);

SELECT DEGREES(PI()), RADIANS(180);

SELECT MOD(157, 10), 157 % 10, 157 MOD 10;

SELECT POW(2,3), SQRT(9);

SELECT RAND(), FLOOR(1 + (RAND() * (6-1)) );

SELECT SIGN(100), SIGN(0), SIGN(-100.123);

SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

SELECT ADDDATE('2025-01-01', INTERVAL 31 DAY), ADDDATE('2025-01-01', INTERVAL 1 MONTH);
SELECT SUBDATE('2025-01-01', INTERVAL 31 DAY), SUBDATE('2025-01-01', INTERVAL 1 MONTH);

SELECT ADDTIME('2025-01-01 23:59:59', '1:1:1'), ADDTIME('15:00:00', '2:10:10');
SELECT SUBTIME('2025-01-01 23:59:59', '1:1:1'), SUBTIME('15:00:00', '2:10:10');

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE);
SELECT HOUR(CURTIME()), MINUTE(CURRENT_TIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

SELECT DATE(NOW()), TIME(NOW());

SELECT DATEDIFF('2025-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10');

SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

SELECT LAST_DAY('2025-02-01');

SELECT MAKEDATE(2025, 32);

SELECT MAKETIME(12, 11, 10);

SELECT PERIOD_ADD(202501, 11), PERIOD_DIFF(202501, 202312);

SELECT QUARTER('2025-07-07');

SELECT TIME_TO_SEC('12:11:10');

SELECT CURRENT_USER(), DATABASE();

USE sqldb;
SELECT * FROM usertbl;
SELECT FOUND_ROWS();

USE sqldb;
UPDATE buytbl SET price=price*2;
SELECT ROW_COUNT();

SELECT SLEEP(5);
SELECT '5초후에 이게 보여요';



-- <실습 2> --

CREATE DATABASE moviedb;

USE moviedb;
CREATE TABLE movietbl 
  (movie_id        INT,
   movie_title     VARCHAR(30),
   movie_director  VARCHAR(20),
   movie_star      VARCHAR(20),
   movie_script    LONGTEXT,
   movie_film      LONGBLOB
) DEFAULT CHARSET=utf8mb4;

INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',  
	LOAD_FILE('C:/SQL/Movies/Schindler.txt'), LOAD_FILE('C:/SQL/Movies/Schindler.mp4') );

SELECT * FROM movietbl;

SHOW variables LIKE 'max_allowed_packet';

SHOW variables LIKE 'secure_file_priv';

USE moviedb;
TRUNCATE movietbl; -- 기존 행 모두 제거

INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',  
	LOAD_FILE('C:/SQL/Movies/Schindler.txt'), LOAD_FILE('C:/SQL/Movies/Schindler.mp4') );
INSERT INTO movietbl VALUES ( 2, '쇼생크 탈출', '프랭크 다라본트', '팀 로빈스',  
	LOAD_FILE('C:/SQL/Movies/Shawshank.txt'), LOAD_FILE('C:/SQL/Movies/Shawshank.mp4') );    
INSERT INTO movietbl VALUES ( 3, '라스트 모히칸', '마이클 만', '다니엘 데이 루이스',
	LOAD_FILE('C:/SQL/Movies/Mohican.txt'), LOAD_FILE('C:/SQL/Movies/Mohican.mp4') );

SELECT * FROM movietbl;


SELECT movie_script FROM movietbl WHERE movie_id=1 
	INTO OUTFILE 'C:/SQL/Movies/Schindler_out.txt'  
	LINES TERMINATED BY '\\n';

SELECT movie_film FROM movietbl  WHERE movie_id=3 
	INTO DUMPFILE 'C:/SQL/Movies/Mohican_out.mp4';

-- </실습 2> --


-- <실습 3> --

USE sqldb;
CREATE TABLE pivotTest
   (  uName CHAR(3),
      season CHAR(2),
      amount INT );

INSERT  INTO  pivotTest VALUES
	('김범수' , '겨울',  10) , ('윤종신' , '여름',  15) , ('김범수' , '가을',  25) , ('김범수' , '봄',    3) ,
	('김범수' , '봄',    37) , ('윤종신' , '겨울',  40) , ('김범수' , '여름',  14) ,('김범수' , '겨울',  22) ,
	('윤종신' , '여름',  64) ;
SELECT * FROM pivotTest;

SELECT uName, 
  SUM(IF(season='봄', amount, 0)) AS '봄', 
  SUM(IF(season='여름', amount, 0)) AS '여름',
  SUM(IF(season='가을', amount, 0)) AS '가을',
  SUM(IF(season='겨울', amount, 0)) AS '겨울',
  SUM(amount) AS '합계' FROM pivotTest GROUP BY uName ;


-- </실습 3> --

USE sqldb;
SELECT JSON_OBJECT('name', name, 'height', height) AS 'JSON 값'
	FROM usertbl 
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



USE sqldb;
SELECT * 
   FROM buytbl
     INNER JOIN usertbl
        ON buytbl.userID = usertbl.userID
   WHERE buytbl.userID = 'JYP';      
   
SELECT * 
	FROM buytbl
     INNER JOIN usertbl
        ON buytbl.userID = usertbl.userID 
	ORDER BY num;        

SELECT userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
   FROM buytbl
     INNER JOIN usertbl
        ON buytbl.userID = usertbl.userID 
	ORDER BY num;  

SELECT buytbl.userID, name, prodName, addr, mobile1 + mobile2 AS '연락처'
   FROM buytbl
     INNER JOIN usertbl
        ON buytbl.userID = usertbl.userID
	ORDER BY num;  


SELECT buytbl.userID, name, prodName, addr, mobile1 + mobile2 
  FROM buytbl, usertbl
  WHERE buytbl.userID = usertbl.userID 
  ORDER BY num; 

SELECT buytbl.userID, usertbl.name, buytbl.prodName, usertbl.addr, 
         usertbl.mobile1 + usertbl.mobile2  AS '연락처'
   FROM buytbl
     INNER JOIN usertbl
        ON buytbl.userID = usertbl.userID
   ORDER BY buytbl.num; 

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userID = U.userID
   ORDER BY B.num; 

SELECT B.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM buytbl B
     INNER JOIN usertbl U
        ON B.userID = U.userID
   WHERE B.userID = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM usertbl U
     INNER JOIN buytbl B
        ON U.userID = B.userID 
   WHERE B.userID = 'JYP';

SELECT U.userID, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS '연락처'
   FROM usertbl U
     INNER JOIN buytbl B
        ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT DISTINCT U.userID, U.name,  U.addr
   FROM usertbl U
     INNER JOIN buytbl B
        ON U.userID = B.userID 
   ORDER BY U.userID ;

SELECT U.userID, U.name,  U.addr
   FROM usertbl U
   WHERE EXISTS (
      SELECT * 
      FROM buytbl B
      WHERE U.userID = B.userID );


-- <실습 4> --

USE sqldb;
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
  
SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdtbl S
      INNER JOIN stdclubtbl SC
         ON SC.stdName = S.stdName
      INNER JOIN clubtbl C
          ON SC.clubName = C.clubName
    ORDER BY C.clubName;


-- </실습 4> --



USE sqldb;
SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM usertbl U
      LEFT OUTER JOIN buytbl B
         ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM buytbl B 
      RIGHT OUTER JOIN usertbl U
         ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
   FROM usertbl U
      LEFT OUTER JOIN buytbl B
         ON U.userID = B.userID 
   WHERE B.prodName IS NULL
   ORDER BY U.userID;



-- <실습 5> --

USE sqldb;
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdtbl S 
      LEFT OUTER JOIN stdclubtbl SC
          ON S.stdName = SC.stdName
      LEFT OUTER JOIN clubtbl C
          ON SC.clubName = C.clubName
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdtbl S
      LEFT OUTER JOIN stdclubtbl SC
          ON SC.stdName = S.stdName
      RIGHT OUTER JOIN clubtbl C
          ON SC.clubName = C.clubName
   ORDER BY C.clubName ;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdtbl S 
      LEFT OUTER JOIN stdclubtbl SC
          ON S.stdName = SC.stdName
      LEFT OUTER JOIN clubtbl C
          ON SC.clubName = C.clubName
UNION 
SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM  stdtbl S
      LEFT OUTER JOIN stdclubtbl SC
          ON SC.stdName = S.stdName
      RIGHT OUTER JOIN clubtbl C
          ON SC.clubName = C.clubName;

-- </실습 5> --

USE sqldb;
SELECT * 
   FROM buytbl 
     CROSS JOIN usertbl ;

SELECT * 
   FROM buytbl , usertbl ;

USE employees;
SELECT  COUNT(*) AS '데이터개수'
   FROM employees 
     CROSS JOIN titles;

-- <실습 6> --

USE sqldb;
CREATE TABLE empTbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl VALUES('나사장',NULL,'0000');
INSERT INTO empTbl VALUES('김재무','나사장','2222');
INSERT INTO empTbl VALUES('김부장','김재무','2222-1');
INSERT INTO empTbl VALUES('이부장','김재무','2222-2');
INSERT INTO empTbl VALUES('우대리','이부장','2222-2-1');
INSERT INTO empTbl VALUES('지사원','이부장','2222-2-2');
INSERT INTO empTbl VALUES('이영업','나사장','1111');
INSERT INTO empTbl VALUES('한과장','이영업','1111-1');
INSERT INTO empTbl VALUES('최정보','나사장','3333');
INSERT INTO empTbl VALUES('윤차장','최정보','3333-1');
INSERT INTO empTbl VALUES('이주임','윤차장','3333-1-1');

SELECT A.emp AS '부하직원' , B.emp AS '직속상관', B.empTel AS '직속상관연락처'
   FROM empTbl A
      INNER JOIN empTbl B
         ON A.manager = B.emp
   WHERE A.emp = '우대리';

-- </실습 6> --

USE sqldb;
SELECT stdName, addr FROM stdtbl
   UNION ALL
SELECT clubName, roomNo FROM clubtbl;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
   WHERE name NOT IN ( SELECT name FROM usertbl WHERE mobile1 IS NULL) ;

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
   WHERE name IN ( SELECT name FROM usertbl WHERE mobile1 IS NULL) ;



DROP PROCEDURE IF EXISTS ifProc; -- 기존에 만든적이 있다면 삭제
DELIMITER $$
CREATE PROCEDURE ifProc()
BEGIN
  DECLARE var1 INT;  -- var1 변수선언
  SET var1 = 100;  -- 변수에 값 대입

  IF var1 = 100 THEN  -- 만약 @var1이 100이라면,
	SELECT '100입니다.';
  ELSE
    SELECT '100이 아닙니다.';
  END IF;
END $$
DELIMITER ;
CALL ifProc();


DROP PROCEDURE IF EXISTS ifProc2; 
USE employees;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE; -- 입사일
	DECLARE curDATE DATE; -- 오늘
	DECLARE days INT; -- 근무한 일수

	SELECT hire_date INTO hireDate -- hire_date 열의 결과를 hireDATE에 대입
	   FROM employees.employees
	   WHERE emp_no = 10001;

	SET curDATE = CURRENT_DATE(); -- 현재 날짜
	SET days =  DATEDIFF(curDATE, hireDATE); -- 날짜의 차이, 일 단위

	IF (days/365) >= 5 THEN -- 5년이 지났다면
		  SELECT CONCAT('입사한지 ', days, '일이나 지났습니다. 축하합니다!');
	ELSE
		  SELECT '입사한지 ' + days + '일밖에 안되었네요. 열심히 일하세요.' ;
	END IF;
END $$
DELIMITER ;
CALL ifProc2();


DROP PROCEDURE IF EXISTS ifProc3; 
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
    DECLARE point INT ;
    DECLARE credit CHAR(1);
    SET point = 77 ;
    
    IF point >= 90 THEN
		SET credit = 'A';
    ELSEIF point >= 80 THEN
		SET credit = 'B';
    ELSEIF point >= 70 THEN
		SET credit = 'C';
    ELSEIF point >= 60 THEN
		SET credit = 'D';
    ELSE
		SET credit = 'F';
    END IF;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL ifProc3();


DROP PROCEDURE IF EXISTS caseProc; 
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
    DECLARE point INT ;
    DECLARE credit CHAR(1);
    SET point = 77 ;
    
    CASE 
		WHEN point >= 90 THEN
			SET credit = 'A';
		WHEN point >= 80 THEN
			SET credit = 'B';
		WHEN point >= 70 THEN
			SET credit = 'C';
		WHEN point >= 60 THEN
			SET credit = 'D';
		ELSE
			SET credit = 'F';
    END CASE;
    SELECT CONCAT('취득점수==>', point), CONCAT('학점==>', credit);
END $$
DELIMITER ;
CALL caseProc();


-- <실습 7> --

USE sqldb;
SELECT userID, SUM(price*amount) AS '총구매액'
   FROM buytbl
   GROUP BY userID
   ORDER BY SUM(price*amount) DESC;

SELECT B.userID, U.name, SUM(price*amount) AS '총구매액'
   FROM buytbl B
      INNER JOIN usertbl U
         ON B.userID = U.userID
   GROUP BY B.userID, U.name
   ORDER BY SUM(price*amount) DESC;

SELECT B.userID, U.name, SUM(price*amount) AS '총구매액'
   FROM buytbl B
      RIGHT OUTER JOIN usertbl U
        ON B.userID = U.userID
   GROUP BY B.userID, U.name
   ORDER BY SUM(price*amount) DESC ;

SELECT U.userID, U.name, SUM(price*amount) AS '총구매액'
   FROM buytbl B
      RIGHT OUTER JOIN usertbl U
         ON B.userID = U.userID
   GROUP BY U.userID, U.name
   ORDER BY SUM(price*amount) DESC ;
  
/*  
CASE  
     WHEN (총구매액  >= 1500) THEN  '최우수고객'
     WHEN (총구매액  >= 1000) THEN  '우수고객'
     WHEN (총구매액 >= 1 ) THEN '일반고객'
     ELSE '유령고객'
END 
*/

SELECT U.userID, U.name, SUM(price*amount) AS '총구매액',
       CASE  
           WHEN (SUM(price*amount)  >= 1500) THEN '최우수고객'
           WHEN (SUM(price*amount)  >= 1000) THEN '우수고객'
           WHEN (SUM(price*amount) >= 1 ) THEN '일반고객'
           ELSE '유령고객'
        END AS '고객등급'
   FROM buytbl B
      RIGHT OUTER JOIN usertbl U
         ON B.userID = U.userID
   GROUP BY U.userID, U.name 
   ORDER BY sum(price*amount) DESC ;

-- </실습 7> --

DROP PROCEDURE IF EXISTS whileProc; 
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT; -- 1에서 100까지 증가할 변수
	DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

	WHILE (i <= 100) DO
		SET hap = hap + i;  -- hap의 원래의 값에 i를 더해서 다시 hap에 넣으라는 의미
		SET i = i + 1;      -- i의 원래의 값에 1을 더해서 다시 i에 넣으라는 의미
	END WHILE;

	SELECT hap;   
END $$
DELIMITER ;
CALL whileProc();


DROP PROCEDURE IF EXISTS whileProc2; 
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
    DECLARE i INT; -- 1에서 100까지 증가할 변수
    DECLARE hap INT; -- 더한 값을 누적할 변수
    SET i = 1;
    SET hap = 0;

    myWhile: WHILE (i <= 100) DO  -- While문에 label을 지정
	IF (i%7 = 0) THEN
		SET i = i + 1;     
		ITERATE myWhile; -- 지정한 label문으로 가서 계속 진행
	END IF;
        
        SET hap = hap + i; 
        IF (hap > 1000) THEN 
		LEAVE myWhile; -- 지정한 label문을 떠남. 즉, While 종료.
	END IF;
        SET i = i + 1;
    END WHILE;

    SELECT hap;   
END $$
DELIMITER ;
CALL whileProc2();

DROP PROCEDURE IF EXISTS errorProc; 
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
    DECLARE CONTINUE HANDLER FOR 1146 SELECT '테이블이 없어요ㅠㅠ' AS '메시지';
    SELECT * FROM noTable;  -- noTable은 없음.  
END $$
DELIMITER ;
CALL errorProc();

DROP PROCEDURE IF EXISTS errorProc2; 
DELIMITER $$
CREATE PROCEDURE errorProc2()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN
	SHOW ERRORS; -- 오류 메시지를 보여 준다.
	SELECT '오류가 발생했네요. 작업은 취소시켰습니다.' AS '메시지'; 
	ROLLBACK; -- 오류 발생시 작업을 롤백시킨다.
    END;
    INSERT INTO usertbl VALUES('LSG', '이상구', 1988, '서울', NULL, 
		NULL, 170, CURRENT_DATE()); -- 중복되는 아이디이므로 오류 발생
END $$
DELIMITER ;
CALL errorProc2();


use sqldb;
PREPARE myQuery FROM 'SELECT * FROM usertbl WHERE userID = "EJW"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;


USE sqldb;
DROP TABLE IF EXISTS myTable;
CREATE TABLE myTable (id INT AUTO_INCREMENT PRIMARY KEY, mDate DATETIME);
SET @curDATE = CURRENT_TIMESTAMP(); -- 현재 날짜와 시간
PREPARE myQuery FROM 'INSERT INTO myTable VALUES(NULL, ?)';
EXECUTE myQuery USING @curDATE;
DEALLOCATE PREPARE myQuery;
SELECT * FROM myTable;

