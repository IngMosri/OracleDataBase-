CREATE OR REPLACE PROCEDURE p_sal_increase
                                        (
                                        p_dept      IN deparments.deparments_ud%TYPE,
                                        P_job       IN jobs.jobs_id%TYPE,
                                        P_por_incr  IN NUMBER
                                        )   AUTHID CURRECT_USER IS
v_por_increase NUMBER (3,2);
v_dept_job CHAR(1);

CURSOR c_dept_job IS
SELECT 'A'
FROM employees
WHERE deparments_id = p_dept
AND job_id = p_job;

BEGIN
    v_por_increase := p_por_incr/100;
    
    IF  v_por_increase > 2 THEN
    RAISE_APPLICATION_ERROR(-2001, ' El aumneto n puede ser mayor del 200%');
    
END IF;

OPEN c_dept_job;
FETCH c_dept_job INTO v_dept_job;
CLOSE c_dept_job;

IF v_dept_job IS NOT NULL THEN 
UPDATE employees
SET salary = salary+(salart*v_por_increase)
WHERE deparment_id = p_dept
AND job_id= p_job;

ELSE 
 RAISE_APPLICATION_ERRO('-2002 'Departamento o ti´p de empleo invalido, Favor Validar la informacion.');
 END IF;
 
 END:
 /
 SHOW ERROR 
    