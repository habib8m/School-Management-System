
--Class routine--

SELECT RM.ROUTINE_M_ID, C.CLASS_NAME, S.SECTION_NAME, DW.DAY, R.ROOM_NUMBER
FROM ROUTINE_MASTER RM, CLASS C, SECTIONS S, DAY_OF_WEEK DW, CLASSROOMS R
WHERE RM.CLASS_ID = C.CLASS_ID
AND RM.SECTION_ID = S.SECTION_ID
AND DW.DAY_ID = RM.DAY_ID
AND R.CLASSROOM_ID = RM.CLASSROOM_ID
ORDER BY C.CLASS_ID, S.SECTION_ID, DW.DAY_ID


--Insert update and delete class routine--

begin  
     case :APEX$ROW_STATUS  
     when 'C' then   
         insert into ROUTINE_DETAIL (ROUTINE_M_ID, SLOT_ID, SUBJECT_ID, TEACHER_ID)
         values (:P76_ROUTINE_M_ID, :SLOT_ID, :SUBJECT_ID, :TEACHER_ID);  
     when 'U' then  
         update ROUTINE_DETAIL  
            set ROUTINE_M_ID  = :ROUTINE_M_ID, SLOT_ID = :SLOT_ID, SUBJECT_ID = :SUBJECT_ID, TEACHER_ID = :TEACHER_ID
            where ROUTINE_D_ID = :ROUTINE_D_ID and ROUTINE_M_ID = :ROUTINE_M_ID;  
     when 'D' then  
         delete ROUTINE_DETAIL 
         where ROUTINE_D_ID = :ROUTINE_D_ID and ROUTINE_M_ID = :P76_ROUTINE_M_ID;  
     end case;  
end;  
