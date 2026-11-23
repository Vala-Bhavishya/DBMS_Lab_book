-- Unit2 Cursor Management - Program 1: Implicit cursor - SQL%ROWCOUNT
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 1: Implicit cursor - SQL%ROWCOUNT
-- Raise basic pay of Dept 10 staff by 10%
-- -----------------------------------------------------
BEGIN
    UPDATE staff
       SET basicpay = basicpay * 1.10
     WHERE dno = 10;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' staff record(s) of department 10 updated (basic pay raised by 10%).');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No staff members found in department 10.');
    END IF;
    COMMIT;
END;
/

SELECT sid, sname, dno, basicpay FROM staff WHERE dno = 10;
