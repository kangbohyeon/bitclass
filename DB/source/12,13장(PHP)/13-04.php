<?php
   $con=mysqli_connect("localhost", "root", "1234", "sqlDB") or die("MySQL 접속 실패 !!");

   $sql ="
		INSERT INTO userTbl VALUES
		('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8'),
		('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4'),
		('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7'),
		('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4'),
		('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12'),
		('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9'),
		('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5'),
		('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3'),
		('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10'),
		('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5')
   ";
 
   $ret = mysqli_query($con, $sql);
 
   if($ret) {
	   echo "userTBL이 데이터가 성공적으로 입력됨.";
   }
   else {
	   echo "userTBL 데이터 입력 실패!!!"."<br>";
	   echo "실패 원인 :".mysqli_error($con);
   }
 
   mysqli_close($con);
?>
