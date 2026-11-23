-- Unit4 Procedures Functions - Program 1: Procedure to raise basic pay of a department
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 1: Procedure to raise basic pay of a department
-- by a given percentage (IN parameters)
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE raise_pay (
    p_dno IN staff.dno%TYPE,
    p_pct IN NUMBER
) IS
BEGIN
    UPDATE staff
       SET basicpay = basicpay + (basicpay * p_pct / 100)
     WHERE dno = p_dno;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No staff found in department ' || p_dno);
    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' staff member(s) of department ' || p_dno ||
                             ' got a ' || p_pct || '% raise.');
        COMMIT;
    END IF;
END raise_pay;
/

-- Call the procedure
BEGIN
    raise_pay(&dept_no, &percentage);
END;
/
