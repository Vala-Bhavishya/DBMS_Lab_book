-- Unit5 Triggers - Program 2: Insert into NEWSTAFF when a record is
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 2: Insert into NEWSTAFF when a record is
-- inserted into STAFF
-- -----------------------------------------------------
CREATE OR REPLACE TRIGGER trg_staff_insert
AFTER INSERT ON staff
FOR EACH ROW
BEGIN
    INSERT INTO newstaff
    VALUES (:NEW.sid, :NEW.sname, :NEW.dno, :NEW.dname,
            :NEW.gender, :NEW.age, :NEW.basicpay);
END;
/

-- Test
INSERT INTO staff VALUES (108, 'Kiran', 10, 'Accounts', 'F', 26, 32000);
SELECT * FROM newstaff;
