CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
	v_top_number NUMBER,
	v_bottom_number NUMBER
)
AS
    v_error_code NUMBER;
    v_error_message VARCHAR2(1000);
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_top_number / v_bottom_number);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        v_error_code := SQLCODE;
        v_error_message := SQLERRM;
        INSERT INTO error_log
        (err_datetime, err_procedure, err_number, err_message)
        VALUES (SYSDATE, 'DivideTwoNumbers', v_error_code, v_error_message);
        
END;

CALL DivideTwoNumbers(10, 2);
CALL DivideTwoNumbers(15, 6);
CALL DivideTwoNumbers(4, 0);

SELECT
TO_CHAR(err_datetime, 'YYYY-MM-DD HH:MI:SS') AS err_datetime,
err_procedure,
err_number,
err_message
FROM error_log;

SELECT *
FROM error_log;
