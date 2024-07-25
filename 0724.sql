/*
	Date : 2024-07-24
*/

SELECT * FROM dept;

INSERT INTO dept 
VALUES (50, 'Design', 'Busan');

INSERT INTO dept(loc, deptno, dname)
VALUES('Taejeon', 60, 'Development');

INSERT INTO dept(deptno, dname, loc)
VALUES(70, NULL, 'Inchon');

INSERT INTO dept(deptno, loc)
VALUES(80, 'Seoul');

INSERT INTO dept(dname, loc)
VALUES('Account', 'Yongin');

INSERT INTO emp(empno, deptno)
VALUES(9999, 90);


INSERT INTO emp(empno, ename, hiredate, deptno)
VALUES(9998, 'Jimin', CURDATE(), 80);
--VALUES (9999, 'Jimin', NOW(), 80);


CREATE TABLE emp_copy1
AS
SELECT *
FROM emp
WHERE 0 = 1;

SELECT * FROM emp_copy1;

INSERT INTO emp_copy1(empno, ename)
VALUES(1111, '한지민');

SELECT * FROM dept;

UPDATE dept
SET dname = 'FINANCE'
WHERE deptno = 70;


UPDATE dept
SET dname = 'HR', loc = 'Busan'
WHERE deptno = 70;
