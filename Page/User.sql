
--User authentication--

FUNCTION user_auth (p_username in VARCHAR2, p_password in VARCHAR2)
RETURN BOOLEAN
is
v_user NUMBER := 0;
BEGIN
SELECT 1 INTO v_user
FROM EMP_USERS
WHERE UPPER(USER_NAME) = UPPER(p_username)
AND PASSWORD = p_password
AND STATUS = 'Active';
RETURN true;
-- EXCEPTION
-- WHEN no_data_found THEN
-- RETURN false;
END;



--User and role--

SELECT 
    ROWNUM,
    EU.USER_ID,
    EU.USER_NAME,
    EU.PASSWORD,
    EU.STATUS,
    EU.EMPLOYEE_ID,
    (SELECT role_names
     FROM apex_appl_acl_users
     WHERE application_id = 97432
       AND UPPER(user_name) = UPPER(EU.user_name)) AS User_role
FROM EMP_USERS EU;
