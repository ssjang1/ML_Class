-- --------------------------------------------------------
-- 호스트:                          34.64.37.138
-- 서버 버전:                        10.1.48-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- bbk 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bbk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bbk`;

-- 테이블 bbk.buytbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `buytbl` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(3) DEFAULT NULL,
  `prodName` varchar(20) DEFAULT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `FK__usertbl` (`userID`),
  CONSTRAINT `FK__usertbl` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 bbk.buytbl:~12 rows (대략적) 내보내기
INSERT INTO `buytbl` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(1, 'KBS', '운동화', '의류', 30, 2),
	(2, 'KBS', '노트북', '전자', 1000, 1),
	(3, 'JYP', '모니터', '전자', 200, 1),
	(4, 'BBK', '모니터', '전자', 200, 5),
	(5, 'KBS', '청바지', '의류', 50, 3),
	(6, 'BBK', '메모리', '전자', 80, 10),
	(7, 'SSK', '책', '서적', 15, 5),
	(8, 'EJW', '책', '서적', 15, 2),
	(9, 'EJW', '청바지', '의류', 50, 1),
	(10, 'BBK', '운동화', '의류', 30, 2),
	(11, 'EJW', '책', '서적', 15, 1),
	(12, 'BBK', '운동화', '의류', 30, 2);

-- 테이블 bbk.usertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 bbk.usertbl:~10 rows (대략적) 내보내기
INSERT INTO `usertbl` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');


-- daejeon 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `daejeon` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `daejeon`;

-- 테이블 daejeon.bonus 구조 내보내기
CREATE TABLE IF NOT EXISTS `bonus` (
  `ename` varchar(10) DEFAULT NULL,
  `job` varchar(9) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `comm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 daejeon.bonus:~0 rows (대략적) 내보내기

-- 테이블 daejeon.dept 구조 내보내기
CREATE TABLE IF NOT EXISTS `dept` (
  `DEPTNO` tinyint(4) NOT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 daejeon.dept:~4 rows (대략적) 내보내기
INSERT INTO `dept` (`DEPTNO`, `DNAME`, `LOC`) VALUES
	(10, 'accounting', 'new york'),
	(20, 'research', 'dallas'),
	(30, 'sales', 'chicago'),
	(40, 'operations', 'boston');

-- 테이블 daejeon.emp 구조 내보내기
CREATE TABLE IF NOT EXISTS `emp` (
  `EMPNO` smallint(6) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` smallint(6) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` float DEFAULT NULL,
  `COMM` float DEFAULT NULL,
  `DEPTNO` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `DEPTNO` (`DEPTNO`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 daejeon.emp:~15 rows (대략적) 내보내기
INSERT INTO `emp` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
	(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
	(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
	(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
	(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
	(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
	(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
	(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
	(7788, 'SCOTT', 'ANALYST', 7566, '1981-03-01', 3000, NULL, 20),
	(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
	(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
	(7876, 'ADAMS', 'CLERK', 7788, '1981-05-01', 1100, NULL, 20),
	(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
	(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
	(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10),
	(7935, 'SUNG', 'CLERK', 7782, '1981-11-14', 1500, NULL, 40);

-- 테이블 daejeon.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `num` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='번호와 이름 그리고 주소를 저장하는 테이블\r\n메모리를 효율적으로 사용하기 위해서 변동 문자열을 사용한다. (varchar)\r\n클래스 배열하고 메모리형태가 같음\r\n';

-- 테이블 데이터 daejeon.member:~3 rows (대략적) 내보내기
INSERT INTO `member` (`num`, `name`, `addr`) VALUES
	(1, '대한', '서울'),
	(3, '민국', NULL),
	(NULL, '만세', NULL);

-- 테이블 daejeon.salgrade 구조 내보내기
CREATE TABLE IF NOT EXISTS `salgrade` (
  `grade` tinyint(4) DEFAULT NULL,
  `losal` smallint(6) DEFAULT NULL,
  `hisal` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 daejeon.salgrade:~5 rows (대략적) 내보내기
INSERT INTO `salgrade` (`grade`, `losal`, `hisal`) VALUES
	(1, 700, 1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);


-- pet 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `pet` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pet`;

-- 테이블 pet.pet 구조 내보내기
CREATE TABLE IF NOT EXISTS `pet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 pet.pet:~5 rows (대략적) 내보내기
INSERT INTO `pet` (`id`, `name`, `owner`, `species`, `sex`, `birth`, `death`) VALUES
	(1, '인천시', '민주', 'cat', 'f', '2001-02-04', NULL),
	(2, '대구시', '자유', 'cat', 'f', '2010-03-17', NULL),
	(3, '대전시', '민주', 'dog', 'f', '2010-05-13', NULL),
	(4, '광주시', '민주', 'dog', 'm', '2015-08-27', NULL),
	(5, '부산시', '자유', 'dog', 'm', '2017-08-31', '2018-04-29');


-- sungjuk 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sungjuk` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sungjuk`;

-- 함수 sungjuk.calc_add 구조 내보내기
DELIMITER //
CREATE FUNCTION `calc_add`(`first` INT,
	`second` INT
) RETURNS int(11)
BEGIN
	DECLARE add_value INT;
	SET ADD_value =FIRST +SECOND;
	RETURN add_value;
END//
DELIMITER ;

-- 함수 sungjuk.calc_function 구조 내보내기
DELIMITER //
CREATE FUNCTION `calc_function`(`starting_value` INT
) RETURNS int(11)
BEGIN
	DECLARE total_value INT;
	SET total_value =0;
	label1: while total_value<=3000 do
				SET total_value=total_value+starting_value;
				END while label1;
	RETURN total_value;
END//
DELIMITER ;

-- 테이블 sungjuk.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 sungjuk.school:~4 rows (대략적) 내보내기
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(1, '충주여자고등학교', '충주시', 'ch00000001', 360),
	(4, '대전 여자 상업고등학교', '대전시', 'DE0000001', 2000),
	(3, '대전고등학교', '대전시', 'IC00000001', 560),
	(2, '서울여자고등학교', '서울시', 'SE00000001', 1200);

-- 프로시저 sungjuk.school_delete 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_delete`(
	IN `schoolcodein` CHAR(10),
	OUT `result` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	START TRANSACTION;
	SELECT COUNT(*)INTO cnt FROM school WHERE schoolcode=schoolcodein;
	if cnt>0 then
		DELETE FROM school WHERE schoolcode=schoolcodein;
		SET result=0;
		COMMIT;
	ELSE SET result=2;
	END if;
END//
DELIMITER ;

-- 프로시저 sungjuk.school_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_insert`(
	IN `scname` VARCHAR(50),
	IN `addr` VARCHAR(50),
	IN `sccode` CHAR(10),
	IN `stcount` INT,
	OUT `result` INT
)
BEGIN
	DECLARE exit handler FOR SQLEXCEPTION -- callback function 
	begin
		ROLLBACK ; -- transcation
		SET result=-1;
	END;
	
	START TRANSACTION;
		INSERT INTO school(schoolname,address,schoolcode,studentcount)
		VALUES(scname,addr,sccode,stcount);
		COMMIT;
		SET result=0;
		
END//
DELIMITER ;

-- 프로시저 sungjuk.school_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_select`()
BEGIN
	SELECT*FROM school;
END//
DELIMITER ;

-- 프로시저 sungjuk.school_select2 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_select2`(
	IN `schoolinname` VARCHAR(50)
)
BEGIN
	SELECT * FROM school WHERE schoolname=schoolinname;
END//
DELIMITER ;

-- 프로시저 sungjuk.school_select3 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_select3`(
	IN `schoolcode1` VARCHAR(10)
)
BEGIN
	SELECT * FROM school WHERE schoolcode=schoolcode1;
END//
DELIMITER ;

-- 프로시저 sungjuk.school_update 구조 내보내기
DELIMITER //
CREATE PROCEDURE `school_update`(
	IN `schoolnamein` VARCHAR(50),
	IN `schoolnameup` VARCHAR(50),
	OUT `result` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0; -- int cnt =0;
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	
	START TRANSACTION;
	SELECT COUNT(*) INTO cnt FROM school WHERE schoolname=schoolnamein;
	
	if cnt>0 then
		UPDATE school SET schoolname=schoolnameup WHERE schoolname=schoolnamein;
		SET result=0; -- success
		COMMIT;
	ELSE SET result=2; -- fail(no data)
	END if;
END//
DELIMITER ;

-- 테이블 sungjuk.se_backup 구조 내보내기
CREATE TABLE IF NOT EXISTS `se_backup` (
  `bunho` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `kor` tinytext,
  `mat` tinytext,
  `eng` tinytext,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 sungjuk.se_backup:~2 rows (대략적) 내보내기
INSERT INTO `se_backup` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(4, '전공인', '81', '81', '81', NULL, NULL, NULL, 'SE00000001'),
	(5, '전공이', '81', '81', '81', NULL, NULL, NULL, 'SE00000001');

-- 테이블 sungjuk.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `kor` tinytext,
  `mat` tinytext,
  `eng` tinytext,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(50) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `FK__school` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 sungjuk.student:~9 rows (대략적) 내보내기
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(2, '왕만덕', '100', '90', '80', 270, 90, 'A', 'CH00000001'),
	(3, '고려인', '100', '99', '99', 298, 99.33, 'A', 'CH00000001'),
	(4, '오환각', '100', '81', '100', 281, 93.67, 'A', 'SE00000001'),
	(5, '전공이', '81', '81', '81', 243, 81, 'B', 'SE00000001'),
	(6, '전공삼', '91', '100', '100', 291, 97, 'A', 'CH00000001'),
	(7, '전공사', '100', '100', '100', 300, 100, 'A', 'CH00000001'),
	(8, '종로구', '100', '81', '71', 252, 84, 'B', 'IC00000001'),
	(10, '만세야', '80', '80', '80', 240, 80, 'B', 'CH00000001'),
	(12, '성식', '98', '97', '96', 291, 97, 'A', 'CH00000001');

-- 프로시저 sungjuk.student_delete 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_delete`(
	IN `namein` VARCHAR(50),
	OUT `result` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	START TRANSACTION;
	SELECT COUNT(*) INTO cnt FROM student WHERE NAME=namein;
	if cnt>0 then
		DELETE FROM student WHERE NAME=namein;
		COMMIT;
		SET result=0;
	ELSE set result=2;
	END if;
END//
DELIMITER ;

-- 프로시저 sungjuk.student_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_insert`(
	IN `namein` VARCHAR(50),
	IN `korin` TINYINT,
	IN `matin` TINYINT,
	IN `engin` TINYINT,
	IN `schoolcodein` CHAR(10),
	OUT `result` INT
)
BEGIN
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	START transaction;
	INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES (namein,korin,matin,engin,schoolcodein);
	COMMIT;
	SET result=0;
END//
DELIMITER ;

-- 프로시저 sungjuk.student_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_select`()
BEGIN
	SELECT * FROM student;
END//
DELIMITER ;

-- 프로시저 sungjuk.student_select2 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_select2`(
	IN `namein` VARCHAR(50)
)
BEGIN
	SELECT * FROM student WHERE NAME=namein;
END//
DELIMITER ;

-- 프로시저 sungjuk.student_update 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_update`(
	IN `bunhoin` INT,
	IN `namein` VARCHAR(50),
	IN `korin` TINYINT,
	IN `matin` TINYINT,
	IN `engin` TINYINT,
	OUT `result` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;
	DECLARE exit handler for sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	
	START TRANSACTION;
	SELECT COUNT(*) INTO cnt FROM student WHERE bunho=bunhoin;
		if cnt>0 then
			UPDATE student SET NAME=namein,kor=korin,mat=matin,eng=engin WHERE bunho=bunhoin;
			COMMIT;
			SET result =0;
		ELSE SET result=2;
		END if;
END//
DELIMITER ;

-- 뷰 sungjuk.student_view 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `student_view` (
	`NAME` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`kor` TINYTEXT NULL COLLATE 'utf8mb4_general_ci',
	`eng` TINYTEXT NULL COLLATE 'utf8mb4_general_ci',
	`mat` TINYTEXT NULL COLLATE 'utf8mb4_general_ci',
	`total` INT(11) NULL,
	`average` FLOAT NULL,
	`schoolname` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`address` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- 프로시저 sungjuk.update_student_cursor 구조 내보내기
DELIMITER //
CREATE PROCEDURE `update_student_cursor`(
	OUT `result` INT
)
BEGIN
	DECLARE _done INT default FALSE; -- 커서반복
	DECLARE _row_count INT DEFAULT 0;
	DECLARE name_var VARCHAR(20);
	DECLARE kor_var INT;
	DECLARE mat_var INT;
	DECLARE eng_var INT;
	
	-- 서버측에서 데이터의 현재위치를 가리키는 객체가 커서 객체
	
	DECLARE cursor_student CURSOR FOR SELECT NAME,kor,mat,eng FROM student; -- 커서 정의
	DECLARE CONTINUE handler FOR NOT FOUND SET _done=TRUE; -- 커서의 종료조건
	OPEN cursor_student; -- 커서 오픈
	
	repeat
		fetch cursor_student INTO name_var,kor_var,mat_var,eng_var;
		if NOT _done then
			UPDATE student SET kor=kor_var+1,mat=mat_var+1,eng=eng_var+1 WHERE NAME=name_var;
			SET _row_count=_row_count+1; -- 수정된 개수를 확인하기 위해서
			SET _done=FALSE;
		END if;
	until _done -- true가 될 때 까지
	END repeat;
	close cursor_student; -- 커서는 열고나서 반드시 종료시켜야함
	SET result=_row_count;
END//
DELIMITER ;

-- 프로시저 sungjuk.update_student_cursor2 구조 내보내기
DELIMITER //
CREATE PROCEDURE `update_student_cursor2`(
	OUT `result` INT
)
BEGIN
	DECLARE _done INT default FALSE; -- 커서반복
	DECLARE _row_count INT DEFAULT 0;
	DECLARE name_var VARCHAR(20);
	DECLARE kor_var INT;
	DECLARE mat_var INT;
	DECLARE eng_var INT;
	
	-- 서버측에서 데이터의 현재위치를 가리키는 객체가 커서 객체
	
	DECLARE cursor_student CURSOR FOR SELECT NAME,kor,mat,eng FROM student; -- 커서 정의
	DECLARE CONTINUE handler FOR NOT FOUND SET _done=TRUE; -- 커서의 종료조건
	OPEN cursor_student; -- 커서 오픈
	
	repeat
		fetch cursor_student INTO name_var,kor_var,mat_var,eng_var;
		if NOT _done then
			UPDATE student SET kor=kor_var-1,mat=mat_var-1,eng=eng_var-1 WHERE NAME=name_var;
			SET _row_count=_row_count+1; -- 수정된 개수를 확인하기 위해서
			SET _done=FALSE;
		END if;
	until _done -- true가 될 때 까지
	END repeat;
	close cursor_student; -- 커서는 열고나서 반드시 종료시켜야함
	SET result=_row_count;
END//
DELIMITER ;

-- 트리거 sungjuk.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN
	SET NEW.total=NEW.kor+NEW.mat+NEW.eng;
	SET NEW.average=ROUND(NEW.total/3,2);
	
	if NEW.average>=90 then SET NEW.grade="A";
	ELSEIF NEW.average>=80 then SET new.grade="B";
	ELSEIF NEW.average>=70 then SET new.grade="C";
	ELSEIF NEW.average>=60 then SET new.grade="D";
	ELSE 								 SET new.grade="F";
	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 sungjuk.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
	-- insert into, update set, delete from 
	SET NEW.total=NEW.kor+NEW.mat+NEW.eng;
	SET NEW.average=ROUND(NEW.total/3,2);
	
	if NEW.average>=90 then SET NEW.grade="A";
	ELSEIF NEW.average>=80 then SET NEW.grade="B";
	ELSEIF NEW.average>=70 then SET NEW.grade="C";
	ELSEIF NEW.average>=60 then SET NEW.grade="D";
	ELSE 								 SET NEW.grade="F";
	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 뷰 sungjuk.student_view 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `student_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sungjuk`.`student_view` AS select `st`.`name` AS `NAME`,`st`.`kor` AS `kor`,`st`.`eng` AS `eng`,`st`.`mat` AS `mat`,`st`.`total` AS `total`,`st`.`average` AS `average`,`sc`.`schoolname` AS `schoolname`,`sc`.`address` AS `address` from (`sungjuk`.`student` `st` join `sungjuk`.`school` `sc`) where ((`st`.`schoolcode` = `sc`.`schoolcode`) and (`sc`.`schoolcode` = 'CH00000001'));


-- zoo 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `zoo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `zoo`;

-- 테이블 zoo.pet 구조 내보내기
CREATE TABLE IF NOT EXISTS `pet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 zoo.pet:~5 rows (대략적) 내보내기
INSERT INTO `pet` (`id`, `name`, `owner`, `species`, `sex`, `birth`, `death`) VALUES
	(1, '인천시', '민주', 'cat', 'f', '2001-02-04', NULL),
	(2, '대구시', '자유', 'cat', 'f', '2010-03-17', NULL),
	(3, '대전시', '민주', 'cat', 'f', '2010-05-13', NULL),
	(4, '광주시', '민주', 'cat', 'm', '2015-08-27', NULL),
	(5, '대구시', '자유', 'cat', 'm', '2017-08-31', '2018-04-29');

-- 프로시저 zoo.pet_all 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_all`()
BEGIN
	SELECT * FROM pet;
	SELECT * FROM pet;
END//
DELIMITER ;

-- 프로시저 zoo.pet_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pet_select`()
BEGIN
	SELECT * FROM pet;
END//
DELIMITER ;

-- 테이블 zoo.sungjuk 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk` (
  `bunho` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `mat` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`bunho`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 zoo.sungjuk:~5 rows (대략적) 내보내기
INSERT INTO `sungjuk` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`) VALUES
	(4, '장성식', 100, 100, 100, 300, 100, 'A'),
	(5, '머리', 99, 95, 94, 288, 96, 'A'),
	(6, '허리', 85, 87, 90, 262, 87.33, 'B'),
	(7, '아우', 99, 97, 91, 287, 95.67, 'A'),
	(8, '형', 88, 90, 95, 273, 91, 'A');

-- 프로시저 zoo.sungjuk_delete 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_delete`(
	IN `in_name` VARCHAR(20),
	OUT `result` INT
)
BEGIN
	DECLARE cnt INT DEFAULT 0;
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	START TRANSACTION;
	SELECT COUNT(*) INTO cnt FROM sungjuk WHERE NAME=in_name;
	if cnt>0 then DELETE FROM sungjuk WHERE NAME=in_name;
		SET result=0;
		COMMIT;
	ELSE SET result=2;
	END if;
END//
DELIMITER ;

-- 프로시저 zoo.sungjuk_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_insert`(
	IN `name` VARCHAR(20),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	OUT `result` INT
)
BEGIN
	DECLARE exit handler FOR sqlexception
	begin
		ROLLBACK;
		SET result=-1;
	END;
	START TRANSACTION;
	INSERT INTO sungjuk(NAME,kor,mat,eng) VALUE(NAME,kor,mat,eng);
	COMMIT;
	SET result=0;
END//
DELIMITER ;

-- 프로시저 zoo.sungjuk_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_select`()
BEGIN
	SELECT * FROM sungjuk;
END//
DELIMITER ;

-- 프로시저 zoo.sungjuk_update 구조 내보내기
DELIMITER //
CREATE PROCEDURE `sungjuk_update`(
	IN `in_name` VARCHAR(20),
	IN `up_name` VARCHAR(20),
	OUT `result` INT
)
BEGIN
   DECLARE cnt INT DEFAULT 0;
   DECLARE exit handler FOR SQLEXCEPTION
   begin
      ROLLBACK;
      SET result = -1;
   END;
   START TRANSACTION;
   SELECT COUNT(*) INTo cnt FROM sungjuk WHERE NAME = in_name;
   if cnt > 0 then
      UPDATE sungjuk SET NAME = up_name WHERE NAME = in_name;
      COMMIT;
      SET result = 0;
   ELSE SET result = 2;
   END if;
END//
DELIMITER ;

-- 트리거 zoo.sungjuk_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `sungjuk_before_insert` BEFORE INSERT ON `sungjuk` FOR EACH ROW BEGIN
	SET NEW.total=NEW.kor+NEW.mat+NEW.eng;
	SET NEW.average=ROUND(NEW.total/3,2);
	
	if NEW.average>=90 then SET NEW.grade="A";
	ELSEIF NEW.average>=80 then SET NEW.grade="B";
	ELSEIF NEW.average>=70 then SET NEW.grade="C";
	ELSEIF NEW.average>=60 then SET NEW.grade="D";
	ELSE SET NEW.grade="F";
	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 zoo.sungjuk_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `sungjuk_before_update` BEFORE UPDATE ON `sungjuk` FOR EACH ROW BEGIN
	SET NEW.total=NEW.kor+NEW.mat+NEW.eng;
	SET NEW.average=ROUND(NEW.total/3,2);
	
	if NEW.average>=90 then SET NEW.grade="A";
	ELSEIF NEW.average>=80 then SET NEW.grade="B";
	ELSEIF NEW.average>=70 then SET NEW.grade="C";
	ELSEIF NEW.average>=60 then SET NEW.grade="D";
	ELSE SET NEW.grade="F";
	END if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
