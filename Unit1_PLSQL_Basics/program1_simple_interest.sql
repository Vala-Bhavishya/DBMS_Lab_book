-- Unit1 PLSQL Basics - Program 1: Simple interest (SI = P * R * N / 100)
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 1: Simple interest (SI = P * R * N / 100)
-- -----------------------------------------------------
DECLARE
    loan_amount  NUMBER := &loan_amount;
    annual_rate  NUMBER := &annual_rate;
    years        NUMBER := &years;
    simple_int   NUMBER;
BEGIN
    simple_int := (loan_amount * annual_rate * years) / 100;
    DBMS_OUTPUT.PUT_LINE('Loan Amount     : ' || loan_amount);
    DBMS_OUTPUT.PUT_LINE('Annual Rate (%) : ' || annual_rate);
    DBMS_OUTPUT.PUT_LINE('Years           : ' || years);
    DBMS_OUTPUT.PUT_LINE('Simple Interest : ' || simple_int);
    DBMS_OUTPUT.PUT_LINE('Total Payable   : ' || (loan_amount + simple_int));
END;
/
