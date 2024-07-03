CREATE OR REPLACE PROCEDURE FindEmployeeName(
  v_employee_id IN NUMBER,
  v_first_name OUT VARCHAR2
)
AS
BEGIN
  SELECT first_name
  INTO v_first_name
  FROM employees
  WHERE employee_id = v_employee_id;
END;


DECLARE
  found_first_name VARCHAR2(100);
BEGIN
  FindEmployeeName(101, found_first_name);
  DBMS_OUTPUT.PUT_LINE(found_first_name);
END;
