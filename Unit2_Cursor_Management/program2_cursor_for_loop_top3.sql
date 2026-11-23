-- Unit2 Cursor Management - Program 2: Cursor FOR loop - top 3 highest paid staff
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 2: Cursor FOR loop - top 3 highest paid staff
-- -----------------------------------------------------
DECLARE
    CURSOR c_top3 IS
        SELECT sname, basicpay
          FROM staff
         ORDER BY basicpay DESC
         FETCH FIRST 3 ROWS ONLY;      -- Oracle 12c+
    -- For Oracle 11g use instead:
    -- SELECT sname, basicpay FROM
    --   (SELECT sname, basicpay FROM staff ORDER BY basicpay DESC)
    --  WHERE ROWNUM <= 3;
    v_rank NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 highest paid staff members');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    FOR rec IN c_top3 LOOP
        v_rank := v_rank + 1;
        DBMS_OUTPUT.PUT_LINE(v_rank || '. ' || RPAD(rec.sname, 12) || ' Basic Pay: ' || rec.basicpay);
    END LOOP;
END;
/
