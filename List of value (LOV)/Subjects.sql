
select s.SUBJECT_NAME,cs.subject_id, M.MARKS_ID, M.TOTAL_MARKS
from CLASS_SUBJECTS cs, SUBJECTS s, MARKS m
where cs.SUBJECT_ID = s.SUBJECT_ID
and m.SUBJECT_ID = s.SUBJECT_ID
and cs.class_id = :P161_CLASS_ID
and cs.SECTION_ID = :P161_SECTION_ID