
--Employee personal information--

select "EMPLOYEE_ID",
"FIRST_NAME"||' '||"LAST_NAME"||' ('||EMPLOYEE_ID||')' as "Employee Name",
sys.dbms_lob.getlength("EMPLOYEE_IMAGE")"EMPLOYEE_IMAGE",
"IMG_MIMETYPE",
"IMG_FILENAME",
"IMG_LAST_UPDATE",
"GENDER",
"EMAIL",
"PHONE_NO",
"NATIONAL_ID",
"MARITAL_STATUS",
"BLOOD_GROUP",
"RELIGION",
'view' as "View"
from "EMPLOYEES"
where job_id in ('TCH', 'PRIN', 'VP')


--Official information--

select "EMPLOYEE_ID",
"FIRST_NAME"||' '||"LAST_NAME"||' ('||EMPLOYEE_ID||')' as "Employee Name",
sys.dbms_lob.getlength("CV")"CV",
"CV_MIMETYPE",
"CV_FILENAME",
"CV_LAST_UPDATE",
"EMPLOYEE_TYPE",
"SALARY",
"HIRE_DATE",
"SCHOOL_ID",
"JOB_ID",
"STATUS",
"A_DEGREE"
from "EMPLOYEES"
where job_id in ('TCH', 'PRIN', 'VP')


--Card view--

SELECT
    E.EMPLOYEE_ID,
    J.JOB_TITLE CARD_TEXT, 
	('Phone NO: '||E.PHONE_NO) CARD_SUBTEXT,
    (E.FIRST_NAME || ' ' || E.LAST_NAME) AS CARD_TITLE,
    APEX_UTIL.get_blob_file_src('P16_EMPLOYEE_IMAGE', E.EMPLOYEE_ID) AS CARD_INITIALS
FROM
    EMPLOYEES E
    JOIN JOBS J 
	ON E.JOB_ID = J.JOB_ID
where E.job_id in ('TCH', 'PRIN', 'VP')
	
