-- Unit3 Exception Handling - Program 1: ZERO_DIVIDE exception
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 1: ZERO_DIVIDE exception
-- -----------------------------------------------------
DECLARE
    a      NUMBER := &num1;
    b      NUMBER := &num2;
    result NUMBER;
BEGIN
    result := a / b;
    DBMS_OUTPUT.PUT_LINE('Result of ' || a || ' / ' || b || ' = ' || result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed.');
END;
/
