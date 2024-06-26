
--Print class routine for student--

SELECT C.CLASS_NAME, S.SECTION_NAME, D.DAY, CL.CLASS_TIME, SUB.SUBJECT_NAME, 
E.FIRST_NAME||' '||E.LAST_NAME EMPLOYEE_NAME, CR.ROOM_NUMBER
FROM CLASS C, SECTIONS S, ROUTINE_MASTER RM, ROUTINE_DETAIL RD, DAY_OF_WEEK D, CLASSROOMS CR, 
CLASS_SLOT CL, SUBJECTS SUB, EMPLOYEES E
WHERE C.CLASS_ID = RM.CLASS_ID
AND S.SECTION_ID = RM.SECTION_ID
AND RM.ROUTINE_M_ID = RD.ROUTINE_M_ID
AND RM.DAY_ID = D.DAY_ID
AND CR.CLASSROOM_ID = RM.CLASSROOM_ID
AND CL.SLOT_ID = RD.SLOT_ID
AND SUB.SUBJECT_ID = RD.SUBJECT_ID
AND E.EMPLOYEE_ID = RD.TEACHER_ID
AND RM.CLASS_ID = NVL(:P77_CLASS_NAME, RM.CLASS_ID)
AND RM.SECTION_ID = NVL(:P77_SECTION_NAME, RM.SECTION_ID)
ORDER BY C.CLASS_ID, S.SECTION_ID, D.DAY_ID, CL.SLOT_ID
