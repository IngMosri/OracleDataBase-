SELECT ROUND (45.923,2), ROUND(45923,0)
FROM DUAL;

SELECT TRUNC (45.923,2), TRUNC(45923,0)
FROM SYS.DUAL;

SELECT first_name, salary, comission_pct *
1000, MOD(salary,(comission_pct *1000))
FROM employees
WHERE job_id = 'SA_NAM';

SELECT SQRT(100), SQRT(45.8)
FROM SYS.DUAL;


select SYSDATE from DUAL;



select SYSTIMESTAMP  from DUAL;


SELECT ADD_MONTHS ('13/09/20')
from DUAL;

select LAST_DAY('13/09/20')
from DUAL;


SELECT TO_CHAR(SYSDATE,'dd/month/yyyy')
FROM DUAL;


SELECT TO NUMBER('12.7)
FROM DUAL;

SELECT TO_DATE(14/JAN/2020','DD/MON/yyyy')
FROM DUAL; 


