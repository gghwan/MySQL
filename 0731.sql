DELIMITER //
CREATE PROCEDURE sp_test
(
	OUT v_now DATETIME,
    OUT v_version VARCHAR(30)
)
BEGIN
	SELECT NOW(), VERSION() INTO v_now, v_version;
END
//
DELIMITER ;

CALL sp_test(@t_now, @t_version);
SELECT @t_now, @t_version;

CREATE TABLE dept_clone
AS
SELECT * FROM dept;
DROP TABLE dept_clone;

DELIMITER //
CREATE PROCEDURE sp_deleteDept()
BEGIN
	DELETE FROM dept_clone;
END
//
DELIMITER ;

CALL sp_deleteDept();

Delimiter $$
CREATE PROCEDURE sp_insertDept
(
	IN   v_deptno   TINYINT,
    IN   v_dname    VARCHAR(14),
    IN   v_loc        VARCHAR(13)
)
BEGIN
	INSERT INTO dept_clone(deptno, dname, loc)
    VALUES (v_deptno, v_dname, v_loc);
    COMMIT;
END
$$
Delimiter ;

CALL sp_insertDept(50, 'Design', 'Seoul');

/* 사원번호를 입력받아서 부서이름과 부서위치를 출력하시오 */
Delimiter $$
CREATE PROCEDURE sp_selectEmp
(
	IN   v_empno   SMALLINT,
    OUT   v_dname  VARCHAR(14),
    OUT   v_loc      VARCHAR(13)
)
BEGIN
	SELECT dname, loc INTO v_dname, v_loc
    FROM emp JOIN dept ON (emp.deptno = dept.deptno)
    WHERE empno = v_empno;
END $$
Delimiter ;

CALL sp_selectEmp(7369, @t_dname, @t_loc);
SELECT @t_dname, @t_loc;

Delimiter $$
CREATE PROCEDURE sp_selectDname
(
	INOUT v_name  VARCHAR(14)
)
BEGIN
	DECLARE v_str VARCHAR(14);
	SELECT  loc INTO v_str
    FROM dept
    WHERE dname = v_name;
    SET v_name := v_str;
END $$
Delimiter ;

SET @t_str := 'RESEARCH';
CALL sp_selectDname(@t_str);
SELECT @t_str;

Delimiter $$
CREATE PROCEDURE sp_select_emp_dept
(
	IN      v_deptno    TINYINT
)
BEGIN
	SELECT empno, ename, dname, loc, dept.deptno
    FROM emp NATURAL JOIN dept
    WHERE deptno = v_deptno;
END $$
Delimiter ;

CALL sp_select_emp_dept(20);

/*  "번호\t진찰부서\t진찰비\t입원비\t진료비  */
Delimiter $$
CREATE PROCEDURE sp_select_all_patient()
BEGIN
	SELECT number, dept, operfee, hospitalfee, money
    FROM Patient
    ORDER BY number DESC;
END $$
Delimiter ;

Delimiter //
CREATE PROCEDURE sp_select_one_patient(IN v_number TINYINT)
BEGIN
	SELECT *
    FROM Patient
    WHERE number = v_number;
END //
Delimiter ;

CALL sp_select_one_patient(7);


sp_update_patient
(
	IN    v_number     TINYINT,
    IN    v_code        CHAR(2),
    IN    v_days         SMALLINT,
    IN    v_age          TiNYINT,
    IN    v_dept         VARCHAR(20),
    IN    v_operfee      INT,
    IN    v_hospitalfee   INT,
    IN    v_money      INT
)
BEGIN
	UPDATE Patient
    SET code = v_code, days = v_days,  age = v_age, 
           dept = v_dept, operfee = v_operfee, hospitalfee = v_hospitalfee,
           money = v_money
    WHERE number = v_number;
    COMMIT;
END


















