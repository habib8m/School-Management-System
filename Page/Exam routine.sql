
--Inset, update and delete exam routine--

begin  
     case :APEX$ROW_STATUS  
     when 'C' then   
         insert into EXAMS_D (EXAM_M_ID, EXAM_DATE, SLOT_ID, SUBJECT_ID, EXAMINER_ID)
         values (:P71_EXAM_M_ID, :EXAM_DATE, :SLOT_ID, :SUBJECT_ID, :EXAMINER_ID);  
     when 'U' then  
         update EXAMS_D  
            set EXAM_M_ID  = :EXAM_M_ID, EXAM_DATE = :EXAM_DATE, SLOT_ID = :SLOT_ID, SUBJECT_ID = :SUBJECT_ID, EXAMINER_ID = :EXAMINER_ID
            where EXAM_D_ID = :EXAM_D_ID and EXAM_M_ID = :EXAM_M_ID;  
     when 'D' then  
         delete EXAMS_D 
         where EXAM_D_ID = :EXAM_D_ID and EXAM_M_ID = :P71_EXAM_M_ID;  
     end case;  
end;  
