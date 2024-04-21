
--Total count--

SELECT 
(select COUNT(*) from EMPLOYEES) as Employees,
(select COUNT(*) from STUDENTS) as Students,
(select COUNT(*) from CLASS) as Classes,
(select COUNT(*) from sections) as Sections,
(select COUNT(*) from SUBJECTS) as Subjects,
(select COUNT(*) from EMP_USERS) as Users,
(SELECT COUNT(*) FROM STU_AT_DETAIL sad JOIN STU_AT_MASTER sam ON sam.MASTER_AT_ID = sad.MASTER_AT_ID WHERE sad.status = 'P'AND TO_CHAR(sam.ATTENDANCE_DATE, 'dd-mm-yyyy') = TO_CHAR(SYSDATE, 'dd-mm-yyyy')) Present,
(SELECT COUNT(*) FROM STU_AT_DETAIL sad JOIN STU_AT_MASTER sam ON sam.MASTER_AT_ID = sad.MASTER_AT_ID WHERE sad.status = 'A' AND TO_CHAR(sam.ATTENDANCE_DATE, 'dd-mm-yyyy') = TO_CHAR(SYSDATE, 'dd-mm-yyyy')) Absent
FROM dual;


-- Class wise subject--

select c.class_name,  count(s.subject_id) total_subjcts
from subjects s, class c, CLASS_SUBJECTS cs
where s.subject_id = cs.subject_id
and c.class_id = cs.class_id
group by c.class_name, c.class_id
order by c.class_id


-- Month wise expense--

SELECT TO_CHAR(EXP_DATE, 'Month-YYYY') AS MONTH, SUM(TOTAL_AMOUNT) AS TOTAL_EXPENSE
FROM EXP_MASTER
GROUP BY TO_CHAR(EXP_DATE, 'Month-YYYY')
ORDER BY TO_DATE(TO_CHAR(EXP_DATE, 'Month-YYYY'), 'Month-YYYY');


-- Student attendance--

SELECT
    C.CLASS_NAME,
    SUM(CASE WHEN D.STATUS = 'P' THEN 1 ELSE 0 END) AS Present,
    SUM(CASE WHEN D.STATUS = 'A' THEN 1 ELSE 0 END) AS Absent
FROM
    STU_AT_MASTER M
JOIN
    CLASS C ON C.CLASS_ID = M.CLASS_ID
JOIN
    STU_AT_DETAIL D ON M.MASTER_AT_ID = D.MASTER_AT_ID
    
WHERE TO_CHAR(M.ATTENDANCE_DATE, 'dd-mm-yyyy') = TO_CHAR(SYSDATE, 'dd-mm-yyyy')

GROUP BY
    M.CLASS_ID,
    C.CLASS_NAME
ORDER BY
    M.CLASS_ID;


-- Student absent information--

select c.class_name ACTIONS, s.first_name||' '||s.last_name TITLE, 'Reasons : ' ||nvl(sad.description, 'Not specified') Description
from students s
join stu_at_detail sad
on s.student_id = sad.student_id
join stu_at_master sam
on sam. master_at_id = sad.master_at_id
join class c
on c.class_id = sam.class_id
where sad.status = 'A'
and TO_CHAR(sam.ATTENDANCE_DATE, 'dd-mm-yyyy') = TO_CHAR(SYSDATE, 'dd-mm-yyyy')
order by c.class_id
