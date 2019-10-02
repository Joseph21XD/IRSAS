LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS/Insercion-nuevos-datos/Asadas.csv' INTO TABLE ASADA
  FIELDS TERMINATED BY ','
  OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n' IGNORE 1 rows;

LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS/Insercion-nuevos-datos/AsadasInfo.csv' INTO TABLE ASADAINFO
  FIELDS TERMINATED BY ','
  OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n' IGNORE 1 rows (Asada_ID, Ubicacion, Telefono, Poblacion, Url,cantAbonados);

LOAD DATA LOCAL INFILE '/run/media/eduardo/Datos/Otros/Asistencia_proyecto/IRSAS/Insercion-nuevos-datos/INDICADORXASADA.csv' INTO TABLE INDICADORXASADA
  FIELDS TERMINATED BY ','
  OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n' IGNORE 1 rows (Año,Indicador_id,Asada_id,Valor,Texto);