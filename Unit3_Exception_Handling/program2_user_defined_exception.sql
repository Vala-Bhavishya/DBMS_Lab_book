-- Unit3 Exception Handling - Program 2: User-defined exception DEPT_NOT_AVAILABLE
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 2: User-defined exception DEPT_NOT_AVAILABLE
-- Copy staff of a given department into STAFF_BACKUP
-- -----------------------------------------------------
DECLARE
    v_dno  staff.dno%TYPE := &dno;
    v_cnt  NUMBER := 0;
    DEPT_NOT_AVAILABLE EXCEPTION;

    CURSOR c_staff IS
        SELECT * FROM staff WHERE dno = v_dno;
BEGIN
    FOR rec IN c_staff LOOP
        INSERT INTO staff_backup
        VALUES (rec.sid, rec.sname, rec.dno, rec.dname, rec.gender, rec.age, rec.basicpay);
        v_cnt := v_cnt + 1;
    END LOOP;

    IF v_cnt = 0 THEN
        RAISE DEPT_NOT_AVAILABLE;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE(v_cnt || ' record(s) of department ' || v_dno || ' copied to STAFF_BACKUP.');
EXCEPTION
    WHEN DEPT_NOT_AVAILABLE THEN
        DBMS_OUTPUT.PUT_LINE('Department ' || v_dno || ' is not available (no staff records found).');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Records of department ' || v_dno || ' are already present in STAFF_BACKUP.');
        ROLLBACK;
END;
/

SELECT * FROM staff_backup;
