CREATE OR REPLACE Trigger RESESION_AI
    After insert on rsesion for each row
    
begin
    insert into tsesion
    values(:new.sesi_usua, :new.sesi_ip, :new.sesi_desde);
    end;
    
    
create table tsesion
(
sesi_usua varchar(25),
sesi_ip varchar(25),
sesi_desde varchar(25)
);

create table rsesion
(
sesi_usua varchar(25),
sesi_ip varchar(25),
sesi_desde varchar(25)
);
