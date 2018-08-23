USE PROYECTO_ASADA;

CREATE TABLE ASADA
  (
    Codigo                       INTEGER NOT NULL ,
    Nombre                       VARCHAR (150) ,
    DISTRITO_ID                  INTEGER NOT NULL ,
    DISTRITO_CANTON_ID           INTEGER NOT NULL ,
    DISTRITO_CANTON_PROVINCIA_ID INTEGER NOT NULL
  ) ;
ALTER TABLE Asada ADD CONSTRAINT Asada_PK PRIMARY KEY ( Codigo ) ;


CREATE TABLE CANTON
  (
    ID           INTEGER NOT NULL ,
    Nombre       VARCHAR (20) ,
    PROVINCIA_ID INTEGER NOT NULL
  ) ;
ALTER TABLE CANTON ADD CONSTRAINT CANTON_PK PRIMARY KEY ( ID, PROVINCIA_ID ) ;


CREATE TABLE COMPONENTE
  ( ID INTEGER NOT NULL , Nombre VARCHAR (50)
  ) ;
ALTER TABLE Componente ADD CONSTRAINT Componente_PK PRIMARY KEY ( ID ) ;


CREATE TABLE DISTRITO
  (
    ID                  INTEGER NOT NULL ,
    Nombre              VARCHAR (50) ,
    CANTON_ID           INTEGER NOT NULL ,
    CANTON_PROVINCIA_ID INTEGER NOT NULL
  ) ;
ALTER TABLE DISTRITO ADD CONSTRAINT DISTRITO_PK PRIMARY KEY ( ID, CANTON_ID, CANTON_PROVINCIA_ID ) ;


CREATE TABLE MEDIDA
  ( ID INTEGER NOT NULL AUTO_INCREMENT, Nombre VARCHAR (50), PRIMARY KEY ( ID )
  ) ;


CREATE TABLE PROVINCIA
  ( ID INTEGER NOT NULL , Nombre VARCHAR (10)
  ) ;
ALTER TABLE PROVINCIA ADD CONSTRAINT PROVINCIA_PK PRIMARY KEY ( ID ) ;


CREATE TABLE SUBCOMPONENTE
  (
    ID            INTEGER NOT NULL ,
    Nombre        VARCHAR (50) ,
    Componente_ID INTEGER NOT NULL ,
    Medida_ID     INTEGER NOT NULL
  ) ;
ALTER TABLE Subcomponente ADD CONSTRAINT Subcomponente_PK PRIMARY KEY ( ID ) ;


CREATE TABLE SUBCOMPONENTEXASADA
  (
    ID               INTEGER NOT NULL AUTO_INCREMENT,
    Año              DATE ,
    Subcomponente_ID INTEGER NOT NULL ,
    Asada_Codigo     INTEGER NOT NULL,
    valor			 INTEGER NOT NULL,
    PRIMARY KEY ( ID )
  ) ;

ALTER TABLE Asada ADD CONSTRAINT Asada_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID, DISTRITO_CANTON_ID, DISTRITO_CANTON_PROVINCIA_ID ) REFERENCES DISTRITO ( ID, CANTON_ID, CANTON_PROVINCIA_ID ) ;

ALTER TABLE CANTON ADD CONSTRAINT CANTON_PROVINCIA_FK FOREIGN KEY ( PROVINCIA_ID ) REFERENCES PROVINCIA ( ID ) ON
DELETE CASCADE ;

ALTER TABLE SubcomponenteXAsada ADD CONSTRAINT COMPONENTE_ASADA_FK FOREIGN KEY ( Subcomponente_ID ) REFERENCES Subcomponente ( ID ) ON
DELETE CASCADE ;

ALTER TABLE DISTRITO ADD CONSTRAINT DISTRITO_CANTON_FK FOREIGN KEY ( CANTON_ID, CANTON_PROVINCIA_ID ) REFERENCES CANTON ( ID, PROVINCIA_ID ) ON
DELETE CASCADE ;

ALTER TABLE SubcomponenteXAsada ADD CONSTRAINT SubcomponenteXAsada_FK FOREIGN KEY ( Asada_Codigo ) REFERENCES Asada ( Codigo ) ;

ALTER TABLE Subcomponente ADD CONSTRAINT Subcomponente_Componente_FK FOREIGN KEY ( Componente_ID ) REFERENCES Componente ( ID ) ON
DELETE CASCADE ;

ALTER TABLE Subcomponente ADD CONSTRAINT Subcomponente_Medida_FK FOREIGN KEY ( Medida_ID ) REFERENCES Medida ( ID ) ON
DELETE CASCADE ;
















use proyecto_asada;
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Provincias.csv' INTO TABLE provincia
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;

LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Cantones.csv' INTO TABLE canton
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Distritos.csv' INTO TABLE distrito
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Medidas.csv' INTO TABLE medida
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (nombre);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Asadas.csv' INTO TABLE asada
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Componentes.csv' INTO TABLE componente
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Subcomponentes.csv' INTO TABLE subcomponente
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;





select * from provincia;
select * from canton C;
select * from distrito D; 
select * from medida M;
select * from componente C;
select C.Nombre,S.Nombre,M.nombre from subcomponente S inner join Medida M on M.id=S.Medida_ID inner join componente C on C.ID=S.Componente_ID; 
select * from subcomponentexasada;

select A.nombre,D.nombre from Asada A 
inner join distrito D on A.Distrito_ID= D.ID and A.distrito_Canton_ID = D.CANTON_ID 
and A.distrito_canton_provincia_ID = D.CANTON_PROVINCIA_ID order by 2 desc;


delete from distrito where id>=0;
delete from canton where id>=0;
delete from provincia where id>=0;
delete from medida where id>=0;
