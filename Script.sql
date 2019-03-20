USE PROYECTO_ASADA;

/*SELECTS*/
select * from asada A;
select * from provincia P;
select * from canton C;
select * from distrito D; 
select * from medida M;
select * from componente C;
select * from subcomponente S;
select * from indicador I;
select * from indicadorinfo I;
select * from indicadorxasada I;
select * from nominal N;
 
select * from usuario U;


/*DELETE*/
delete from distrito where id>=0;
delete from canton where id>=0;
delete from provincia where id>=0;
delete from medida where id>=0;
delete from indicadorxasada where id>=0;
delete from asada where id>=0;
delete from componente where ID>=0;
delete from subcomponente where ID>=0;
delete from indicador where ID>=0;

/*DROP*/
drop table indicadorxasada;
drop table usuarioxasada;
drop table asadainfo;
drop table indicadorinfo;
drop table asada;
drop table nominal;
drop table lineal;
drop table indicador;
drop table subcomponente;
drop table componente;
drop table medida;
drop table usuario;
drop table distrito;
drop table canton;
drop table provincia;


truncate table indicadorxasada;
truncate table usuarioxasada;
truncate table asadainfo;
truncate table indicadorinfo;
truncate table asada;
truncate table nominal;
truncate table lineal;
truncate table indicador;
truncate table subcomponente;
truncate table componente;
truncate table medida;
truncate table usuario;
truncate table distrito;
truncate table canton;
truncate table provincia;






select C.Nombre,Ca.Nombre,P.Nombre from distrito C inner join Canton Ca on C.CANTON_ID=Ca.ID inner join Provincia P on C.CANTON_PROVINCIA_ID= P.ID where C.CANTON_PROVINCIA_ID= P.ID and C.CANTON_ID=Ca.ID;
select C.ID,Ca.ID,P.ID, C.Nombre,Ca.Nombre,P.Nombre from distrito C, Canton Ca, provincia P where C.CANTON_ID=Ca.ID and C.CANTON_PROVINCIA_ID=P.ID and Ca.PROVINCIA_ID=P.ID;

select A.codigo, A.nombre, P.ID,Ca.ID,C.ID, C.Nombre as distrito,Ca.Nombre as canton,P.Nombre as provincia, C.codigo 
from Asada A, distrito C, Canton Ca, provincia P 
where A.DISTRITO_ID=C.ID and A.DISTRITO_CANTON_ID=Ca.ID and A.DISTRITO_CANTON_PROVINCIA_ID=P.ID 
and C.CANTON_PROVINCIA_ID=P.ID and C.CANTON_ID=Ca.ID and Ca.PROVINCIA_ID=P.ID order by 6;


ALTER view dicotomicas as select SA.ID,A.Nombre as Asada,C.Nombre as Componente,
S.Nombre as Subcomponente,if(SA.valor=1,"SI","NO") as Respuesta 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID where S.Medida_ID=1 ORDER BY 1 ASC;

ALTER view porcentajes as select SA.ID,A.Nombre as Asada,C.Nombre as Componente,
S.Nombre as Subcomponente,concat(SA.valor,"%") as Respuesta 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID where S.Medida_ID=2 ORDER BY 1 ASC;

ALTER view numericas as select SA.ID,A.Nombre as Asada,C.Nombre as Componente,
S.Nombre as Subcomponente,SA.valor as Respuesta 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID where S.Medida_ID=3 ORDER BY 1 ASC;

ALTER view nominal as select SA.ID,A.Nombre as Asada,C.Nombre as Componente,
S.Nombre as Subcomponente,if(SA.valor=1,"MENOR",IF(SA.valor=2,"MAYOR","IGUAL")) as Respuesta 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID where S.Medida_ID=4 order by 1 asc;

select * from dicotomicas;
select * from nominal;
select * from numericas;
select * from porcentajes;



select A.Nombre, avg(SA.valor) 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID  where S.Medida_ID=1 group by(A.Nombre) ORDER BY 1 ASC;

select A.Nombre, count(SA.valor) 
from subcomponentexasada SA inner join Asada A on A.codigo=SA.Asada_Codigo 
inner join subcomponente S on SA.Subcomponente_ID=S.ID inner join componente C 
on S.componente_id=C.ID  where S.Medida_ID=1 group by(A.Nombre) ORDER BY 1 ASC;


select A.nombre,D.nombre from Asada A 
inner join distrito D on A.Distrito_ID= D.ID and A.distrito_Canton_ID = D.CANTON_ID 
and A.distrito_canton_provincia_ID = D.CANTON_PROVINCIA_ID order by 1 desc;

use proyecto_asada;



insert into subcomponente(id,nombre,componente_ID,Medida_ID) values(27,'EC-2',7,1);
update subcomponente set Medida_ID=1 where id= 26;


insert into usuario(nombre,usuario,contrasenna,tipo,token) values('Joseph Ramírez Barquero','joseph','123',1,'232434fdfgsdfs');

select * from usuario;


select A.nombre, Su.detalle ,S.texto from subcomponentexasada S inner join Asada A on A.codigo=S.Asada_Codigo inner join subcomponente Su on Su.ID=S.Subcomponente_ID where S.Asada_Codigo = 155 and Año= 2018;

select C.ID as idd ,Ca.ID as idc ,P.ID as idp, C.Nombre as distrito ,Ca.Nombre as canton ,P.Nombre as provincia from distrito C, Canton Ca, provincia P where C.CANTON_ID=Ca.ID and C.CANTON_PROVINCIA_ID=P.ID and Ca.PROVINCIA_ID=P.ID order by 4;

update componente set valor=10 where id =5;

select * from asada;


insert into asada(codigo, nombre, DISTRITO_ID, DISTRITO_CANTON_ID, DISTRITO_CANTON_PROVINCIA_ID) values("+ident+","+nom+","+sites[0]+","+sites[1]+","+sites[2]+");

select distinct c.codigo from Asada A, distrito C, Canton Ca, provincia P where A.DISTRITO_ID=C.ID and A.DISTRITO_CANTON_ID=Ca.ID and A.DISTRITO_CANTON_PROVINCIA_ID=P.ID and C.CANTON_PROVINCIA_ID=P.ID and C.CANTON_ID=Ca.ID and Ca.PROVINCIA_ID=P.ID;