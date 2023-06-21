-- --------------------------------------------------------
-- 호스트:                          192.168.41.249
-- 서버 버전:                        10.3.28-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

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
  `bunho` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `kor` tinytext DEFAULT NULL,
  `mat` tinytext DEFAULT NULL,
  `eng` tinytext DEFAULT NULL,
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
  `kor` tinytext DEFAULT NULL,
  `mat` tinytext DEFAULT NULL,
  `eng` tinytext DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(50) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `FK__school` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 sungjuk.student:~10 rows (대략적) 내보내기
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(2, '김만덕', '80', '99', '60', 239, 79.67, 'C', 'CH00000001'),
	(3, '고려인', '100', '99', '99', 298, 99.33, 'A', 'CH00000001'),
	(4, '전공인', '100', '81', '100', 281, 93.67, 'A', 'SE00000001'),
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
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `student_view` AS select `st`.`name` AS `NAME`,`st`.`kor` AS `kor`,`st`.`eng` AS `eng`,`st`.`mat` AS `mat`,`st`.`total` AS `total`,`st`.`average` AS `average`,`sc`.`schoolname` AS `schoolname`,`sc`.`address` AS `address` from (`student` `st` join `school` `sc`) where `st`.`schoolcode` = `sc`.`schoolcode` and `sc`.`schoolcode` = 'CH00000001';

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
