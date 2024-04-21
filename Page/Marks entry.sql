
--Marks detail page--

SELECT rownum as id, S.STUDENT_ID, S.FIRST_NAME||' '||S.LAST_NAME NAME, null marks, null grade, null grade_point, null status
FROM STUDENTS S, ADMISSION A, sections sc
WHERE S.STUDENT_ID = A.STUDENT_ID 
and a.section_id = sc.section_id
and sc.section_id = :P210_SECTION_ID
AND S.STUDENT_ID in (SELECT STUDENT_ID FROM ADMISSION
                    WHERE CLASS_ID = :P210_CLASS_ID);


--Marks wise grade--

declare
v_grade varchar2(10);

begin
for i in (select :marks as marks from dual) loop

		if i.marks >= 80 then
			v_grade := 'A+';

		elsif i.marks >= 70 then
			v_grade := 'A';

		elsif i.marks >= 60 then
			v_grade := 'A-';

		elsif i.marks >= 50 then
			v_grade := 'B';

		elsif i.marks >= 40 then
			v_grade := 'C';

		elsif i.marks >= 33 then
			v_grade := 'D';

		elsif i.marks <= 32 then
			v_grade := 'F';

		end if;		
end loop;

return v_grade;
end;




--Grade wise point--

declare
v_grade_point number;

begin
for i in (select :grade as grade from dual) loop

		if i.grade = 'A+' then
			v_grade_point := 5;

		elsif i.grade = 'A' then
			v_grade_point := 4;

        elsif i.grade = 'A-' then
			v_grade_point := 3.5;

		elsif i.grade = 'B' then
			v_grade_point := 3;

		elsif i.grade = 'C' then
			v_grade_point := 2;

		elsif i.grade = 'D' then
			v_grade_point := 1;

		elsif i.grade = 'F' then
			v_grade_point := 0;

		end if;		
end loop;

return v_grade_point;

end;




--Point wise status--

declare
v_status varchar2 (20);

begin
for i in (select :grade_point as grade_point from dual) loop

		if i.grade_point = 5 then
			v_status := 'Pass';

		elsif i.grade_point = 4 then
			v_status := 'Pass';

        elsif i.grade_point = 3.5 then
			v_status := 'Pass';

		elsif i.grade_point = 3 then
			v_status := 'Pass';

		elsif i.grade_point = 2 then
			v_status := 'Pass';

		elsif i.grade_point = 1 then
			v_status := 'Pass';

		elsif i.grade_point = 0 then
			v_status :='Fail';

		end if;		
end loop;

return v_status;

end;


-- Class and section wise student by for loop--

begin
	for j in (select :STUDENT_ID as STUDENT_ID, :MARKS AS MARKS, :GRADE AS GRADE, :GRADE_POINT AS GRADE_POINT, :STATUS as STATUS from dual) loop
                insert into MARKS_LIST_D (STUDENT_ID, MARKS, GRADE, GRADE_POINT, STATUS, MARKS_LIST_M_ID)
		values (j.STUDENT_ID, J.MARKS, J.GRADE, J.GRADE_POINT, J.STATUS, :P210_MARKS_LIST_M_ID);
	end loop;
end;
