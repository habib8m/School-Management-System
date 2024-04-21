
--Query all employee by for loop--

BEGIN
   FOR j IN (SELECT :STATUS AS STATUS, :DESCRIPTION AS DESCRIPTION, :EMPLOYEE_ID AS EMPLOYEE_ID FROM dual) LOOP
      UPDATE EMP_AT_D
      SET STATUS = j.STATUS,
          DESCRIPTION = j.DESCRIPTION
      WHERE AT_M_ID = :P217_AT_M_ID
        AND EMPLOYEE_ID = j.EMPLOYEE_ID;
   END LOOP;
END;



--Update employee attendance--

select rownum as id,
	   AD.AT_D_ID,
       AD.STATUS,
       AD.DESCRIPTION,
       AD.EMPLOYEE_ID,
	   E.FIRST_NAME||' '||E.LAST_NAME as Employee_name,
       AD.AT_M_ID
  from EMP_AT_D AD, EMPLOYEES E
 where AD.AT_M_ID=:P217_AT_M_ID
 AND E.EMPLOYEE_ID = AD.EMPLOYEE_ID

 