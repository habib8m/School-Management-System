
--App user--

SELECT E.FIRST_NAME||' '||E.LAST_NAME Display, U.USER_ID
FROM EMPLOYEES E, EMP_USERS U
WHERE E.EMPLOYEE_ID = U.EMPLOYEE_ID
AND UPPER(USER_NAME) = UPPER(:APP_USER)


--Access role--

select role_name d, role_id r
from APEX_APPL_ACL_ROLES where application_id = :APP_ID 
order by 1