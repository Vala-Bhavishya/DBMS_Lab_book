-- Unit5 Triggers - Program 3: Copy the existing (old) values of STAFF into
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 3: Copy the existing (old) values of STAFF into
-- NEWSTAFF when a record is updated
-- -----------------------------------------------------
-- NEWSTAFF has SID as plain column (no PK) so old versions
-- of a row can be stored.
CREATE OR REPLACE TRIGGER trg_staff_update
BEFORE UPDATE ON staff
FOR EACH ROW
BEGIN
    INSERT INTO newstaff
    VALUES (:OLD.sid, :OLD.sname, :OLD.dno, :OLD.dname,
            :OLD.gender, :OLD.age, :OLD.basicpay);
END;
/

-- Test
UPDATE staff SET basicpay = 35000 WHERE sid = 101;
SELECT * FROM newstaff;   -- shows old values (basicpay 30000) of SID 101

COMMIT;
