CREATE TABLE dept(-- �μ�����
    DEPTNO INT PRIMARY KEY,-- 1����Ʈ : 256����
    DNAME VARCHAR(14),
	LOC VARCHAR(13)
);
-- key�� �̿��ؼ� �ΰ��� ���̺��� ����
-- �����ͺ��̽��� �˻��� �켱 : �ߺ� �����Ͱ� ������ �� ��
-- �����͸� �����ϰ� ������ �� �ִ� ������ : key
-- �ΰ��� ���̺��� ������ �� ����ϴ� Ű : primary key foreign key
-- foreign key�� �����ϴ� ���� �ִ� �����͹��� ���� �־�� �Ѵ�.
CREATE TABLE EMP(-- EMPLOYEE ��������
	EMPNO INT PRIMARY KEY, -- 2����Ʈ(-32768~32767) -- ��ȣ
	ENAME VARCHAR(10), -- �̸�
	JOB VARCHAR(9), -- ����
	MGR INT, -- ������
	HIREDATE DATE, -- �Ի��� : ��¥,����,���� | ��¥)����½� ���ڿ�,���� ��Ģ����
	SAL FLOAT, --�޿�
	COMM FLOAT, --Ŀ�̼�
	DEPTNO INT, -- �μ���ȣ
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

-- ��� ���̺��� �̸�, ������ ����Ͻÿ�
select ename,job from emp;
-- �μ���ȣ�� ����Ͻÿ�
select deptno from emp;
-- ������ ����Ͻÿ� ����Ҷ��� �ʵ���� ����
select  sal*12 +nvl(comm,0) as "����" from emp ;
-- �μ���ȣ�� 10���� ����� ���� ������ ����Ͻÿ�
select * from emp where deptno=10;
