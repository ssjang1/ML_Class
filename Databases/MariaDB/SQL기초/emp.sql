-- 부서를 관리하는 테이블
-- 데이터베이스 명령어
-- DML (DATA manipulation LANGUAGE) SELECT,INSERT INTO,UPDATE SET, DELETE FROM
-- DDL (DATA DEFINITION LANGUAGE) CREATE, DROP(삭제),alter
-- DCL (data control language): grant(권한부여), revoke(권한회수)
-- TCL (COMMIT,rollback
	-- TRANSACTION 대상
	-- insert into, update set, delete from 은 테이블에 영향을 미침
	-- select는 영향을 미치지 않음
CREATE TABLE dept(-- 부서정보
	DEPTNO
TINYINT PRIMARY KEY,-- 1바이트 : 256가지
	DNAME
VARCHAR(14),
	LOC VARCHAR(13)
);
-- key를 이용해서 두개의 테이블을 연결
-- 데이터베이스는 검색이 우선 : 중복 데이터가 있으면 안 됨
-- 데이터를 유일하게 구분할 수 있는 데이터 : key
-- 두개의 데이블을 연결할 때 사용하는 키 : primary key foreign key
-- foreign key는 참조하는 곳에 있는 데이터범위 내에 있어야 한다.
CREATE TABLE EMP(-- EMPLOYEE 직원정보
	EMPNO
SMALLINT PRIMARY KEY, -- 2바이트(-32768~32767) -- 번호
	ENAME
VARCHAR(10), -- 이름
	JOB
VARCHAR(9), -- 업무
	MGR
SMALLINT, -- 관리자
	HIREDATE
DATE, -- 입사일 : 날짜,숫자,문자 | 날짜)입출력시 문자열,숫자 사칙연산
	SAL
FLOAT, --급여
	COMM
FLOAT, --커미션
	DEPTNO
TINYINT, -- 부서번호
FOREIGN KEY(DEPTNO) REFERENCES dept(DEPTNO)
);
CREATE TABLE bonus(
	ename VARCHAR(10),
	job VARCHAR(9),
	sal INT,
	comm INT
);
CREATE TABLE salgrade(
	grade TINYINT,
	losal SMALLINT,
	hisal SMALLINT
);
-- 부서정보
INSERT INTO dept VALUES(10,"accounting","new york");
INSERT INTO dept VALUES(20,"research","dallas");
INSERT INTO dept VALUES(30,"sales","chicago");
INSERT INTO dept VALUES(40,"operations","boston");

--포맷 문자열 %s,%i
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902, STR_TO_DATE('17-12-1980','%d-%m-%Y'),800, NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698, STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698, STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839, STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975, NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698, STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839, STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850, NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839, STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450, NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566, STR_TO_DATE('1-3-1981','%d-%m-%Y'),3000, NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT', NULL, STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000, NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698, STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788, STR_TO_DATE('1-5-1981','%d-%m-%Y'),1100, NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698, STR_TO_DATE('3-12-1981','%d-%m-%Y'),950, NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566, STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000, NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782, STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300, NULL,10);
INSERT INTO EMP VALUES
(7935,'SUNG','CLERK',7782, STR_TO_DATE('14-11-1981','%d-%m-%Y'),1500, NULL,40);
INSERT INTO salgrade VALUES(1,700,1200);
INSERT INTO salgrade VALUES(1,1201,1400);
INSERT INTO salgrade VALUES(3,1401,2000);
INSERT INTO salgrade VALUES(4,2001,3000);
INSERT INTO salgrade VALUES(5,3001,9999);
SELECT* FROM dept;
SELECT* FROM emp;
SELECT* FROM salgrade;
-- select필드 from테이블 where조건
-- group by 그룹으로 묶어서 처리 : 엑셀에 있는기능
-- order by 정렬
-- limit 갯수 제한

-- emp 테이블에서 사원번호, 사원이름,직업을 출력해라
SELECT empno,empname,job FROM emp;
-- emp 테이블에서 사원번호,급여,부서번호를 출력하시오 단 급여가 많은순서대로
SELECT empno,sal,deptno FROM emp ORDER BY sal DESC; -- descending 디폴트값이 asc
--위의 정렬순서를 급여가 작은 것이 먼저 출력되도록 하시오
SELECT empno,sal,deptno FROM emp ORDER BY sal ASC;
-- emp 테이블에서 직업,급여를 출력해보시오 단 직업명으로 오름차순,급여로 내림차순
SELECT job AS "직업",sal AS "급여" fROM emp ORDER BY job ASC,sal DESC ;
-- 산술연산자 + - * /
-- emp 테이블에서 부서번호가 10번인 사원들의 급여를 출력하되 10% 인상된 금액으로 출력
SELECT sal *1.1 FROM emp WHERE deptno=10;
-- 관계연산자 > >= = <= <
-- emp 테이블에서 급여가 3000이상인 사원들의 모든 정보를 출력하시오
SELECT * FROM emp WHERE sal>=3000;
-- 문제 부서번호가 30번이 아닌사람의 이름과 부서번호를 출력하시오
SELECT eNAME,deptno FROM emp WHERE deptno !=30;daejeon
-- 논리 연산자 (and or not)
-- emp 테이블에서 부서번호가 10번이고 급여가 3000이상인 사원들의 이름과 급여 출력
SELECT ename,sal FROM emp WHERE deptno=10 AND sal>3000;
-- 문제 : emp 테이블에서 직업이 salesman이거나 manager인 사원의 사원번호와 부서번호 출력
SELECT empno,deptno FROM emp WHERE job="salesman" OR job="manager";
-- 연산 (in, between, like, is null,is not null)
-- in 연산자 (or 과 비슷함) 범위 연산자
-- 부서번호가 10번이거나 20번인 사원번호와 이름 부서번호를 출력하시오
SELECT empno,ename,deptno FROM emp WHERE deptno=10 OR deptno=20;
SELECT empno,ename,deptno FROM emp WHERE deptno IN (10,20);
-- between 
--급여가 1000과 2000사이인 사원들의 사원번호,이름 ,급여를 출력
SELECT empno,ename,sal FROM emp WHERE sal>1000 AND sal<2000;
SELECT empno,ename,sal FROM emp WHERE sal BETWEEN 1000 AND 2000;
-- 사원이름이 "ford"와 "scott"사이의 사원들의 사원번호와 이름을 출력해보시오
SELECT empno,ename FROM emp WHERE ename BETWEEN "ford" AND "scott";

-- like 문자열 비교
-- 사원이름이 "j"로 시작하는 사원의 사원이름과 부서번호 출력
SELECT ename,deptno FROM emp WHERE ename LIKE "j%";
-- 사원의 이름이 "j"를 포함하는 사원의 이름과 부서번호 출력
SELECT ename,deptno FROM emp WHERE ename LIKE "%j%";
-- 사원 이름의 두번째 글자가 "a" 인 사원의 이름과 급여 입사일 출력
SELECT ename,sal,hireDATE FROM emp WHERE ename LIKE "_a%"; -- _는 한글자에 대응
-- 사원의 이름이 "es"로 끝나는 사원의 이름,급여,입사일 출력
SELECT ename,sal,hiredate FROM emp WHERE ename LIKE "%es";
-- 입사연도가 81년인 사원들의 입사일과 사원번호 출력
SELECT hiredate,empno FROM emp WHERE hiredate LIKE "1981%"; 
-- is null, is not null
-- 커미션이 null인 사원의 사원이름과 커미션을 출력해보시오
SELECT ename,comm FROM emp WHERE comm IS NULL;
-- 반대로 널이 아닌사람
SELECT ename,comm FROM emp WHERE comm IS NOT NULL;
-- concat 함수
SELECT CONCAT(ename,"의 직업은",job,"입니다") FROM emp;

-- SELECT FOR문이 없고 규칙을 모든 데이터에 적용해서 결과를 출력
-- where 이후는 if문이라고 생각하면 됨
SELECT CHR(65);
SELECT CHR(97);
SELECT LOWER("hello!");
SELECT LPAD("hi",10,"*"); -- left padding(충전재)
SELECT LENGTH("국어"); -- 문자의 길이 => 데이터베이스는 문자당 3바이트를 사용
SELECT LEFT("abcde",3); -- 단어의 왼쪽에서 3개를 짤라라
SELECT RIGHT("right",3); -- 오른쪽 3개짤라라
SELECT SUBSTRING("abcde",2,2); -- 단어의 2번째에서 2개짤라라
SELECT FORMAT(12345.23456789,1); -- 소수점 첫재짜리까지 출력
SELECT ename,nvl(comm,0) FROM emp; -- nvl => null인 경우 0으로 표현해라
SELECT ABS(-10); -- 절대값
SELECT CEIL(3.1234); --올림
SELECT FLOOR(3.2241); -- 버림
SELECT ROUND(3.22645,2) -- 반올림 소수점 2번째자리
SELECT MOD(10,3); -- 나머지
SELECT TRUNCATE(11111.23456789,3); -- 소수점3번째 자리까지 잘라내서 출력 
-- 날짜 관련함수
SELECT CURDATE(); -- 현재 날짜(current date)
SELECT DATE(CURDATE());
SELECT CURTIME();
SELECT DATE_SUB("2023-12-25",INTERVAL 100 DAY); 
SELECT datediff("2023-03-06 23:59:59", "2016-01-03");
SELECT DATE_ADD("2023-03-06 23:59:59", INTERVAL 22 SECOND);
SELECT EXTRACT(YEAR FROM "2023-03-06");
SELECT NOW();
SELECT DATE_FORMAT("2023-03-06 16:11","%w %m %y");
SELECT TIMESTAMPDIFF(HOUR,"2018-03-01","2018-03-28");-- 두 데이터 단위 시간 차이
SELECT COUNT(ename) FROM emp; -- 함수 카운트
SELECT SUM(sal) FROM emp;
SELECT AVG(sal) FROM emp; --하나의 null이라도 있으면 처리가 안됨
SELECT AVG(nvl(comm,0))FROM emp;
SELECT MAX(sal)FROM emp;
SELECT MIN(sal)FROM emp;

-- group by 부서별 : 집계할 그룹이랑 집계할
SELECT deptno,SUM(sal) FROM emp GROUP BY deptno; -- deptno별로 집계가능
SELECT deptno,SUM(sal),MAX(sal),MIN(sal),FROM emp GROUP BY deptno;
-- 문제 부서별로 평균급여 출력 (반올림해서 소수점 첫째자리까지)
SELECT deptno,round(AVG(sal),1)FROM emp GROUP BY deptno;
-- 문제 직업별로 최대 급여를 출력해보시오
SELECT job,MAX(sal) FROM emp GROUP BY job; -- group by 하면 범주형 데이터가 나옴

-- 급여가 1000이상인 사원들의 부서별 평균급여의 반올림 값을 부서번호로 내림차순 정렬해서 출력
SELECT deptno,round(AVG(sal)) FROM emp WHERE sal>=1000 GROUP BY deptno ORDER BY deptno DESC;
-- 위를 평균급여로 오름차순으로 정렬
SELECT deptno,ROUND(AVG(sal)) FROM emp WHERE sal>=1000 GROUP BY deptno ORDER BY AVG(sal) ASC;

-- 문제 각 부서별로 같은 업무를 하는 사람의 인원수를 구해서 부서번호,업무,인원수를 부서번호에 대해서 오름차순으로 정렬해서 출력
SELECT deptno,job,COUNT(*) FROM emp GROUP BY deptno, job ORDER BY deptno ASC;
-- having 절을 이용해서 group 제한 
-- 급여가 1000이상인 사원들의 부서별 평균 급여를 출력 단 부서별 평균급여가 
-- 2000인 부서만 출력하시오
SELECT deptno,AVG(sal) FROM emp WHERE sal>=1000 GROUP BY deptno HAVING AVG(sal)>=2000; 

-- join
SELECT * FROM emp;

-- emp 테이블의 모든 사원들의 이름,부서번호,부서명을 출력해보시오
SELECT ename,dept.deptno,dname FROM emp,dept WHERE emp.deptno=dept.deptno;

--별칭으로 처리하면
SELECT ename,e.deptno,dname FROM emp e,dept d WHERE e.DEPTNO=d.deptno;
SELECT ename,deptno,dname FROM emp e JOIN dept d ON e.deptno =d. deptno;
-- mariadb가 동작중임을 확인(service program으로 작성: 상시대기)
-- 급여가 3000에서 5000사이의 사원 이름과 부서명을 출력해보세요
SELECT e.ename,d.dname FROM emp e join dept d ON e.deptno=d.deptno WHERE e.sal BETWEEN 3000 AND 5000 GROUP BY e.ename; 
SELECT ename,dname FROM emp e ,dept d WHERE e.deptno=d.deptno AND (sal>=3000 AND sal<=5000);
-- 부서명이 "accounting"인 사원의 이름, 입사일, 부서번호,부서명을 출력하시오
SELECT ename,hiredate,d.deptno,dname FROM emp e, dept d WHERE e.DEPTNO=d.DEPTNO having d.dname="accounting";
SELECT ename,hiredate,e.deptno,dname FROM emp e,dept d WHERE e.deptno=d.deptno AND dname="accounting";
-- 커미션이 null이 아닌 사원의 이름, 입사일, 부서명을 출력하시오
SELECT comm,eNAME,hiredate,dname FROM emp,dept WHERE emp.DEPTNO=dept.deptno having comm IS NOT NULL;
SELECT e.ename,e.hiredate,d.dname FROM emp e,dept d WHERE e.deptno=d.deptno AND e.comm IS NOT NULL;

-- emp 테이블과 dept 테이블을 조인하여 부서번호, 부서명, 이름,급여를 출력해보세요
SELECT d.deptno,dname,ename,sal FROM emp e JOIN dept d ON e.deptno=d.deptno;
SELECT d.deptno,dname,ename,sal FROM emp e,dept d WHERE e.deptno=d.deptno;
-- inner join==두 테이블이 모두 일치하는 데이터가 있어야 함

-- 사원의 이름이 "allen"인 사원의 부서명을 출력해보시요
SELECT dname FROM emp e JOIN dept d ON e.DEPTNO=d.deptno WHERE e.ENAME="allen";
-- 모든 사원의 이름,부서번호,부서명,급여를 출력하시오 dept테이블에 없는 부서도 출력해보시오
-- 두개의 테이블을 조인할 때 좌측의 데이터를 기준으로 출력하라(left join)
-- 두개의 테이블을 조인할 때 우측의 데이터를 기준으로 출력하라(right join)
SELECT ename,d.deptno,dname,sal FROM emp e left join dept d ON e.DEPTNO=d.deptno;
SELECT ename,d.deptno,dname,sal FROM emp e  join dept d ON e.DEPTNO=d.deptno; -- 차이점은?

-- 사원의 이름과 급여,급여의 등급을 출력해보시오
SELECT * from salgrade;
SELECT ename,sal,grade FROM emp, salgrade WHERE sal BETWEEN losal AND hisal;

--사원의 이름과 부서명, 급여의 등급을 출력해보시오
SELECT ename,dname,grade FROM emp e,salgrade,dept d WHERE sal BETWEEN losal AND hisal AND d.DEPTNO=e.deptno;  
-- subquery: select문안에 select문이 있는 것
-- 결과가 하나인 것 : 단일행 subquery 
-- 결과가 복수행인 것: 복수행 subquery (in, all, any, exist) : 다중행 연산자 이용

-- "smith"가 근무하는 부서명을 subquery를 이용해서 출력하시오
SELECT dname FROM dept WHERE deptno=(SELECT deptno FROM emp WHERE ename='smith');
-- "allen"과 같은 부서에 근무하는 사원의 이름과 부서의 번호를 입력
SELECT ename,deptno FROM emp e WHERE deptno=(SELECT deptno FROM emp WHERE ename="allen");
-- 'allen'과 동일한 직책을 가진 사원의 사번과 이름, 직책을 출력해보시오
SELECT empno,ename,job FROM emp WHERE job=(SELECT job FROM emp WHERE ename="allen");
-- "allen"의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여를 출력해보시오
SELECT ename,sal FROM emp WHERE sal>=(SELECT sal FROM emp WHERE ename="allen");
-- "dallas"에서 근무하는 사원의 이름, 부서번호를 출력해보세요
SELECT ename,deptno FROM emp WHERE deptno=(SELECT deptno FROM dept WHERE loc="dallas");
-- 자신의 직속상관이 "king"인 사원의 이름과 급여를 출력해보시오
SELECT ename,sal FROM emp WHERE deptno=(SELECT deptno FROM emp WHERE ename="king"); -- 내가짠거
SELECT ename,sal FROM emp WHERE mgr =(SELECT empno FROM emp WHERE ename="king");

-- 다중행 서브쿼리 
-- 급여를 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 이름과 급여,부서번호 출력
SELECT ename,sal,deptno FROM emp WHERE deptno IN (SELECT deptno FROM emp WHERE sal >=3000);
-- 직책이 manager인 사원이 속한 부서의 부서번호와 부서명과 부서의 위치를 출력하시오
SELECT deptno,dname,loc FROM dept WHERE deptno in(SELECT deptno FROM emp WHERE job="manager");
-- 직책이 salesman보다 급여를 많이 받는 사원들의 이름과 급여를 출력하시오 (any)
SELECT ename,sal FROM emp WHERE sal> any(SELECT sal FROM emp WHERE job="salesman");

-- 문제 부서별로 가장 급여를 많이 받는 사원의 사원번호 급여 부서번호를 출력해보시오
SELECT empno,sal,deptno FROM emp  WHERE sal in(SELECT max(sal) FROM emp group by deptno); 
-- 동일한 경우 두개가 나옴 => 여기서는 숫자만 같으면 여러개가 나와버림

