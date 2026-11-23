-- Unit1 PLSQL Basics - Program 3: Gross pay of a staff member
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 3: Gross pay of a staff member
-- Gross = Basic + (DA + HRA + Medical) - PF
-- DA = 50%, HRA = 15%, Medical = 500, PF = 10%
-- -----------------------------------------------------
DECLARE
    v_sid    staff.sid%TYPE := &sid;
    v_name   staff.sname%TYPE;
    v_basic  staff.basicpay%TYPE;
    v_da     NUMBER(10,2);
    v_hra    NUMBER(10,2);
    v_med    CONSTANT NUMBER := 500;
    v_pf     NUMBER(10,2);
    v_gross  NUMBER(10,2);
BEGIN
    SELECT sname, basicpay INTO v_name, v_basic
      FROM staff WHERE sid = v_sid;

    v_da    := 0.50 * v_basic;
    v_hra   := 0.15 * v_basic;
    v_pf    := 0.10 * v_basic;
    v_gross := v_basic + (v_da + v_hra + v_med) - v_pf;

    DBMS_OUTPUT.PUT_LINE('Staff ID   : ' || v_sid);
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Pay  : ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('DA (50%)   : ' || v_da);
    DBMS_OUTPUT.PUT_LINE('HRA (15%)  : ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('Medical    : ' || v_med);
    DBMS_OUTPUT.PUT_LINE('PF (10%)   : ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('Gross Pay  : ' || v_gross);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No staff member found with SID ' || v_sid);
END;
/
