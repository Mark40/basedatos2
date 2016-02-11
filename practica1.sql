CREATE table PELICULA (ID_PELICULA INTEGER , 
    TITULO varchar2 (120), 
    SINOPSIS varchar2(120),
    CLASIFICACION varchar2(5),
    constraint PK_ID_PELICULA primary key (ID_PELICULA)
    );
    
    DESCRIBE PELICULA;
    
    CREATE TABLE HORARIOS (ID_HORARIO INTEGER,
     ID_PELICULA INTEGER,
     HORARIO VARCHAR2(8),
     CONSTRAINT PK_ID_HORARIO PRIMARY KEY(ID_HORARIO),
     CONSTRAINT FK1_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA)
     );
    describe HORARIOS;
    
    CREATE TABLE SALA (ID_SALA integer,
    ID_PELICULA INTEGER,
    NUM_SALA varchar2 (8),
    constraint PK_ID_SALA primary key (ID_SALA),
    constraint FK2_ID_PELICULA FOREIGN KEY  (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA)
    );
    
     CREATE sequence SEC_PELICULA
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
    
    
    ---PROCEDIMINETO ALMACENADOS, ESTRUCTURA CURSOR----
    --PROCEDIMIENTO ALMACENADO  ES UN OBJETO DE BASE DE DATOS MUY POTENTE POR QUE ENCAPSULA LOGICA DE PROGRAMACION DE BASE DE DATOS Y UNA VEZ GENERADO EL PROCEDIMINETO PUEDE SER INVOCADO POR CUALQUIER
    --LENGUAJE EXTERNO POR EJEMPLO: JAVA, C++, PHP, C, RUBY PYTON. (ES COMO UNA FUNCION)..  STORED PROCEDURE
    
    SET SERVEROUTPUT ON;
    
    -- (OR REPPLACE) PERMITE RECOMPILARLO YA QUE SE COMPILO POR PRIMERA VEZ--
    CREATE OR REPLACE PROCEDURE HOLA_MUNDO( NOMBRE  IN VARCHAR2)
    --DECLARACION DE VARIABLES LOCALES
    AS
    --CUERPO DE BEGIN LOGICA
    BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA COM ESTAS'||NOMBRE);
    END;
    /
    
    BEGIN
    HOLA_MUNDO('JUAN CARLOS');
    END;
    /
    
    DECLARE
    --OTORGA LA SALIDA
    VALOR number;
    --PROCEDIMIENTO
    BEGIN
    SUMA(12,8.5,VALOR);
    DBMS_OUTPUT.PUT_LINE('LA SUMA ES: ' ||VALOR);
    END;
    /
    
    ---STORED PROCEDURE= CURSORES = UN CURSOR ES "CUALQUIER SETENCIA SQL" LO DISTINITO ES ESTO:, CHECAR CADA UNO DE MIS CAMPOS QUE ES LO QUE ESTA HACIENDO TRABAJANDO. SELECT PERSONALIZADO, BARRIENDO LINEA OR LINEA, ES UN OBSERVADOR "MITITULO INTO" SETENCIA CONVENCIONAL
    --SELECT * FROM PELICULA;
    --SELECT MITITULO INTO TITULO FROM PELICULA;
    
    
    
    
    

    
    
    
    
    secuencias-------------------------------------------------------------------------------------------------
    
    CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA 
(
  MY_ID_PELICULA OUT NUMBER  
, MY_TITULO IN VARCHAR2  
, MY_SINOPSIS IN VARCHAR2  
, MY_CLASIFICACION IN VARCHAR2  
) AS

BEGIN
  SELECT SEC_PELICULA.NEXTVAL INTO MY_ID_PELICULA FROM DUAL;
  --DUAL UNA TALBA VIRTUAL
  INSERT INTO PELICULA VALUES(MY_ID_PELICULA, MY_TITULO, MY_SINOPSIS, MY_CLASIFICACION);
  
END GUARDAR_PELICULA;

--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE SUMA 
(
  PRIMERO IN NUMBER  
, SEGUNDO IN NUMBER  
, RESULTADO OUT NUMBER  
) AS 
BEGIN
RESULTADO:=PRIMERO+SEGUNDO;
END SUMA;
-------------------------------------------------------------------------------

create or replace 
PROCEDURE HOLA_MUNDO( NOMBRE  IN VARCHAR2)
    --DECLARACION DE VARIABLES LOCALES
    AS
    --CUERPO DE BEGIN LOGICA
    BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA COM ESTAS'||NOMBRE);
    END;
    
    ------------------------------------------------------------------------------------------------------
    
    CREATE table PELICULA (ID_PELICULA INTEGER, 
    TITULO varchar2 (120), 
    SINOPSIS varchar2(120),
    CLASIFICACION varchar2(5),
    constraint PK_ID_PELICULA primary key (ID_PELICULA)
    );
    
  
----------------------------------------------------------------------------------------------------    
   CREATE sequence SEC_PELICULA
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
  -------------------------------------------------------------------------------------------------
    
    CREATE OR REPLACE PROCEDURE GUARDAR_PELICULA 
(
  MY_ID_PELICULA OUT NUMBER  
, MY_TITULO IN VARCHAR2  
, MY_SINOPSIS IN VARCHAR2  
, MY_CLASIFICACION IN VARCHAR2  
) AS

BEGIN
  SELECT SEC_PELICULA.NEXTVAL INTO MY_ID_PELICULA FROM DUAL;
  --DUAL UNA TALBA VIRTUAL
  INSERT INTO PELICULA VALUES(MY_ID_PELICULA, MY_TITULO, MY_SINOPSIS, MY_CLASIFICACION);
  
END GUARDAR_PELICULA;
/
-------------------------------------------------------------------------------------------------------------


DECLARE 
VALOR INTEGER;
begin
GUARDAR_PELICULA(VALOR,'EL RENACIDO','MASO O MENOS','B15');
END;
/

 select * from pelicula;
--Cursores hay de dos tipos:
--Ocurrencia unica

create table simple1 (id_simple integer, edad integer, nombre varchar(40));

-- La llenamos con informacion rápida 

declare 

mi_nombre varchar2(40);
begin
select nombre into mi_nombre from simple1 where edad=21;
dbms_output.put_line(mi_nombre);
end;
/






mi_edad integer;

begin
mi_edad:=22;

for i in 1..20 loop
mi_edad:=mi_edad+i;
insert into simple1 values (i,mi_edad, 'Marcos');
end loop;
end;
/

select * from simple1;

--Cursor simple de una sola ocurrencia
--Crear un cursor que busque el id que valga 21 y sustituir
--el nombre por el tuyo


update simple1 set nombre='xxx' where edad=22;

select *from simple1;


set serveroutput on; 
declare
mi_nombre varchar2 (40);

begin

select nombre into mi_nombre from simple1 where edad=21;
dbms_output.put_line(mi_nombre);
end;
/

delete from simple1;

insert into simple1 values(1,21,'MARCOS  ');
insert into simple1 values(2,23,'Ana');
insert into simple1 values(3,28,'Pedro');


























JKASDFJLKSDFG


--Cursores hay de dos tipos:
--Ocurrencia unica

create table simple1 (id_simple integer, edad integer, nombre varchar(40));

-- La llenamos con informacion rápida 

declare 

mi_nombre varchar2(40);
begin
select nombre into mi_nombre from simple1 where edad=21;
dbms_output.put_line(mi_nombre);
end;
/






mi_edad integer;

begin
mi_edad:=22;

for i in 1..20 loop
mi_edad:=mi_edad+i;
insert into simple1 values (i,mi_edad, 'Marcos');
end loop;
end;
/

select * from simple1;

--Cursor simple de una sola ocurrencia
--Crear un cursor que busque el id que valga 21 y sustituir
--el nombre por el tuyo


update simple1 set nombre='xxx' where edad=22;

select *from simple1;


set serveroutput on; 
declare
mi_nombre varchar2 (40);

begin

select nombre into mi_nombre from simple1 where edad=21;
dbms_output.put_line(mi_nombre);
end;
/

delete from simple1;

insert into simple1 values(1,21,'MARCOS  ');
insert into simple1 values(2,23,'Ana');
insert into simple1 values(3,28,'Pedro');






    
    
    ***************************************
    ***************************************
    ***************************************
    
    
    
    
declare
  cursor cur_paises is select * from paises;

total_habitantes integer;
begin
total_habitantes:=0;
for fila in cur_paises loop
total_habitantes:=total_habitantes+fila.habitantes;
dbms_output.put_line('Nombre: '||fila.nombre||' Habitantes: ' ||fila.habitantes);
end loop;
dbms_output.put_line('Habitantes de todos los paises: '||total_habitantes);

end;


***************
***************
***************



create table estudiante (id_estudiante integer,
                         id_pais varchar2(4),
                         carrera varchar2(30),
                         edad integer,
                         constraint pk_id_estudiante primary key(id_estudiante),
                         constraint fk1_id_pais foreign key(id_pais) references paises(id_pais));


describe estudiante;

insert into estudiante values (1, 'mx', 'Sistemas ',20);
insert into estudiante values (2, 'usa', 'Diseño ',22);
insert into estudiante values (3, 'mx', 'Arquitectura ',20);
insert into estudiante values (4, 'mx', 'Economia ',19);
insert into estudiante values (5, 'jpa', 'Derecho ',21);
insert into estudiante values (6, 'ger', 'Salud ',20);
insert into estudiante values (7, 'bra', 'Sistemas ',23);

select *from estudiante;
    
