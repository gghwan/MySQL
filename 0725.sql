START TRANSACTION;

SELECT * FROM emp 
WHERE empno = 7782;

UPDATE emp
SET deptno = 30
WHERE empno = 7782;

SAVEPOINT aaa;

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (7999, 'TOM', 'SALESMAN', 7782, CURDATE(), 2000, 2000, 10);

ROLLBACK TO aaa;

CREATE TABLE emp20
AS
SELECT  empno, ename, sal
FROM   emp
WHERE  deptno = 20;

SELECT * FROM emp20;

DROP TABLE emp20;

ALTER TABLE emp20
ADD age TINYINT AFTER ename;

ALTER TABLE emp20
DROP COLUMN sal;

ALTER TABLE emp20
MODIFY ename VARCHAR(20);

CREATE TABLE Jusorok
(
	bunho SMALLINT,
	gender CHAR(6) DEFAULT 'male'
);

INSERT INTO Jusorok VALUE(1, 'FEMALE');
INSERT INTO Jusorok VALUES(2, DEFAULT);


CREATE TABLE Student(
	hakbun      CHAR(4),
    name      VARCHAR(20)   NOT NULL,
    kor           TINYINT      NOT NULL CHECK(kor BETWEEN 0 AND 100),
    eng          TINYINT      NOT NULL ,
    mat          TINYINT       NOT NULL  DEFAULT 0,
    edp          TINYINT,
    tot           SMALLINT,
    avg         FLOAT(5, 2),
    grade        CHAR(1),
    deptno      TINYINT,
    CONSTRAINT student_hakbun_pk PRIMARY KEY(hakbun),
    CONSTRAINT student_name_uk   UNIQUE(name),
    CONSTRAINT student_grade_ck  CHECK(grade IN('A', 'B', 'C', 'D', 'F')),
    CONSTRAINT student_deptno_fk FOREIGN KEY(deptno) 
    REFERENCES dept(deptno)
) DEFAULT CHARSET utf8;

ALTER TABLE Student
MODIFY edp TINYINT NOT NULL;

ALTER TABLE Student
ADD CONSTRAINT student_tot_ck CHECK(tot BETWEEN 0 AND 400);

ALTER TABLE Student
MODIFY eng TINYINT;

ALTER TABLE Student
DROP CONSTRAINT student_name_uk;




