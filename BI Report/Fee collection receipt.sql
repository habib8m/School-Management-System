
--Student fee collection--

SELECT S.STUDENT_ID, S.FIRST_NAME||' '||S.LAST_NAME STUDENT_NAME, C.CLASS_NAME, CD.TOTAL MONTH_TOTAL, CM.TOTAL GRANT_TATAL, 
NVL(CM.WAIVER, 0) WAIVER, CM.PAYABLE, CM.PAID, CM.DUE, M.MONTH, CM.COLLECTION_DATE, CM.COLLECTION_M_ID
FROM STUDENTS S, COLLECTION_M CM, CLASS C, COLLECTION_D CD, MONTH M, CLASS_FEE CF
WHERE S.STUDENT_ID = CM.STUDENT_ID
AND C.CLASS_ID = CM.CLASS_ID
AND CM.COLLECTION_M_ID = CD.COLLECTION_M_ID
AND M.M_ID = CF.M_ID
AND CF.CLASS_FEE_ID = CD.CLASS_FEE_ID
AND CM.COLLECTION_M_ID = :P44_COLLECTION_M_ID