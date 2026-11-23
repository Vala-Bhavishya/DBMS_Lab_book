-- Unit3 Exception Handling - Program 3: SQLCODE and SQLERRM
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 3: SQLCODE and SQLERRM
-- -----------------------------------------------------
DECLARE
    v_name   staff.sname%TYPE;
    v_num    NUMBER;
    v_code   NUMBER;
    v_msg    VARCHAR2(200);
BEGIN
    -- Case 1: NO_DATA_FOUND (SQLCODE = 100)
    BEGIN
        SELECT sname INTO v_name FROM staff WHERE sid = 9999;
    EXCEPTION
        WHEN OTHERS THEN
            v_code := SQLCODE;
            v_msg  := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Case 1 -> SQLCODE: ' || v_code);
            DBMS_OUTPUT.PUT_LINE('         SQLERRM: ' || v_msg);
    END;

    -- Case 2: TOO_MANY_ROWS (SQLCODE = -1422)
    BEGIN
        SELECT sname INTO v_name FROM staff WHERE dno = 30;
    EXCEPTION
        WHEN OTHERS THEN
            v_code := SQLCODE;
            v_msg  := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Case 2 -> SQLCODE: ' || v_code);
            DBMS_OUTPUT.PUT_LINE('         SQLERRM: ' || v_msg);
    END;

    -- Case 3: ZERO_DIVIDE (SQLCODE = -1476)
    BEGIN
        v_num := 10 / 0;
    EXCEPTION
        WHEN OTHERS THEN
            v_code := SQLCODE;
            v_msg  := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Case 3 -> SQLCODE: ' || v_code);
            DBMS_OUTPUT.PUT_LINE('         SQLERRM: ' || v_msg);
    END;

    -- Case 4: Duplicate primary key (SQLCODE = -1)
    BEGIN
        INSERT INTO staff VALUES (101, 'Dup', 10, 'Accounts', 'M', 30, 10000);
    EXCEPTION
        WHEN OTHERS THEN
            v_code := SQLCODE;
            v_msg  := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Case 4 -> SQLCODE: ' || v_code);
            DBMS_OUTPUT.PUT_LINE('         SQLERRM: ' || v_msg);
    END;
END;
/
