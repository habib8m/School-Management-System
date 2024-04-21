
--Class wise section--

SELECT distinct s.SECTION_NAME d, s.SECTION_ID r
FROM  SECTIONS S, ADMISSION A, CLASS C
where A.SECTION_ID = S.SECTION_ID
and A.CLASS_ID = C.CLASS_ID
and C.CLASS_ID = :P55_CLASS_ID


--Login user--

SELECT E.FIRST_NAME||' '||E.LAST_NAME Display, e.EMPLOYEE_ID
FROM EMPLOYEES E
WHERE E.EMPLOYEE_ID = (select e2.EMPLOYEE_ID 
						from EMPLOYEES e2
						join EMP_USERS u2
							ON u2.EMPLOYEE_ID = e2.EMPLOYEE_ID
						where upper(u2.USER_NAME) = upper(:APP_USER));


--Class and section wise student--

SELECT rownum as id, S.STUDENT_ID, S.FIRST_NAME||' '||S.LAST_NAME NAME, A.ROLL_NO, null status, null description
FROM STUDENTS S, ADMISSION A, sections sc
WHERE S.STUDENT_ID = A.STUDENT_ID 
and a.section_id = sc.section_id
and sc.section_id = :P55_SECTION_ID
AND S.STUDENT_ID in (SELECT STUDENT_ID FROM ADMISSION
                    WHERE CLASS_ID = :P55_CLASS_ID);


--Save detale page data by for loop--

begin
	for j in (select :STATUS as STATUS, :DESCRIPTION as DESCRIPTION, :STUDENT_ID as STUDENT_ID from dual) loop
		insert into STU_AT_DETAIL (STATUS, DESCRIPTION, MASTER_AT_ID, STUDENT_ID)
		values (j.STATUS, j.DESCRIPTION, :P55_MASTER_AT_ID, j.STUDENT_ID);
	end loop;
end;
