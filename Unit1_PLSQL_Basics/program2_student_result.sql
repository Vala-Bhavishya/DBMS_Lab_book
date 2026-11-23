-- Unit1 PLSQL Basics - Program 2: Total, percentage and grade for a student
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 2: Total, percentage and grade for a student
-- (table STUDENT_MARKS is created in 00_setup.sql)
-- -----------------------------------------------------
DECLARE
    v_id    student_marks.stud_id%TYPE := &stud_id;
    v_name  student_marks.stud_name%TYPE;
    v_m1    student_marks.m1%TYPE;
    v_m2    student_marks.m2%TYPE;
    v_m3    student_marks.m3%TYPE;
    v_m4    student_marks.m4%TYPE;
    v_m5    student_marks.m5%TYPE;
    v_total NUMBER(4);
    v_per   NUMBER(5,2);
    v_grade VARCHAR2(2);
BEGIN
    SELECT stud_name, m1, m2, m3, m4, m5
      INTO v_name, v_m1, v_m2, v_m3, v_m4, v_m5
      FROM student_marks
     WHERE stud_id = v_id;

    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_per   := v_total / 5;          -- each subject out of 100

    IF    v_per >= 90 THEN v_grade := 'A+';
    ELSIF v_per >= 80 THEN v_grade := 'A';
    ELSIF v_per >= 70 THEN v_grade := 'B';
    ELSIF v_per >= 60 THEN v_grade := 'C';
    ELSIF v_per >= 40 THEN v_grade := 'D';
    ELSE                   v_grade := 'F';
    END IF;

    UPDATE student_marks
       SET total = v_total, percentage = v_per, grade = v_grade
     WHERE stud_id = v_id;
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Student ID  : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Name        : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Total       : ' || v_total || ' / 500');
    DBMS_OUTPUT.PUT_LINE('Percentage  : ' || v_per || ' %');
    DBMS_OUTPUT.PUT_LINE('Grade       : ' || v_grade);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with ID ' || v_id);
END;
/
