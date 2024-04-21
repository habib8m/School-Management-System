
--Existing sutent--

SELECT S.FIRST_NAME||' '||S.LAST_NAME||' ('||S.STUDENT_ID||')' NAME, S.STUDENT_ID
FROM STUDENTS S, ADMISSION A
WHERE A.STUDENT_ID = S.STUDENT_ID
AND A.CLASS_ID = NVL(:P155_CLASS_NAME, A.CLASS_ID)
ORDER BY 2

--Max sudent id--

select max(nvl(STUDENT_ID,0)) + 1 into :P155_STUDENT_ID_ABC from students;
return :P155_STUDENT_ID_ABC;