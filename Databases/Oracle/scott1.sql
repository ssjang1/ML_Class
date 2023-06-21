-- 부서번호가 10번인 사원에 대한 정보를 출력하시오
select * from scott.emp where deptno=10;
-- 급여가 2000이상이 되는 사람을 출력하시오
select ename from scott.emp where sal>=2000;
-- hire date가 '1982/01/01'보다 큰 사원의 ename,hiredate를 출력하시오
select ename,hiredate from scott.emp where hiredate>'1982/01/01';
-- 사원 이름이 SCOTT인 사원의 사원번호, 사원이름, 급여를 출력하는 SQL문을 작성하시오
select empno,ename,sal from scott.emp where ename='SCOTT';
-- 1.job이 'CLERK'이고 부서번호가 10인 직원을 출력하시오
select ename from scott.emp where job='CLERK' and deptno=10;
-- 2.입사일이 '1982/01/01' 이후이거나 job이 'MANAGER'인 직원을 출력하시오
select ename from scott.emp where hiredate>'1982/01/01' or job='MANAGER';
-- 3.부서번호가 10이 아닌 직원을 출력하시오
select ename from scott.emp where deptno!=10;
select * from emp where deptno <> 10;
-- 4.급여가 2000에서 3000사이인 사원을 조회하시오
select ename from scott.emp where sal between 2000 and 3000;
-- 5.커미션이 300이거나 500이거나 1400인 사원을 검색하시오
select ename from scott.emp where comm=300 or comm=500 or comm=1400;
-- 6.7521이거나 7654이거나 7844인 사원의 사원번호와 급여를 검색
--  비교연산자와 OR논리 연산자를 사용하여 작성하시오
select empno,sal from scott.emp where empno=7521 or empno=7654 or empno=7844;
-- 1987년에 입사한 사원을 between and 연산자를 이용하여 구하시오
select ename from scott.emp where hiredate between '1987/01/01' and '1987/12/31';
-- 커미션이 300이 아니거나 500이 아니거나 1400이 아닌 사원을 검색하시오
select ename from scott.emp where nvl(comm,0)!=300 or nvl(comm,0)!=500 or nvl(comm,0)!=1400;
select * from emp where nvl(comm,0) not in(300,500,1400);

-- 사원 테이블의 사원들 중에서 커미션을 받는 사원을 구하시오
select count(comm) from emp where comm>=0;
select count(*) "사원수" from emp where comm>=0;
-- 직업의 종류가 몇 개인지, 즉 중복되지 않는 직업의 개수를 카운트하시오
select count(distinct job) from emp; -- 범주형 데이터-> 종류
-- 부서별 평균급여
select sum(sal)/count(deptno) from emp group by deptno;
-- 소속 부서별 최대 급여와 최소급여
select max(sal),min(sal) from emp group by deptno;
-- 업무별로 그룹화하여 업무,인원수,평균급여액,최고급여액,최저급여액 및 합게를 출력
select job,count(job),sum(sal)/count(job),max(sal),min(sal),sum(sal) from emp group by job;
-- 문제: 1000이상 급여를 가지고 잇는 사람들에 대해서만 부서별로 평균을 구하고 구해진 부서별
    -- 평균 급여가 2000 이상인 부서번호와 부서별 평균 급여를 출력
    select avg(sal) from emp where sal>=1000 group by deptno having avg(sal)>=2000;  
-- 부서의 최대값과 최소값을 구하되 최대 급여가 2900 이상인 부서만 출력
select min(sal),max(sal) from emp group by deptno having max(sal)>=2900 ;
-- 전체 월급이 5000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하시오
    -- 단 판매원은 제외하고 월 급여 합계로 내림차순으로 정렬하시오
select job,sum(sal) from emp where job not in 'SALES' group by job having sum(sal)>5000 order by sum(sal) desc;

-- 1.부서별로 가장 급여를 많이 받는 사원의 사원번호,이름,급여,부서번호를 출력하시오
select empno,ename,sal,deptno from emp where concat(sal,deptno) in (select concat(max(sal),deptno) from emp group by deptno) ;
-- 2.SCOTT과 동일한 직급을 가진 사원을 출력하는 SQL문을 작성하시오
-- ""테이블이나 객체를 표현, '' 문자열 표현
select * from emp where job in (select job from emp where ename='SCOTT');
-- 3.SCOTT의 급여와 동일하거나 더 많이 받는 사원명과 급여를 출력하시오
select ename,sal from emp where sal >=(select sal from emp where ename='SCOTT');
-- 4.급여가 20부서의 평균급여보다 크고 사원을 관리하는 사원으로서 20부서에 속하지 않은 사원의 정보를 출력하시오
select * from emp where sal> (select avg(sal) from emp group by deptno having deptno=20) 
and empno in(select distinct mgr from emp) and deptno!=20;
select * from emp where sal> (select avg(sal) from emp where deptno=20) and job='MANAGER' and deptno <> 20;
-- 5.10번 부서에 근무하는 사원의 이름과 10번부서의 부서명을 출력하시오
select ename,dname from emp e join dept d on e.deptno=e.deptno where e.deptno=10 and d.deptno=10;
-- 6.사원수가 5명 이상인 부서의 부서명과 사원수를 출력하시오
select distinct(dname),count(ename) from dept d join emp e on e.deptno=d.deptno group by dname having count(ename)>=5 ;
-- 7.SCOTT인 사람의 부서명을 출력하시오
select dname from emp e join dept d on e.deptno=d.deptno where ename='SCOTT';

select round(42.195,2) from dual;
-- 문제 emp의 sal을 100으로 나머지 연산해보시오
select mod(sal,100) from emp; -- 나머지
select -10,abs(-10) from dual; -- 절대값
select ename, length(ename) from emp;
select lpad('1234',5,'*') from dual;
select sysdate from dual;
select sysdate, hiredate, month_between(sysdate,hiredate) from emp;
SELECT SYSDATE, HIREDATE, MONTHS_BETWEEN(SYSDATE, TO_DATE(HIREDATE, 'YYYY-MM-DD')) AS MONTHS_DIFF FROM EMP;
select hiredate, add_months(hiredate,6) from emp;
select last_day(hiredate) from emp;
-- 변환함수 (마리아디비에서는 casting을 사용)
select ename, to_char(sal,'$999.999')from emp;
-- 삼항연산자( if(조건,참,거짓) )
select ename,deptno,decode(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') from emp; -- decode

select ename,deptno,
                    case when deptno=10 then 'ACCOUNTING'
                        when deptno=20 then 'RESEARCH'
                        when deptno=30 then 'SALES'
                        when deptno=40 then 'OPERATIONS' 
                     end 
from emp;

-- 문제 job 별로 보너스를 급여의 1.5배, 1.6배, 1.7배, 1.8배, 1.9배 등으로 주려고한다.
-- job의 종류를 확인해보고 job을 오름차순으로 정렬해서 1.5부터 보너스
select job from emp order by job asc; -- analyst, clerk, manager, president, salesman
select ename,job,
            case when job= 'ANALYST' then sal*1.5
            when job='CLERK' then sal*1.6
            when job='MANAGER' then sal*1.7
            when job='PRESIDENT' then sal*1.8
            when job ='SALESMAN' then sal*1.9  
            end  
        from emp;
select ename,job sal, decode(job,'ANALYST',SAL*1.5,'CLERK',SAL*1.6,'MANAGER',SAL*1.7,'PRESIDENT',SAL*1.8,'SALESMAN',SAL*1.9) FROM EMP;

create table dept2( -- 테이블 생성, 테이블과 제약조건 : CONSTRAINT를 붙이는 경우 반드시 이름을 줘야함
deptno number CONSTRAINT DEPT_PK_DEPTNO primary key, -- 자동부여
dname varchar2(40),
loc varchar2(50)
);
DROP TABLE DEPT2;
insert into dept2 values(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT2 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT2 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT2 VALUES(40,'OPERATIONS','BOSTON');

CREATE TABLE EMP10(
EMPNO NUMBER(4) CONSTRAINT EMP10_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP10_ENAME_NN NOT NULL,
SAL NUMBER(7,2) CONSTRAINT EMP10_SAL_CK CHECK(SAL BETWEEN 500 AND 5000),
GENDER VARCHAR2(1) CONSTRAINT EMP10_GENDER_CK CHECK(GENDER IN('M','F'))
);
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(123,'프로남',1000,'M');
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(124,'여주인',6000,'F');
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(125,'성공남',1000,'M');
ALTER TABLE EMP10 DROP CONSTRAINT EMP10_SAL_CK;
ALTER TABLE EMP10 ADD CONSTRAINT EMP10_SAL_CK CHECK (SAL>=500 AND SAL<=7000);
SELECT * FROM EMP10;
-- PRIMARY KEY는 중복도 X NULL도 X 
-- UNIQUE KEY 중복X NULL O
-- INSERT INTO EMP10 VALUES(NULL,'성공남',1000,'M');
-- 문제 마리아DB에서 했던 SCHOOL과 SUNGJUK TABLE 생성해보시오
-- PRIMARY FOREIGN 연결 

CREATE TABLE SCHOOL(
NO NUMBER(4) CONSTRAINT SCHOOL_NO_NN NOT NULL,
SCHOOLNAME VARCHAR2(50),
ADDRESS VARCHAR2(50),
SCHOOLCODE CHAR(10) CONSTRAINT SCHOOL_SCHOOLCODE_PK PRIMARY KEY,
STUDENTCOUNT NUMBER(4)
);
CREATE TABLE SUNGJUK(
NO NUMBER(3) CONSTRAINT SUNGJUK_BUNHO_PK PRIMARY KEY,
NAME VARCHAR2(20) CONSTRAINT SUNGJUK_NAME_NN NOT NULL,
KOR NUMBER(4) CONSTRAINT SUNGJUK_KOR_CK CHECK(KOR BETWEEN 0 AND 100),
ENG NUMBER(4) CONSTRAINT SUNGJUK_ENG_CK CHECK(ENG BETWEEN 0 AND 100),
MAT NUMBER(4) CONSTRAINT SUNGJUK_MAT_CK CHECK(MAT BETWEEN 0 AND 100),
TOTAL NUMBER(4),
AVERAGE NUMBER(5,2),
GRADE CHAR(1),
SCHOOLCODE CHAR(10) CONSTRAINT STUDENT_SHCOOLCODE_FK REFERENCES SCHOOL(SCHOOLCODE) 
);
CREATE SEQUENCE SCHOOL_NO_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SUNGJUK_NO_SEQ INCREMENT BY 1 START WITH 1;

drop sequence school_no_seq;
drop sequence sungjuk_no_seq;
drop table sungjuk;
drop table school;
-- QUERY에서 번호 증가시켜 가면서 입력해야함
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'충주여자고등학교','충주시','CH00000001',360);
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'서울여자고등학교','서울시','SE00000001',1200);
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'대전고등학교','대전시','IC00000001',560);

INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'김만덕',100,99,99,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'고려인',100,99,99,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'전공인',81,81,81,'SE00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'전공이',81,81,81,'SE00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'전공삼',91,100,100,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'전공사',100,100,100,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'종로구',100,81,71,'IC00000001');

-- 1. 이름이 '전공인' 인 학생의 학교,번호,이름,총점,평균을 출력
select sc.schoolname,sj.no,name,total,average from sungjuk sj join school sc on sc.schoolcode=sj.schoolcode where name='전공인';
-- 2. 성적이 최 우수인 학생의 정보를 출력
select * from sungjuk where kor+mat+eng in (select max(kor+mat+eng) from sungjuk);
-- 3. 학교별 학생수와 평균점수를 출력하시오
select count(*) "학생수", sum((kor+mat+eng)/3)/count(*) "학교 평균" from sungjuk group by schoolcode; 
-- 4. 학교별 우수한 학생을 한명씩 선정하여 이름 총점 학교 이름 출력
select name,kor+mat+eng,schoolname from school sc join sungjuk sj on sc.schoolcode=sj.schoolcode where kor+mat+eng in(select max(kor+mat+eng) from sungjuk group by schoolcode);