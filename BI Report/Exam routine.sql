
SELECT
    c.class_name,
    em.exam_name,
    s.section_name,
    ay.year_name,
    s.subject_name,
    ed.exam_date,
    es.EXAM_TIME,
    e.first_name
    || ' '
    || e.last_name examiner
FROM
    exams_m        em,
    class          c,
    sections       s,
    academic_years ay,
    exams_d        ed,
    subjects       s,
    employees      e,
    EXAM_SLOT      es
WHERE
        c.class_id = em.class_id
    AND s.section_id = em.section_id
    AND em.academic_year_id = ay.academic_year_id
    AND em.exam_m_id = ed.exam_m_id
    AND s.subject_id = ed.subject_id
    AND e.employee_id = ed.examiner_id
    and es.SLOT_ID = ed.SLOT_ID
    AND upper(em.exam_name) = upper(nvl(:P72_EXAM_NAME, em.exam_name))
    AND em.class_id = nvl(:p72_class_id, em.class_id)
    AND em.section_id = nvl(:p72_section_id, em.section_id)
    AND em.academic_year_id = nvl(:p72_academic_year_id, em.academic_year_id)
    ORDER BY c.class_id, em.exam_m_id
