select * from locations;

Select SUBSTR('Prueba',2,3)
FROM DUAL;

SELECT LENGTH('hola') 
FROM DUAL;

SELECT LPAD('hola',10, '-'),
        RPAD('hola',10,'-')
FROM DUAL;

SELECT TRANSLATE('prueba','ue','wx')
FROM DUAL;