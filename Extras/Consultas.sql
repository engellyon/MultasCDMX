USE MULTAS_CDMX;
/*Consultas*/

/*1)
Informacion de las multas levantadas por los agentes,por seccion e informacion de las
mismas. */

select distinct(Agente.N_Registro_Personal) as numAgente , Sector,Articulo,
Municipio,Estatus,Infraccion.Hora
from Agente,Impone,Multa,Infraccion
where Agente.N_Registro_Personal=Impone.N_Registro_Personal and Impone.IdExpediente=
Infraccion.IdExpediente and Infraccion.IdExpediente = Multa.IdExpediente
group by Sector ,Agente.N_Registro_Personal,Ubicacion,Articulo,
Municipio,Estatus,Infraccion.Hora;

/*2)
Total de personas infractoras agrupadas por genero*/
select ISNULL(Genero,
	CASE WHEN GROUPING(Genero) =0 then 'Desconocido' else 'Total' end) as Genero,
	count(*) as Infractor
from Persona,Comete,Infraccion
where Persona.RFC = Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente
group by rollup (Genero);

/*3)
Total de personas infractoras agrupadas por edad*/
select (DATEPART(yyyy,Fecha_Nacimiento)-1995) as Edad,count(*) as PersonasInfractoras
from Persona,Comete,Infraccion
where Persona.RFC = Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente
group by DATEPART(yyyy,Fecha_Nacimiento)-1995;

/*4)
Tipo,modelo y numero de infracciones de los vehiculos*/
select Tipo,Vehiculo.Modelo_Nombre,count(*)as Infracciones
from Modelo,Vehiculo,Involucra,Infraccion
WHERE Modelo.Modelo_Nombre = Vehiculo.Modelo_Nombre and
Vehiculo.Placas = Involucra.Placas and Involucra.IdExpediente =
Infraccion.IdExpediente
group by Tipo,Vehiculo.Modelo_Nombre
order by count(*) desc ;

/*5)
Monto total recaudado,por infracciones anualmente*/
select DATEPART(yyyy,Fecha) as AÑO, sum(importe)  AS Monto
from Multa,Infraccion
where Infraccion.IdExpediente=Multa.IdExpediente
group by DATEPART(yyyy,Fecha);

/*6)
Numero(promedio) de multas por hora
*Las horas son representadas,como 12,13,14,siendo las 12,1 y 2 respectivamente*/
select COUNT(IdExpediente) as Promedio ,DATEPART(hh, Hora) as Horas
from Infraccion
group by  DATEPART(hh, Hora)
order by Promedio desc;

/*7)
Numero de multas por mes.
*Los meses son representados como 1,2,3,siendo Enero,Febrero,Marzo,
respectivamente*/
select COUNT(IdExpediente) as Num , DATEPART(MM,Fecha) as Mes
from Infraccion
group by DATEPART(MM,Fecha)
ORDER BY Num desc;

/*8)
Numero de licencias vigentes*/
select ISNULL(Vigencia,
	case when grouping(Vigencia)=0 then 'Desconocido'else 'Total' end) as Vigencia,
	count(Vigencia) Licencia
from Licencia
where Licencia.Vigencia='ACTIVA'
group by rollup(Vigencia);

/*9)
Numero de licencias agrupadas por Vigencia*/
select ISNULL(Vigencia,
	case when grouping(Vigencia)=0 then 'Desconocido' else 'Total' end) as Vigencia,
	count(Vigencia) Licencia
from Licencia
group by rollup(Vigencia);

/*10)
Numero de infracciones realizadas por los conductores de Licencia tipo A(Particulares) y
Licencia tipo B(Taxistas)
*/
SELECT count(IdExpediente) AS Infracciones,
Tipo FROM (SELECT IdExpediente,IdLicencia
 FROM (SELECT I.IdExpediente,RFC
 FROM Infraccion I JOIN Comete C ON I.IdExpediente = C.IdExpediente) A JOIN Con_Licencia CL ON A.RFC = CL.RFC) B JOIN Licencia L on B.IdLicencia = L.IdLicencia
GROUP BY Tipo;

/*11)
Numero de multas por mes,entre el Sistema de Camaras y las levantadas
por Agentes
*/
select camara 'Multas por Camara', Mc 'No. de mes del año', Agente 'Multas por Agente'
from(
select distinct(count(Crea.IdCamara)) as camara ,DATEPART(mm,Infraccion.Fecha) as Mc
from Crea,Infraccion
where Crea.IdExpediente=Infraccion.IdExpediente
group by DATEPART(mm,Infraccion.Fecha)) as A join
(select distinct(count(i.N_Registro_Personal)) as Agente ,DATEPART(mm,Infraccion.Fecha) as Ma
from Impone as i,Infraccion
where i.IdExpediente=Infraccion.IdExpediente
group by DATEPART(mm,Infraccion.Fecha)) as B
on A.Mc= B.Ma;

/*12)
Numero de personas que comenten alguna infraccion,agrupadas por 
Estado,se mostraran de menor a mayor
*/
select ISNULL(Estado,
	case when grouping(Estado) = 0 then 'Desconocido' else 'Total' end) as Estado,
	count(*) as Infractores
from Persona,Infraccion,Comete
where Persona.RFC= Comete.RFC and Comete.IdExpediente = Infraccion.IdExpediente
group by rollup (Estado)
order by Infractores asc;

/*13)
Numero de infractores por articulo y monto del mismo,ordenado de menor a mayor 
numero de infracciones*/
select ISNULL(Articulo,
	case when grouping(Articulo)= 0 then 'Desconocido' else 'Total' end) as Articulo,
	count(*) as Infringe,
	sum(Importe) as Monto
from Multa,Infraccion,Impone
where Multa.IdExpediente= Infraccion.IdExpediente and Infraccion.IdExpediente =
Impone.IdExpediente
group by rollup(Articulo)
order by Infringe asc;

/*14)
Numero de fotomultas por delegacion,mostradas de menor a mayor*/
select ISNULL(Delegacion,
	CASE WHEN GROUPING(Delegacion)=0 then 'Desconocido' else 'Total' end) as Delegacion,
	count(Crea.IdCamara) as FotoMulta
from Sistema_Camara,Crea,Infraccion
where Infraccion.IdExpediente=Crea.IdExpediente and Crea.IdCamara = Sistema_Camara.IdCamara
group by rollup(Delegacion)
order by FotoMulta asc;

/*15
Numero de multas levantadas por agentes,por Municipio,de menor a mayor*/
select ISNULL(Municipio,
	CASE WHEN GROUPING(Municipio)=0 then 'Desconocido' else 'Total' end) as Municipio,
	count(Impone.IdExpediente) as Agente
from Impone,Infraccion
where Infraccion.IdExpediente= Impone.IdExpediente
group by rollup(Municipio)
order by Agente asc;