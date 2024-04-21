
--Student personal information--

select S.STUDENT_ID,
S.FIRST_NAME||' '||S.LAST_NAME||' ('||S.STUDENT_ID||')' Full_name,
S.GENDER,
S.RELIGION,
S.DATE_OF_BIRTH,
S.BLOOD_GROUP,
S.EMAIL,
S.PHONE_NO,
S.PRESENT_ADDRESS,
S.PERMANENT_ADDRESS,
sys.dbms_lob.getlength(TO_BLOB(S.PICTURE)) PICTURE,
S.MIMETYPE,
S.FILENAME,
S.IMG_LAST_UPDATE,
S.STATUS,
'view' as "View"
from STUDENTS S, ADMISSION A, CLASS C, SECTIONS SEC
WHERE A.STUDENT_ID =S.STUDENT_ID
AND A.CLASS_ID = C.CLASS_ID
AND A.SECTION_ID = SEC.SECTION_ID
AND C.CLASS_ID = NVL(:P130_CLASS_NAME,C.CLASS_ID)
AND SEC.SECTION_ID = NVL(:P130_SECTION_NAME, SEC.SECTION_ID) 


--Student contact information--

SELECT G.GUARDIAN_ID, S.STUDENT_ID, S.FIRST_NAME||' '||S.LAST_NAME||' ('||S.STUDENT_ID||')' Full_name, S.FATHER_NAME, S.MOTHER_NAME,
	G.GUARDIAN_NAME, G.RELATIONSHIP, G.PHONE_NO Guardian_phone, G.EMAIL  
   	FROM STUDENTS S, GUARDIANS G, ADMISSION A, CLASS C, SECTIONS SEC
	WHERE s.student_id = g.student_id
	and s.student_id = a.student_id
	AND A.CLASS_ID = C.CLASS_ID
	AND A.SECTION_ID = SEC.SECTION_ID
    AND C.CLASS_ID = NVL(:P130_CLASS_NAME,C.CLASS_ID)
	AND SEC.SECTION_ID = NVL(:P130_SECTION_NAME, SEC.SECTION_ID) 


--Student academic information--

SELECT S.STUDENT_ID, A.ADMISSION_ID, S.FIRST_NAME||' '||S.LAST_NAME||' ('||s.student_id||')' Full_name, AD.YEAR_NAME, A.ADMISSION_DATE, C.CLASS_NAME, SEC.SECTION_NAME, A.ROLL_NO
   	FROM STUDENTS S, CLASS C,  ADMISSION A, SECTIONS SEC, ACADEMIC_YEARS AD
	WHERE S.student_id = A.student_id
    AND C.CLASS_ID = A.CLASS_ID
    AND SEC.SECTION_ID = A.SECTION_ID
    AND A.ACADEMIC_YEAR_ID = AD.ACADEMIC_YEAR_ID
   AND C.CLASS_ID = NVL(:P130_CLASS_NAME,C.CLASS_ID)
   AND SEC.SECTION_ID = NVL(:P130_SECTION_NAME, SEC.SECTION_ID) 