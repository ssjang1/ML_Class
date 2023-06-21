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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
