-- Create table
create table RH_USUA_TRC
(
  RH_USUA_ID         NUMBER not null,
  RH_USUA_CODIGO     VARCHAR2(15) not null,
  RH_USUA_NOMBRE     VARCHAR2(100) not null,
  RH_USUA_APEPAT     VARCHAR2(100) not null,
  RH_USUA_APEMAT     VARCHAR2(100) not null,
  RH_USUA_DOMICILIO  VARCHAR2(100) not null,
  RH_USUA_COLONIA    VARCHAR2(100) not null,
  RH_USUA_MUNICIPIO  VARCHAR2(30) not null,
  RH_USUA_ESTADO     VARCHAR2(30) not null,
  RH_USUA_TELEFONO   VARCHAR2(30) not null,
  RH_USUA_APTITUD    VARCHAR2(300) not null,
  RH_USUA_HABILIDAD  VARCHAR2(300) not null,
  RH_USUA_TRABAJA    VARCHAR2(1) not null,
  RH_USUA_EMPRESA    VARCHAR2(100),
  RH_USUA_TELEFTRAB  VARCHAR2(30),
  RH_USUA_USUARIO_FK NUMBER not null,
  RH_USUA_EMAIL      VARCHAR2(100) not null,
  RH_USUA_PAIS       VARCHAR2(30),
  RH_USUA_CP         VARCHAR2(10),
  RH_USUA_FECNAC     DATE,
  RH_USUA_CURP       VARCHAR2(20),
  RH_USUA_GENERO     VARCHAR2(1),
  RH_USUA_MOVIP      VARCHAR2(20),
  RH_USUA_MOVFECH    DATE,
  RH_USUA_MOVUSER    VARCHAR2(20),
  RH_USUA_TIPMOV     VARCHAR2(20)
);


-------------Second Table--------------------
create table RH_USUA
(
  RH_USUA_CODIGO     VARCHAR2(15) not null,
  RH_USUA_NOMBRE     VARCHAR2(100) not null,
  RH_USUA_APEPAT     VARCHAR2(100) not null,
  RH_USUA_APEMAT     VARCHAR2(100) not null,
  RH_USUA_DOMICILIO  VARCHAR2(100) not null,
  RH_USUA_COLONIA    VARCHAR2(100) not null,
  RH_USUA_MUNICIPIO  VARCHAR2(30) not null,
  RH_USUA_ESTADO     VARCHAR2(30) not null,
  RH_USUA_TELEFONO   VARCHAR2(30) not null,
  RH_USUA_APTITUD    VARCHAR2(300) not null,
  RH_USUA_HABILIDAD  VARCHAR2(300) not null,
  RH_USUA_TRABAJA    VARCHAR2(1) not null,
  RH_USUA_EMPRESA    VARCHAR2(100),
  RH_USUA_TELEFTRAB  VARCHAR2(30),
  RH_USUA_USUARIO_FK NUMBER not null,
  RH_USUA_EMAIL      VARCHAR2(100) not null,
  RH_USUA_PAIS       VARCHAR2(30),
  RH_USUA_CP         VARCHAR2(10),
  RH_USUA_FECNAC     DATE,
  RH_USUA_CURP       VARCHAR2(20),
  RH_USUA_GENERO     VARCHAR2(1),
  RH_USUA_MOVIP      VARCHAR2(20),
  RH_USUA_MOVFECH    DATE,
  RH_USUA_MOVUSER    VARCHAR2(20),
  RH_USUA_TIPMOV     VARCHAR2(20)
);



-------------------CREATE TRIGGER -----------------------



CREATE OR REPLACE TRIGGER RH_USUA_track

AFTER INSERT OR UPDATE OR DELETE ON RH_USUA FOR EACH ROW

DECLARE
tipoMovimiento varchar2(6);

BEGIN
    IF INSERTING  THEN
      tipoMovimiento := 'INSERT';
    ELSIF UPDATING THEN
      tipoMovimiento := 'UPDATE';
    ELSIF DELETING THEN
      tipoMovimiento := 'DELETE';
    END IF;

    IF INSERTING THEN
      INSERT INTO RH_USUA_trc
      ( RH_USUA_id,
        RH_USUA_codigo,
        RH_USUA_nombre,
        RH_USUA_apepat,
        RH_USUA_apemat,
        RH_USUA_domicilio,
        RH_USUA_colonia,
        RH_USUA_municipio,
        RH_USUA_estado,
        RH_USUA_telefono,
        RH_USUA_aptitud,
        RH_USUA_habilidad,
        RH_USUA_trabaja,
        RH_USUA_empresa,
        RH_USUA_teleftrab,
        RH_USUA_usuario_fk,
        RH_USUA_email,
        RH_USUA_pais,
        RH_USUA_cp,
        RH_USUA_fecnac,
        RH_USUA_curp,
        RH_USUA_genero, 
        RH_USUA_movip,
        RH_USUA_movfech,
        RH_USUA_movuser,
        RH_USUA_tipmov)
    values
      ( :new.RH_USUA_id,
        :new.RH_USUA_codigo,
        :new.RH_USUA_nombre,
        :new.RH_USUA_apepat,
        :new.RH_USUA_apemat,
        :new.RH_USUA_domicilio,
        :new.RH_USUA_colonia,
        :new.RH_USUA_municipio,
        :new.RH_USUA_estado,
        :new.RH_USUA_telefono,
        :new.RH_USUA_aptitud,
        :new.RH_USUA_habilidad,
        :new.RH_USUA_trabaja,
        :new.RH_USUA_empresa,
        :new.RH_USUA_teleftrab,
        :new.RH_USUA_usuario_fk,
        :new.RH_USUA_email,
        :new.RH_USUA_pais,
        :new.RH_USUA_cp,
        :new.RH_USUA_fecnac,
        :new.RH_USUA_curp,
        :new.RH_USUA_genero, 
        sys_context('userenv','ip_address'),
        sysdate, user,
        tipoMovimiento);

  
    ELSIF DELETING OR UPDATING THEN
      INSERT INTO  RH_USUA_trc
      (
        RH_USUA_codigo,
        RH_USUA_nombre,
        RH_USUA_apepat,
        RH_USUA_apemat,
        RH_USUA_domicilio,
        RH_USUA_colonia,
        RH_USUA_municipio,
        RH_USUA_estado,
        RH_USUA_telefono,
        RH_USUA_aptitud,
        RH_USUA_habilidad,
        RH_USUA_trabaja,
        RH_USUA_empresa,
        RH_USUA_teleftrab,
        RH_USUA_usuario_fk,
        RH_USUA_email,
        RH_USUA_pais,
        RH_USUA_cp,
        RH_USUA_fecnac,
        RH_USUA_curp,
        RH_USUA_genero, 
        RH_USUA_movip,
        RH_USUA_movfech,
        RH_USUA_movuser,
        RH_USUA_tipmov)
    values
     (  :old.RH_USUA_id,
        :old.RH_USUA_codigo,
        :old.RH_USUA_nombre,
        :old.RH_USUA_apepat,
        :old.RH_USUA_apemat,
        :old.RH_USUA_domicilio,
        :old.RH_USUA_colonia,
        :old.RH_USUA_municipio,
        :old.RH_USUA_estado,
        :old.RH_USUA_telefono,
        :old.RH_USUA_aptitud,
        :old.RH_USUA_habilidad,
        :old.RH_USUA_trabaja,
        :old.RH_USUA_empresa,
        :old.RH_USUA_teleftrab,
        :old.RH_USUA_usuario_fk,
        :old.RH_USUA_email,
        :old.RH_USUA_pais,
        :old.RH_USUA_cp,
        :old.RH_USUA_fecnac,
        :old.RH_USUA_curp,
        :old.RH_USUA_genero, 
        sys_context('userenv','ip_address'),
        sysdate, user,
        tipoMovimiento);
    END IF;
end;
--------- insert value------------------------

insert into RH_USUA VALUES(1 , 'B ' ,'C ' ,'D ' ,'E ' ,' F' ,' G' ,'H ' ,'I ' ,' J' ,
'O ' ,' M' ,' N' , 'O ' , 'P ' , ' Q' ,' R', 'T ', ' U',' A' , 'RR ' ,' QQ' , 'RR' , SYSDATE , 'aa', ' aa');
