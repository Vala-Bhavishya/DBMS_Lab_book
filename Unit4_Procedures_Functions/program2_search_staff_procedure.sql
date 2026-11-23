-- Unit4 Procedures Functions - Program 2: SEARCH_STAFF procedure (IN and OUT)
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 2: SEARCH_STAFF procedure (IN and OUT)
-- -----------------------------------------------------
CREATE OR REPLACE PROCEDURE search_staff (
    p_sid  IN  staff.sid%TYPE,
    p_name OUT staff.sname%TYPE
) IS
BEGIN
    SELECT sname INTO p_name FROM staff WHERE sid = p_sid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Staff ID ' || p_sid || ' not found in the STAFF table.');
END search_staff;
/

-- Calling block
DECLARE
    v_sid   staff.sid%TYPE := &sid;
    v_name  staff.sname%TYPE;
BEGIN
    search_staff(v_sid, v_name);
    DBMS_OUTPUT.PUT_LINE('Staff found. Name: ' || v_name);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
