
--Query collection information (collect money from sutdent)--

SELECT 
    ROWNUM,
    CM.COLLECTION_M_ID,
    AY.YEAR_NAME,
    CM.COLLECTION_DATE,
    C.CLASS_NAME,
    E.FIRST_NAME || ' ' || E.LAST_NAME USER_NAME,
    S.FIRST_NAME || ' ' || S.LAST_NAME STUDENT_NAME,
    CM.TOTAL,
    NVL(W.WAIVER, 0) WAIVER,
    CM.PAYABLE,
    CM.PAID,
    NVL(CM.DUE, 0) DUE,
    CM.DESCRIPTION,
    'view' as "View_summary"
FROM 
    COLLECTION_M CM
    JOIN ACADEMIC_YEARS AY ON CM.ACADEMIC_YEAR_ID = AY.ACADEMIC_YEAR_ID
    JOIN CLASS C ON C.CLASS_ID = CM.CLASS_ID
	JOIN EMP_USERS EU ON EU.USER_ID = CM.USER_ID
    JOIN EMPLOYEES E ON EU.EMPLOYEE_ID = E.EMPLOYEE_ID
    JOIN STUDENTS S ON S.STUDENT_ID = CM.STUDENT_ID
    LEFT JOIN WAIVER W ON W.STUDENT_ID = CM.STUDENT_ID;


--Student wise class--

SELECT C.CLASS_NAME, C.CLASS_ID
FROM CLASS C, ADMISSION A, STUDENTS S
WHERE A.CLASS_ID = C.CLASS_ID
AND A.STUDENT_ID = S.STUDENT_ID
AND S.STUDENT_ID = :P43_STUDENT_ID


--Calculate pade amount--

begin 
if :P43_PAYABLE >= :P43_PAID then
return true;
else 
return false;
end if;
end;


--Collection insert, update and delete--

begin  
     case :APEX$ROW_STATUS  
     when 'C' then   
         insert into COLLECTION_D (COLLECTION_M_ID, CLASS_FEE_ID, TOTAL)
         values (:P43_COLLECTION_M_ID, :CLASS_FEE_ID, :TOTAL);  
     when 'U' then  
         update COLLECTION_D  
            set COLLECTION_M_ID  = :COLLECTION_M_ID, CLASS_FEE_ID = :CLASS_FEE_ID, TOTAL = :TOTAL
            where COLLECTION_D_ID = :COLLECTION_D_ID and COLLECTION_M_ID = :COLLECTION_M_ID;  
     when 'D' then  
         delete COLLECTION_D 
         where COLLECTION_D_ID = :COLLECTION_D_ID and COLLECTION_M_ID = :P43_COLLECTION_M_ID;  
     end case;  
end; 


--View collection information--

SELECT CD.COLLECTION_M_ID, M.MONTH, CD.TOTAL
FROM COLLECTION_D CD, MONTH M, CLASS_FEE CF
WHERE CF.M_ID = M.M_ID
AND CF.CLASS_FEE_ID = CD.CLASS_FEE_ID
AND :P44_COLLECTION_M_ID = COLLECTION_M_ID



