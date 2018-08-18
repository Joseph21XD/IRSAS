

CREATE TABLE CANTON
  (
    ID           INTEGER NOT NULL ,
    Nombre       VARCHAR (20) ,
    PROVINCIA_ID INTEGER NOT NULL
  ) ;
ALTER TABLE CANTON ADD CONSTRAINT CANTON_PK PRIMARY KEY ( ID, PROVINCIA_ID ) ;


CREATE TABLE Componente
  ( ID INTEGER NOT NULL AUTO_INCREMENT , Nombre VARCHAR (50), PRIMARY KEY ( ID )
  ) ;


CREATE TABLE DISTRITO
  (
    ID                  INTEGER NOT NULL ,
    Nombre              VARCHAR (50) ,
    CANTON_ID           INTEGER NOT NULL ,
    CANTON_PROVINCIA_ID INTEGER NOT NULL,
    PRIMARY KEY ( ID, CANTON_ID, CANTON_PROVINCIA_ID )
  ) ;


CREATE TABLE Medida
  ( ID INTEGER NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR (50), PRIMARY KEY ( ID ) 
  ) ;


CREATE TABLE PROVINCIA
  ( ID INTEGER NOT NULL , Nombre VARCHAR (10), PRIMARY KEY ( ID )
  ) ;
 


CREATE TABLE Subcomponente
  (
    ID            INTEGER NOT NULL AUTO_INCREMENT,
    Nombre        VARCHAR (50) ,
    Componente_ID INTEGER NOT NULL ,
    Medida_ID     INTEGER NOT NULL, PRIMARY KEY ( ID )
  ) ;



CREATE TABLE SubcomponenteXAsada
  (
    ID                           INTEGER NOT NULL AUTO_INCREMENT,
    Año                          DATE ,
    DISTRITO_ID                  INTEGER NOT NULL ,
    DISTRITO_CANTON_ID           INTEGER NOT NULL ,
    DISTRITO_CANTON_PROVINCIA_ID INTEGER NOT NULL ,
    Subcomponente_ID             INTEGER NOT NULL,
    PRIMARY KEY ( ID )
  ) ;


ALTER TABLE SubcomponenteXAsada ADD CONSTRAINT ASADA_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID, DISTRITO_CANTON_ID, DISTRITO_CANTON_PROVINCIA_ID ) REFERENCES DISTRITO ( ID, CANTON_ID, CANTON_PROVINCIA_ID ) ON
DELETE CASCADE;

ALTER TABLE CANTON ADD CONSTRAINT CANTON_PROVINCIA_FK FOREIGN KEY ( PROVINCIA_ID ) REFERENCES PROVINCIA ( ID ) ON
DELETE CASCADE;

ALTER TABLE SubcomponenteXAsada ADD CONSTRAINT COMPONENTE_ASADA_FK FOREIGN KEY ( Subcomponente_ID ) REFERENCES Subcomponente ( ID ) ON
DELETE CASCADE;

ALTER TABLE DISTRITO ADD CONSTRAINT DISTRITO_CANTON_FK FOREIGN KEY ( CANTON_ID, CANTON_PROVINCIA_ID ) REFERENCES CANTON ( ID, PROVINCIA_ID ) ON
DELETE CASCADE;

ALTER TABLE Subcomponente ADD CONSTRAINT Subcomponente_Componente_FK FOREIGN KEY ( Componente_ID ) REFERENCES Componente ( ID ) ON
DELETE CASCADE;

ALTER TABLE Subcomponente ADD CONSTRAINT Subcomponente_Medida_FK FOREIGN KEY ( Medida_ID ) REFERENCES Medida ( ID ) ON
DELETE CASCADE;

















use proyecto_asada;
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Provincias.csv' INTO TABLE provincia
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;

LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Cantones.csv' INTO TABLE canton
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Distritos.csv' INTO TABLE distrito
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Medidas.csv' INTO TABLE medida
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (nombre);



select * from provincia;
select * from canton C;
select * from distrito D; 
select * from medida M;


delete from distrito where id>=0;
delete from canton where id>=0;
delete from provincia where id>=0;
delete from medida where id>=0;

