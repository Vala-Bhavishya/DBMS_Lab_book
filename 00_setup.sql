-- =====================================================
-- DBMS-2 (C05BC3301) - Setup script
-- Run this FIRST. Creates all tables and sample data.
-- Database: Oracle (SQL*Plus / SQL Developer / Live SQL)
-- =====================================================

-- Drop old tables if they exist (ignore errors on first run)
BEGIN EXECUTE IMMEDIATE 'DROP TABLE student_marks'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE staff_backup'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE newstaff'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE staff'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- STUDENT_MARKS (Unit 1, Program 2)
CREATE TABLE student_marks (
    stud_id     NUMBER(5) PRIMARY KEY,
    stud_name   VARCHAR2(30),
    m1          NUMBER(3),
    m2          NUMBER(3),
    m3          NUMBER(3),
    m4          NUMBER(3),
    m5          NUMBER(3),
    total       NUMBER(4),
    percentage  NUMBER(5,2),
    grade       VARCHAR2(2)
);

INSERT INTO student_marks (stud_id, stud_name, m1, m2, m3, m4, m5) VALUES (1, 'Amit',   78, 82, 91, 67, 74);
INSERT INTO student_marks (stud_id, stud_name, m1, m2, m3, m4, m5) VALUES (2, 'Riya',   55, 61, 48, 70, 52);
INSERT INTO student_marks (stud_id, stud_name, m1, m2, m3, m4, m5) VALUES (3, 'Karan',  92, 95, 88, 97, 90);
INSERT INTO student_marks (stud_id, stud_name, m1, m2, m3, m4, m5) VALUES (4, 'Neha',   35, 42, 38, 40, 33);

-- STAFF (used in Units 1-5)
CREATE TABLE staff (
    sid       NUMBER(5) PRIMARY KEY,
    sname     VARCHAR2(30),
    dno       NUMBER(3),
    dname     VARCHAR2(20),
    gender    CHAR(1),
    age       NUMBER(3),
    basicpay  NUMBER(10,2)
);

INSERT INTO staff VALUES (101, 'Rahul',  10, 'Accounts',  'M', 35, 30000);
INSERT INTO staff VALUES (102, 'Priya',  10, 'Accounts',  'F', 29, 28000);
INSERT INTO staff VALUES (103, 'Suresh', 20, 'HR',        'M', 41, 45000);
INSERT INTO staff VALUES (104, 'Anita',  20, 'HR',        'F', 33, 38000);
INSERT INTO staff VALUES (105, 'Vikram', 30, 'IT',        'M', 27, 52000);
INSERT INTO staff VALUES (106, 'Meera',  30, 'IT',        'F', 31, 60000);
INSERT INTO staff VALUES (107, 'Deepak', 30, 'IT',        'M', 38, 48000);

-- STAFF_BACKUP (Unit 3, Program 2) - same structure as STAFF
CREATE TABLE staff_backup AS SELECT * FROM staff WHERE 1 = 2;

-- NEWSTAFF (Unit 5, Programs 2 & 3) - same structure as STAFF
CREATE TABLE newstaff AS SELECT * FROM staff WHERE 1 = 2;

COMMIT;

SELECT * FROM staff;
