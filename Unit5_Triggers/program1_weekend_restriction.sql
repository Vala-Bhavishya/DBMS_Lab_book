-- Unit5 Triggers - Program 1: Restrict access to STAFF on weekends
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 1: Restrict access to STAFF on weekends
-- (fires before any INSERT / UPDATE / DELETE on STAFF)
-- Note: a trigger cannot fire on SELECT in Oracle, so DML
-- operations are blocked.
-- TO_CHAR(..., 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') avoids
-- language-setting problems.
-- -----------------------------------------------------
CREATE OR REPLACE TRIGGER trg_staff_weekend
BEFORE INSERT OR UPDATE OR DELETE ON staff
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20010, 'STAFF table cannot be accessed on weekends (Saturday/Sunday).');
    END IF;
END;
/

-- Test (works on weekdays, raises error on Sat/Sun):
-- UPDATE staff SET age = age + 1 WHERE sid = 101;

-- To test on a weekday, temporarily change the condition
-- to include today's day (e.g. 'MON') and run the UPDATE above.
