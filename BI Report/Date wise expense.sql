
--Print expense for a specific date--

SELECT EM.TOTAL_AMOUNT, EM.EXP_DATE, EC.CATAGORY_NAME, ED.AMOUNT
FROM EXP_MASTER EM, EXP_CATAGORY EC, EXP_DETAIL ED
WHERE EM.EXP_ID = ED.EXP_ID
AND EC.CATAGORY_ID = ED.CATAGORY_ID
AND EM.EXP_DATE BETWEEN to_date(:P205_FROM_DATE, 'DD-MM-YYYY') AND to_date(:P205_TO_DATE, 'DD-MM-YYYY')
