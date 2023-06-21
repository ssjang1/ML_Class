-- �μ���ȣ�� 10���� ����� ���� ������ ����Ͻÿ�
select * from scott.emp where deptno=10;
-- �޿��� 2000�̻��� �Ǵ� ����� ����Ͻÿ�
select ename from scott.emp where sal>=2000;
-- hire date�� '1982/01/01'���� ū ����� ename,hiredate�� ����Ͻÿ�
select ename,hiredate from scott.emp where hiredate>'1982/01/01';
-- ��� �̸��� SCOTT�� ����� �����ȣ, ����̸�, �޿��� ����ϴ� SQL���� �ۼ��Ͻÿ�
select empno,ename,sal from scott.emp where ename='SCOTT';
-- 1.job�� 'CLERK'�̰� �μ���ȣ�� 10�� ������ ����Ͻÿ�
select ename from scott.emp where job='CLERK' and deptno=10;
-- 2.�Ի����� '1982/01/01' �����̰ų� job�� 'MANAGER'�� ������ ����Ͻÿ�
select ename from scott.emp where hiredate>'1982/01/01' or job='MANAGER';
-- 3.�μ���ȣ�� 10�� �ƴ� ������ ����Ͻÿ�
select ename from scott.emp where deptno!=10;
select * from emp where deptno <> 10;
-- 4.�޿��� 2000���� 3000������ ����� ��ȸ�Ͻÿ�
select ename from scott.emp where sal between 2000 and 3000;
-- 5.Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� �˻��Ͻÿ�
select ename from scott.emp where comm=300 or comm=500 or comm=1400;
-- 6.7521�̰ų� 7654�̰ų� 7844�� ����� �����ȣ�� �޿��� �˻�
--  �񱳿����ڿ� OR�� �����ڸ� ����Ͽ� �ۼ��Ͻÿ�
select empno,sal from scott.emp where empno=7521 or empno=7654 or empno=7844;
-- 1987�⿡ �Ի��� ����� between and �����ڸ� �̿��Ͽ� ���Ͻÿ�
select ename from scott.emp where hiredate between '1987/01/01' and '1987/12/31';
-- Ŀ�̼��� 300�� �ƴϰų� 500�� �ƴϰų� 1400�� �ƴ� ����� �˻��Ͻÿ�
select ename from scott.emp where nvl(comm,0)!=300 or nvl(comm,0)!=500 or nvl(comm,0)!=1400;
select * from emp where nvl(comm,0) not in(300,500,1400);

-- ��� ���̺��� ����� �߿��� Ŀ�̼��� �޴� ����� ���Ͻÿ�
select count(comm) from emp where comm>=0;
select count(*) "�����" from emp where comm>=0;
-- ������ ������ �� ������, �� �ߺ����� �ʴ� ������ ������ ī��Ʈ�Ͻÿ�
select count(distinct job) from emp; -- ������ ������-> ����
-- �μ��� ��ձ޿�
select sum(sal)/count(deptno) from emp group by deptno;
-- �Ҽ� �μ��� �ִ� �޿��� �ּұ޿�
select max(sal),min(sal) from emp group by deptno;
-- �������� �׷�ȭ�Ͽ� ����,�ο���,��ձ޿���,�ְ�޿���,�����޿��� �� �հԸ� ���
select job,count(job),sum(sal)/count(job),max(sal),min(sal),sum(sal) from emp group by job;
-- ����: 1000�̻� �޿��� ������ �մ� ����鿡 ���ؼ��� �μ����� ����� ���ϰ� ������ �μ���
    -- ��� �޿��� 2000 �̻��� �μ���ȣ�� �μ��� ��� �޿��� ���
    select avg(sal) from emp where sal>=1000 group by deptno having avg(sal)>=2000;  
-- �μ��� �ִ밪�� �ּҰ��� ���ϵ� �ִ� �޿��� 2900 �̻��� �μ��� ���
select min(sal),max(sal) from emp group by deptno having max(sal)>=2900 ;
-- ��ü ������ 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����Ͻÿ�
    -- �� �Ǹſ��� �����ϰ� �� �޿� �հ�� ������������ �����Ͻÿ�
select job,sum(sal) from emp where job not in 'SALES' group by job having sum(sal)>5000 order by sum(sal) desc;

-- 1.�μ����� ���� �޿��� ���� �޴� ����� �����ȣ,�̸�,�޿�,�μ���ȣ�� ����Ͻÿ�
select empno,ename,sal,deptno from emp where concat(sal,deptno) in (select concat(max(sal),deptno) from emp group by deptno) ;
-- 2.SCOTT�� ������ ������ ���� ����� ����ϴ� SQL���� �ۼ��Ͻÿ�
-- ""���̺��̳� ��ü�� ǥ��, '' ���ڿ� ǥ��
select * from emp where job in (select job from emp where ename='SCOTT');
-- 3.SCOTT�� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����Ͻÿ�
select ename,sal from emp where sal >=(select sal from emp where ename='SCOTT');
-- 4.�޿��� 20�μ��� ��ձ޿����� ũ�� ����� �����ϴ� ������μ� 20�μ��� ������ ���� ����� ������ ����Ͻÿ�
select * from emp where sal> (select avg(sal) from emp group by deptno having deptno=20) 
and empno in(select distinct mgr from emp) and deptno!=20;
select * from emp where sal> (select avg(sal) from emp where deptno=20) and job='MANAGER' and deptno <> 20;
-- 5.10�� �μ��� �ٹ��ϴ� ����� �̸��� 10���μ��� �μ����� ����Ͻÿ�
select ename,dname from emp e join dept d on e.deptno=e.deptno where e.deptno=10 and d.deptno=10;
-- 6.������� 5�� �̻��� �μ��� �μ���� ������� ����Ͻÿ�
select distinct(dname),count(ename) from dept d join emp e on e.deptno=d.deptno group by dname having count(ename)>=5 ;
-- 7.SCOTT�� ����� �μ����� ����Ͻÿ�
select dname from emp e join dept d on e.deptno=d.deptno where ename='SCOTT';

select round(42.195,2) from dual;
-- ���� emp�� sal�� 100���� ������ �����غ��ÿ�
select mod(sal,100) from emp; -- ������
select -10,abs(-10) from dual; -- ���밪
select ename, length(ename) from emp;
select lpad('1234',5,'*') from dual;
select sysdate from dual;
select sysdate, hiredate, month_between(sysdate,hiredate) from emp;
SELECT SYSDATE, HIREDATE, MONTHS_BETWEEN(SYSDATE, TO_DATE(HIREDATE, 'YYYY-MM-DD')) AS MONTHS_DIFF FROM EMP;
select hiredate, add_months(hiredate,6) from emp;
select last_day(hiredate) from emp;
-- ��ȯ�Լ� (�����Ƶ�񿡼��� casting�� ���)
select ename, to_char(sal,'$999.999')from emp;
-- ���׿�����( if(����,��,����) )
select ename,deptno,decode(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') from emp; -- decode

select ename,deptno,
                    case when deptno=10 then 'ACCOUNTING'
                        when deptno=20 then 'RESEARCH'
                        when deptno=30 then 'SALES'
                        when deptno=40 then 'OPERATIONS' 
                     end 
from emp;

-- ���� job ���� ���ʽ��� �޿��� 1.5��, 1.6��, 1.7��, 1.8��, 1.9�� ������ �ַ����Ѵ�.
-- job�� ������ Ȯ���غ��� job�� ������������ �����ؼ� 1.5���� ���ʽ�
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

create table dept2( -- ���̺� ����, ���̺�� �������� : CONSTRAINT�� ���̴� ��� �ݵ�� �̸��� �����
deptno number CONSTRAINT DEPT_PK_DEPTNO primary key, -- �ڵ��ο�
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
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(123,'���γ�',1000,'M');
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(124,'������',6000,'F');
INSERT INTO EMP10(EMPNO,ENAME,SAL,GENDER) VALUES(125,'������',1000,'M');
ALTER TABLE EMP10 DROP CONSTRAINT EMP10_SAL_CK;
ALTER TABLE EMP10 ADD CONSTRAINT EMP10_SAL_CK CHECK (SAL>=500 AND SAL<=7000);
SELECT * FROM EMP10;
-- PRIMARY KEY�� �ߺ��� X NULL�� X 
-- UNIQUE KEY �ߺ�X NULL O
-- INSERT INTO EMP10 VALUES(NULL,'������',1000,'M');
-- ���� ������DB���� �ߴ� SCHOOL�� SUNGJUK TABLE �����غ��ÿ�
-- PRIMARY FOREIGN ���� 

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
-- QUERY���� ��ȣ �������� ���鼭 �Է��ؾ���
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'���ֿ��ڰ���б�','���ֽ�','CH00000001',360);
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'���￩�ڰ���б�','�����','SE00000001',1200);
INSERT INTO SCHOOL(NO,SCHOOLNAME,ADDRESS,SCHOOLCODE,STUDENTCOUNT)
VALUES(SCHOOL_NO_SEQ.NEXTVAL,'��������б�','������','IC00000001',560);

INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'�踸��',100,99,99,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'�����',100,99,99,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'������',81,81,81,'SE00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'������',81,81,81,'SE00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'������',91,100,100,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'������',100,100,100,'CH00000001');
INSERT INTO SUNGJUK(NO,NAME,KOR,MAT,ENG,SCHOOLCODE)
VALUES(SUNGJUK_NO_SEQ.NEXTVAL,'���α�',100,81,71,'IC00000001');

-- 1. �̸��� '������' �� �л��� �б�,��ȣ,�̸�,����,����� ���
select sc.schoolname,sj.no,name,total,average from sungjuk sj join school sc on sc.schoolcode=sj.schoolcode where name='������';
-- 2. ������ �� ����� �л��� ������ ���
select * from sungjuk where kor+mat+eng in (select max(kor+mat+eng) from sungjuk);
-- 3. �б��� �л����� ��������� ����Ͻÿ�
select count(*) "�л���", sum((kor+mat+eng)/3)/count(*) "�б� ���" from sungjuk group by schoolcode; 
-- 4. �б��� ����� �л��� �Ѹ� �����Ͽ� �̸� ���� �б� �̸� ���
select name,kor+mat+eng,schoolname from school sc join sungjuk sj on sc.schoolcode=sj.schoolcode where kor+mat+eng in(select max(kor+mat+eng) from sungjuk group by schoolcode);