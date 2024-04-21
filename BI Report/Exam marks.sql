
--Print exam marks--

SELECT
    s.student_id,
    s.first_name
    || ' '
    || s.last_name student_name,
    c.class_name,
    sec.section_name,
    em.exam_name,
    sub.subject_name,
    md.marks,
    md.grade,
    md.grade_point,
    md.status
FROM
    students     s,
    class        c,
    admission    a,
    sections     sec,
    exams_m      em,
    marks_list_m mm,
    marks_list_d md,
    subjects     sub
WHERE
        a.class_id = c.class_id
    AND a.student_id = s.student_id
    AND a.section_id = sec.section_id
    AND em.exam_m_id = mm.exam_m_id
    AND mm.marks_list_m_id = md.marks_list_m_id
    AND md.student_id = s.student_id
    AND c.class_id = mm.class_id
    AND sec.section_id = mm.section_id
    AND sub.subject_id = mm.subject_id
    AND mm.class_id LIKE nvl(:P211_CLASS_ID, '%')
    AND mm.section_id LIKE nvl(:P211_SECTION_ID, '%')
    AND mm.exam_m_id LIKE nvl(:P211_EXAM_M_ID, '%')
    AND mm.subject_id LIKE nvl(:P211_SUBJECT_ID, '%')
ORDER BY
    c.class_id,
    sec.section_id,
    em.exam_m_id,
    sub.subject_id, 
    s.student_id;
