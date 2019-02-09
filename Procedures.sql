SELECT 
    C.codigo, AVG(t.valor) AS valor
FROM
    Asada A,
    distrito C,
    Canton Ca,
    provincia P,
    (SELECT 
        s.Asada_ID, SUM(s.valor * i.valor) * 100 AS valor
    FROM
        indicadorxasada s, indicador i
    WHERE
        s.Indicador_ID = i.ID
    GROUP BY (s.Asada_ID)) t
WHERE
    A.DISTRITO_ID = C.ID
        AND A.DISTRITO_CANTON_ID = Ca.ID
        AND A.DISTRITO_CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_ID = Ca.ID
        AND Ca.PROVINCIA_ID = P.ID
        AND A.id = t.asada_id
GROUP BY (c.codigo);




SELECT 
    C.codigo, AVG(t.valor) AS valor
FROM
    Asada A,
    distrito C,
    Canton Ca,
    provincia P,
    () t
WHERE
    A.DISTRITO_ID = C.ID
        AND A.DISTRITO_CANTON_ID = Ca.ID
        AND A.DISTRITO_CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_ID = Ca.ID
        AND Ca.PROVINCIA_ID = P.ID
        AND A.id = t.asada_id
GROUP BY (c.codigo);











/*Select para IRSSAS*/
SELECT 
        s.Asada_ID, SUM(s.valor * i.valor) * 100 AS valor
    FROM
        indicadorxasada s, indicador i
    WHERE
        s.Indicador_ID = i.ID
    GROUP BY (s.Asada_ID);
/* Select para obtener por componentes*/
SELECT s.Asada_ID, (SUM(s.valor * i.valor) * 10000) / c.valor  AS valor FROM indicadorxasada s, indicador i,
subcomponente d, componente c WHERE s.Indicador_ID = i.ID  and i.Subcomponente_ID=d.ID and d.Componente_ID= c.ID
and d.Componente_ID= 4 GROUP BY (s.Asada_ID);

/*Select para obtener por subcomponentes*/
	SELECT s.Asada_ID, (SUM(s.valor * i.valor) * 1000000) / (d.valor * c.valor) AS valor FROM indicadorxasada s, indicador i,
    subcomponente d, componente c WHERE s.Indicador_ID = i.ID and i.Subcomponente_ID=d.ID and d.Componente_ID= c.ID
    and d.id= 6 GROUP BY (s.Asada_ID)



















SELECT 
    C.codigo, AVG(t.valor) AS valor
FROM
    Asada A,
    distrito C,
    Canton Ca,
    provincia P,
    (SELECT s.Asada_ID, (SUM(s.valor * i.valor) * 1000000) / (d.valor * c.valor) AS valor FROM indicadorxasada s, indicador i,
    subcomponente d, componente c WHERE s.Indicador_ID = i.ID and i.Subcomponente_ID=d.ID and d.Componente_ID= c.ID
    and d.id= 7 GROUP BY (s.Asada_ID)) t
WHERE
    A.DISTRITO_ID = C.ID
        AND A.DISTRITO_CANTON_ID = Ca.ID
        AND A.DISTRITO_CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_PROVINCIA_ID = P.ID
        AND C.CANTON_ID = Ca.ID
        AND Ca.PROVINCIA_ID = P.ID
        AND A.id = t.asada_id
GROUP BY (c.codigo);




select C.codigo, avg(t.valor) as valor from Asada A, distrito C, Canton Ca, provincia P,
(SELECT s.Asada_ID, (SUM(s.valor * i.valor) * 10000) / c.valor  AS valor FROM indicadorxasada s, 
indicador i,subcomponente d, componente c WHERE s.Indicador_ID = i.ID  and i.Subcomponente_ID=d.ID 
and d.Componente_ID= c.ID and d.Componente_ID= 5 GROUP BY (s.Asada_ID)) t 
where A.DISTRITO_ID=C.ID and A.DISTRITO_CANTON_ID=Ca.ID and A.DISTRITO_CANTON_PROVINCIA_ID=P.ID 
and C.CANTON_PROVINCIA_ID=P.ID and C.CANTON_ID=Ca.ID 
and Ca.PROVINCIA_ID=P.ID and A.id=t.asada_id group by(c.codigo);

