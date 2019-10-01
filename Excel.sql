
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Provincias.csv' INTO TABLE PROVINCIA
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;

LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Cantones.csv' INTO TABLE CANTON
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Distritos.csv' INTO TABLE DISTRITO
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Medidas.csv' INTO TABLE MEDIDA
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Asadas.csv' INTO TABLE ASADA
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Componentes.csv' INTO TABLE COMPONENTE
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre, Valor);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Subcomponentes.csv' INTO TABLE SUBCOMPONENTE
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre, Valor, Componente_ID, CantPreguntas, Siglas);
  
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Indicadores.csv' INTO TABLE INDICADOR
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Codigo, Subcomponente_ID, Medida_ID, Nombre,Valor);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/IndicadoresInfo.csv' INTO TABLE INDICADORINFO
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Descripcion,Formula,Fuente,Url,Responsable,Periodo,Observaciones,Frecuencia);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Nominales.csv' INTO TABLE NOMINAL
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Simbolo,Porcentaje,Valor);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/Lineales.csv' INTO TABLE LINEAL
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Pendiente,Ordenada);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/FillDat.csv' INTO TABLE INDICADORXASADA
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Año,Indicador_id,Asada_id,Valor,Texto);
  
LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS//Datos/AsadasInfo.csv' INTO TABLE ASADAINFO
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Asada_ID, Ubicacion, Telefono, Poblacion, Url,cantAbonados);
  