
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
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Asadas.csv' INTO TABLE asada
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows;
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Componentes.csv' INTO TABLE componente
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre, Valor);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Subcomponentes.csv' INTO TABLE subcomponente
  CHARACTER SET 'UTF8'
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Nombre, Valor, Componente_ID, CantPreguntas, Siglas);
  
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Indicadores.csv' INTO TABLE indicador
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Codigo, Subcomponente_ID, Medida_ID, Nombre,Valor);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/IndicadoresInfo.csv' INTO TABLE indicadorinfo
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Descripcion,Formula,Fuente,Url,Responsable,Periodo,Observaciones,Frecuencia);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Nominales.csv' INTO TABLE nominal
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Simbolo,Porcentaje,Valor);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/Lineales.csv' INTO TABLE lineal
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Indicador_ID,Pendiente,Ordenada);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/FillDat.csv' INTO TABLE indicadorxasada
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Año,Indicador_id,Asada_id,Valor,Texto);
  
LOAD DATA LOCAL INFILE 'C:/Users/ramir/Documents/TEC/TEC/Proyecto de Asistencia/Datos/AsadasInfo.csv' INTO TABLE asadainfo
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n' IGNORE 1 rows (Asada_ID, Ubicacion, Telefono, Poblacion, Url,cantAbonados);
  