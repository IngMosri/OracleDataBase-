
    
    CREATE OR REPLACE TRIGGER  PesoValido BEFORE INSERT OR UPDATE ON PARTES
FOR EACH ROW
BEGIN
    CASE
        WHEN INSERTING THEN
            IF(:NEW.COLOR='ROJO') THEN
                IF (:NEW.PESO<25)THEN
                    RAISE_APPLICATION_ERROR(-20000,'Error en el peso'); 
                END IF;
            END IF;    
        WHEN UPDATING('PESO') THEN
            IF(:OLD.COLOR='ROJO') THEN
                IF (:NEW.PESO<25) THEN
                    RAISE_APPLICATION_ERROR(-20000,'Error en el peso');
                END IF;
            END IF;
        WHEN UPDATING('COLOR') THEN
            IF(:NEW.COLOR='ROJO') THEN
                IF(:OLD.PESO<25)THEN
                    RAISE_APPLICATION_ERROR(-20000,'Error en el peso');
                END IF;
            END IF;
    END CASE;
END;
    
    