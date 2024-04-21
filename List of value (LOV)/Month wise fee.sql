
SELECT M.MONTH, CF.CLASS_FEE_ID, CF.TOTAL
FROM MONTH M, CLASS_FEE CF
WHERE M.M_ID = CF.M_ID
AND CF.CLASS_ID = :P43_CLASS_ID
AND CF.CLASS_FEE_ID NOT IN (SELECT CD.CLASS_FEE_ID
                                   FROM COLLECTION_D CD, COLLECTION_M CM, STUDENTS S
                                   WHERE CD.COLLECTION_M_ID = CM.COLLECTION_M_ID
                                   AND S.STUDENT_ID = CM.STUDENT_ID
                                   AND S.STUDENT_ID = :P43_STUDENT_ID)
ORDER BY M.M_ID