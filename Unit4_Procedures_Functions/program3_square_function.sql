-- Unit4 Procedures Functions - Program 3: Function returning the square of a number
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 3: Function returning the square of a number
-- -----------------------------------------------------
CREATE OR REPLACE FUNCTION square_num (p_num IN NUMBER)
RETURN NUMBER IS
BEGIN
    RETURN p_num * p_num;
END square_num;
/

-- (a) Execute using a separate PL/SQL block
DECLARE
    n   NUMBER := &number;
    res NUMBER;
BEGIN
    res := square_num(n);
    DBMS_OUTPUT.PUT_LINE('Square of ' || n || ' = ' || res);
END;
/

-- (b) Execute on the command line (SQL*Plus)
SELECT square_num(7) AS square_result FROM dual;

-- or using a bind variable:
VARIABLE g_result NUMBER;
EXEC :g_result := square_num(12);
PRINT g_result;
