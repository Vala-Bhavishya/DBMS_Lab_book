-- Unit2 Cursor Management - Program 3: Parameterized cursor + cursor FOR loop
-- Run 00_setup.sql first (once).
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- Program 3: Parameterized cursor + cursor FOR loop
-- Department-wise basic pay of each staff member and
-- department-wise total gross pay
-- Gross = Basic + DA(50%) + HRA(15%) + 500 - PF(10%)
-- -----------------------------------------------------
DECLARE
    CURSOR c_dept IS
        SELECT DISTINCT dno, dname FROM staff ORDER BY dno;

    CURSOR c_staff (p_dno NUMBER) IS
        SELECT sid, sname, basicpay FROM staff WHERE dno = p_dno;

    v_gross       NUMBER(12,2);
    v_dept_gross  NUMBER(12,2);
BEGIN
    FOR d IN c_dept LOOP
        v_dept_gross := 0;
        DBMS_OUTPUT.PUT_LINE('Department ' || d.dno || ' - ' || d.dname);
        DBMS_OUTPUT.PUT_LINE('  SID   Name          Basic Pay');

        FOR s IN c_staff(d.dno) LOOP
            v_gross := s.basicpay + (0.50 * s.basicpay + 0.15 * s.basicpay + 500) - 0.10 * s.basicpay;
            v_dept_gross := v_dept_gross + v_gross;
            DBMS_OUTPUT.PUT_LINE('  ' || RPAD(s.sid, 6) || RPAD(s.sname, 14) || s.basicpay);
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('  Total Gross Pay of Dept ' || d.dno || ' = ' || v_dept_gross);
        DBMS_OUTPUT.PUT_LINE('------------------------------------');
    END LOOP;
END;
/
