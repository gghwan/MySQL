CREATE VIEW  mycompany.aaa
AS
SELECT empno, ename, job
FROM emp
WHERE deptno = 20;

SELECT * 
FROM aaa;

CREATE VIEW bbb
AS
SELECT empno, ename, dname, loc 
FROM emp JOIN dept ON (emp.deptno = dept.deptno)
WHERE dept.deptno = 30;

SELECT *
FROM bbb;

DESC INFORMATION_SCHEMA.VIEWS;


CREATE VIEW EMP_30_VU
AS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 30;

SELECT *
FROM EMP_30_VU;

INSERT INTO EMP_30_VU
VALUES(1111, 'Jimin', 500, 30);

SELECT *
FROM emp;

CREATE OR REPLACE VIEW emp_20
AS
SELECT * FROM emp
WHERE deptno = 20
WITH CHECK OPTION;

SELECT *
FROM emp_20;

UPDATE emp_20
SET deptno = 30
WHERE empno = 7369;

SHOW INDEX FROM emp;

CREATE INDEX i_emp_ename ON emp(ename);

delimiter $$
CREATE PROCEDURE if_test()
BEGIN
	DECLARE var INT;
	SET var := 52;
	IF var % 2 = 0 THEN
		SELECT 'Even Number';
	ELSE
		SELECT 'Odd Number';
	END IF;
END
$$
delimiter ;

CALL if_test()

DELIMITER $$
CREATE procedure helloworld()
BEGIN
	SELECT 'Hello, World';
END
$$
DELIMITER ;

CALL helloworld();








