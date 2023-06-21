CREATE TABLE dept(-- 부서정보
    DEPTNO INT PRIMARY KEY,-- 1바이트 : 256가지
    DNAME VARCHAR(14),
	LOC VARCHAR(13)
);
-- key를 이용해서 두개의 테이블을 연결
-- 데이터베이스는 검색이 우선 : 중복 데이터가 있으면 안 됨
-- 데이터를 유일하게 구분할 수 있는 데이터 : key
-- 두개의 데이블을 연결할 때 사용하는 키 : primary key foreign key
-- foreign key는 참조하는 곳에 있는 데이터범위 내에 있어야 한다.
CREATE TABLE EMP(-- EMPLOYEE 직원정보
	EMPNO INT PRIMARY KEY, -- 2바이트(-32768~32767) -- 번호
	ENAME VARCHAR(10), -- 이름
	JOB VARCHAR(9), -- 업무
	MGR INT, -- 관리자
	HIREDATE DATE, -- 입사일 : 날짜,숫자,문자 | 날짜)입출력시 문자열,숫자 사칙연산
	SAL FLOAT, --급여
	COMM FLOAT, --커미션
	DEPTNO INT, -- 부서번호
FOREIGN KEY(DEPTNO) REFERENCES dept(DEPTNO)
);
CREATE TABLE bonus(
	ename VARCHAR(10),
	job VARCHAR(9),
	sal INT,
	comm INT
);
CREATE TABLE salgrade(
	grade INT,
	losal INT,
	hisal INT
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP VALUES (7369, 'SMITH',  'CLERK',     7902,   sysdate,  800, NULL, 20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7369, 'SMITH',  'CLERK',     7902,   sysdate,  800, NULL, 20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal,  deptno) VALUES (7369, 'SMITH',  'CLERK',     7902,   sysdate,  800,  20);
INSERT INTO EMP VALUES (7499, 'ALLEN',  'SALESMAN',  7698,   sysdate, 1600,  300, 30);      
INSERT INTO EMP VALUES (7521, 'WARD',   'SALESMAN',  7698,   sysdate, 1250,  500, 30);        
INSERT INTO EMP VALUES (7566, 'JONES',  'MANAGER',   7839,   sysdate,  2975, NULL, 20);
INSERT INTO EMP VALUES (7698, 'BLAKE',  'MANAGER',   7839,   sysdate,  2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK',  'MANAGER',   7839,   sysdate,  2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT',  'ANALYST',   7566,   sysdate, 3000, NULL, 20);   
INSERT INTO EMP VALUES(7839, 'KING',   'PRESIDENT', NULL,   sysdate, 5000, NULL, 10);    
INSERT INTO EMP VALUES(7844, 'TURNER', 'SALESMAN',  7698,   sysdate,  1500,    0, 30);    
INSERT INTO EMP VALUES(7876, 'ADAMS',  'CLERK',     7788,   sysdate, 1100, NULL, 20);     
INSERT INTO EMP VALUES(7900, 'JAMES',  'CLERK',     7698,   sysdate,   950, NULL, 30);     
INSERT INTO EMP VALUES(7902, 'FORD',   'ANALYST',   7566,   sysdate,  3000, NULL, 20);     
INSERT INTO EMP VALUES(7934, 'MILLER', 'CLERK',     7782,   sysdate, 1300, NULL, 10);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

-- 사원 테이블에서 이름, 직급을 출력하시오
select ename,job from emp;
-- 부서번호를 출력하시오
select deptno from emp;
-- 연봉을 계산하시오 계산할때는 필드명을 지정
select  sal*12 +nvl(comm,0) as "연봉" from emp ;
-- 부서번호가 10번인 사원에 대한 정보를 출력하시오
select * from emp where deptno=10;
