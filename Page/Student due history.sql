
select L.STUDENT_ID, S.FIRST_NAME||' '||S.LAST_NAME STUDENT_NAME, L.LEDGER_DATE, L.TOTAL, NVL(L.WAIVER, 0) WAIVER, L.PAID, NVL(L.DUE, 0) DUE
from STU_DUE_LEDGER L, STUDENTS S
WHERE S.STUDENT_ID = L.STUDENT_ID