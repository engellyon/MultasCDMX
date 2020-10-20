/*
	PPROCEDIMIENTOS ALMACENADOS Y TRIGGERS
*/
USE MULTAS_CDMX;
GO
/*El Usuario puede consultar la informacion de la multa ingresando su RFC
*/
/*Se crea el procedimiento llamado ve_multa,creamos una variable,
llamada rfc donde guardara el valor del rfc del usuario,se verificara
primero que el rfc no sea nulo,si es el caso lanzara un mensaje,de
lo contrario,mostrara los datos de la multa correspondiente */
--/*
CREATE PROCEDURE ve_multa
 @rfc varchar(13)
as
if @rfc is null
begin 
	select 'Debe de ingresar un RFC'
	return
end;
select  distinct(l.IdLicencia),l.Puntos_Acumulados,l.Vigencia,l.Fecha_Vencimiento,m.Estatus,m.Importe,m.Num_Tarjeta,
i.penalizacion,i.Fecha,i.Hora,vo.Placas
from Licencia as l , Multa as m,Persona as p,Con_Licencia as c,Infraccion as i,Involucra as vo
where @rfc = c.RFC and c.IdLicencia =l.IdLicencia and l.IdLicencia = m.IdLicencia
and m.IdExpediente = i.IdExpediente and vo.IdExpediente = i.IdExpediente;
GO
--*/

/*se ejecuta el procedimiento ve_multa ,pasandole un RFC*/
/*
exec ve_multa 'EANT070504GAA';
*/

/*elimina el procedimiento ve_multa*/
/*
drop procedure ve_multa;
*/


/*
El usuario puede consultar la informacion de la multa ingresando sus palcas
Se crea el procedimiento llamado ve_multa_placas,creamos una variable,
llamada @placas donde guardara el valor de  las placas  del usuario,se verificara
primero que  @placas no sea nulo,si es el caso lanzara un mensaje,de
lo contrario,mostrara los datos de la multa correspondiente*/

--/*
create procedure ve_multa_placas(@placas varchar(10))
as
if @placas is null
begin 
	select 'Debe de ingresar las Placas'
	return
end;
select  distinct(l.IdLicencia),l.Puntos_Acumulados,l.Vigencia,l.Fecha_Vencimiento,m.Estatus,m.Importe,m.Num_Tarjeta,
i.penalizacion,i.Fecha,i.Hora
from Licencia as l , Multa as m,Persona as p,Con_Licencia as c,Infraccion as i,
Vehiculo as v,Pertenece as pe,Involucra as vo
where vo.Placas= @placas and i.IdExpediente=vo.IdExpediente and
i.IdExpediente=m.IdExpediente and m.IdLicencia = l.IdLicencia;
--*/
GO

/*
Ejecuta el Procedimiento ve_multa_placas
exec ve_multa_placas 'O90-EJW';
*/

/*
Elimina el procedimiento ve_multa_placas
drop  procedure ve_multa_placas;

*/

/*
	VISTA NECESARIA PARA PODER GENERAR LAS CADENAS ALEATORIAS
*/

CREATE VIEW vwRandom
AS
SELECT RAND() as Rnd
GO 

/*
	FUNCION QUE CREA UNA CADENA ALEATORIOA DE TAMAÑO Y ELEMENTOS DADOS
	SOLO ES NECESARIO INDICARLE EL TAMAÑO DE LA CADENA ASI COMO DE QUE TIPO QUEREMOS
	QUE SEA
	--- C = CADENA DE PURAS LETRAS
	--- N = CADENA DE PUROS NUMEROS
	--- CN = CADENA DE LETRAS Y NUMEROS
*/
--/*
CREATE FUNCTION fnCustomPass 
(    
    @size AS INT, --Tamaño de la cadena aleatoria
    @op AS VARCHAR(2) --Opción para letras(ABC..), numeros(123...) o ambos.
)
RETURNS VARCHAR(62)
AS
BEGIN    
    DECLARE @chars AS VARCHAR(52),
            @numbers AS VARCHAR(10),
            @strChars AS VARCHAR(62),        
            @strPass AS VARCHAR(62),
            @index AS INT,
            @cont AS INT
    SET @strPass = ''
    SET @strChars = ''    
    SET @chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    SET @numbers = '0123456789'
    SET @strChars = CASE @op WHEN 'C' THEN @chars --Letras
                        WHEN 'N' THEN @numbers --Números
                        WHEN 'CN' THEN @chars + @numbers --Ambos (Letras y Números)
                        ELSE '------'
                    END
    SET @cont = 0
    WHILE @cont < @size
    BEGIN
        SET @index = ceiling( ( SELECT rnd FROM vwRandom ) * (len(@strChars)))--Uso de la vista para el Rand() y no generar error.
        SET @strPass = @strPass + substring(@strChars, @index, 1)
        SET @cont = @cont + 1
    END    
        
    RETURN @strPass
END
GO
--*/

-- Eliminar la funcion fnCustomPass
--DROP FUNCTION fnCustomPass;

/*
	REGISTRAR PERSONA EN BASE DE DATOS (SOLO PERSONA)
	Este Procedimiento nos permite registrar una persona en la base de datos
	proporcionandole solo la infromacion requerida para el registro:
	RFC,Nombre,Apellido Paterno, Apellido Materno,Genero,Fecha Nacimiento,Telefono,Correo Electronico,Calle,Numero,
	Colonia,Delegacion,Codigo Postal,Estado
*/

--/*
CREATE PROCEDURE Registrar_Persona(
	@RFC VARCHAR(13),@Nombre VARCHAR(80),@Apellido_Paterno VARCHAR(80),
	@Apellido_Materno VARCHAR(80),@Genero VARCHAR(1),@Fecha_Nacimiento DATE,@Telefono VARCHAR(14),
	@Correo_Electronico VARCHAR(100),@Calle VARCHAR(100),@Numero VARCHAR(10),@Colonia VARCHAR(80),
	@Delegacion VARCHAR(80),@Codigo_Postal VARCHAR(5),@Estado VARCHAR(50))
AS
BEGIN
INSERT INTO Persona([RFC],[Nombre],[Apellido_Paterno],[Apellido_Materno],[Genero],[Fecha_Nacimiento],[Telefono],[Correo_Electronico],[Calle],[Numero],[Colonia],[Delegacion],[Codigo_Postal],[Estado]) VALUES(@RFC,@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@Fecha_Nacimiento,@Telefono,@Correo_Electronico,@Calle,@Numero,@Colonia,@Delegacion,@Codigo_Postal,@Estado);
RETURN @RFC;
END;
GO
--*/

-- Eliminar el Procedimiento 
--DROP PROCEDURE Registrar_Persona;

/*
	REGISTRAR UN CONDUCTOR CON LA PRESONA PREVIAMENTE REGISTRADA
	Este procedimiento se encarga de registrar y otorgar una licencia a una persona que ya esta previamente registrada
	en la base, por lo que solo se provee del RFC de la persona y el tipo de licencia que requiere.
*/

--/*
CREATE PROCEDURE Registrar_Conductor(@RFC VARCHAR(13),@Tipo VARCHAR(1))
AS
BEGIN
	DECLARE @IdLicencia VARCHAR(9)
	DECLARE @Fecha DATE
	SET @IdLicencia = (SELECT dbo.fnCustomPass(1,'C')) + (SELECT dbo.fnCustomPass(8,'N'));
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Fecha = DATEADD(YEAR,3,@Fecha);
INSERT INTO Licencia([IdLicencia],[Puntos_Acumulados],[Tipo],[Vigencia],[Fecha_Vencimiento]) VALUES(@IdLicencia,0,@Tipo,'ACTIVA',@Fecha);
INSERT INTO Con_Licencia([IdLicencia],[RFC]) VALUES(@IdLicencia,@RFC);
SELECT @IdLicencia;
END;
GO
--*/

-- ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Registrar_Conductor;


/*
	REGISTRAR AGENTE CONLA PERSONA REGISTRADA PREVIAMENTE
	Este procedimiento se encarga de registrar a una persona como Agente de transito, 
	aunque requiere que la persona ya este registrada en el sistema, asi solo se necesita el RFC de 
	la persona que sera agente y el sector donde laborara.
*/

CREATE PROCEDURE Registrar_Agente(@RFC VARCHAR(13),@Sector VARCHAR(100))
AS
BEGIN
	DECLARE @RFCP VARCHAR(13)
	DECLARE @NA VARCHAR(6)
	SET @RFCP = (SELECT RFC FROM Persona WHERE RFC = @RFC)
	IF(@RFCP IS NULL)
	BEGIN
		SELECT 'PERSONA NO REGISTRADA'
		RETURN
	END
	SET @NA = (SELECT dbo.fnCustomPass(6,'N'))
	INSERT INTO Agente ([N_Registro_Personal],[RFC],[Sector]) VALUES(@NA,@RFCP,@Sector);
	RETURN @NA;
END;
GO


/*
	REGISTRAR NUEVO CONDUCTOR EN LA BASE DE DATOS DIRECTAMENTE CON TODOS LOS DATOS NECESARIOS
	Este Procedimiento nos permite registrar una persona en la base de datos
	proporcionandole solo la infromacion requerida para el registro:
	RFC,Nombre,Apellido Paterno, Apellido Materno,Genero,Fecha Nacimiento,Telefono,Correo Electronico,Calle,Numero,
	Colonia,Delegacion,Codigo Postal,Estado
	Asi como tambien registrarlo y otorgarle una licencia por lo que tambien requerimos del tipo de la licencia solicitada.
*/

--/*
CREATE PROCEDURE Registrar_Nuevo_Conductor(
@RFC VARCHAR(13),@Nombre VARCHAR(80),@Apellido_Paterno VARCHAR(80),
@Apellido_Materno VARCHAR(80),@Genero VARCHAR(1),@Fecha_Nacimiento DATE,@Telefono VARCHAR(14),
@Correo_Electronico VARCHAR(100),@Calle VARCHAR(100),@Numero VARCHAR(10),@Colonia VARCHAR(80),
@Delegacion VARCHAR(80),@Codigo_Postal VARCHAR(5),@Estado VARCHAR(50),@Tipo VARCHAR(1))
AS
BEGIN
INSERT INTO Persona([RFC],[Nombre],[Apellido_Paterno],[Apellido_Materno],[Genero],[Fecha_Nacimiento],[Telefono],[Correo_Electronico],[Calle],[Numero],[Colonia],[Delegacion],[Codigo_Postal],[Estado]) VALUES(@RFC,@Nombre,@Apellido_Paterno,@Apellido_Materno,@Genero,@Fecha_Nacimiento,@Telefono,@Correo_Electronico,@Calle,@Numero,@Colonia,@Delegacion,@Codigo_Postal,@Estado);
	DECLARE @IdLicencia AS VARCHAR(9)
	DECLARE @Fecha AS DATE
	SET @IdLicencia = (SELECT dbo.fnCustomPass(1,'C')) + (SELECT dbo.fnCustomPass(8,'N'));
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Fecha = DATEADD(YEAR,3,@Fecha);
INSERT INTO Licencia([IdLicencia],[Puntos_Acumulados],[Tipo],[Vigencia],[Fecha_Vencimiento]) VALUES(@IdLicencia,'0',@Tipo,'ACTIVA',@Fecha);
INSERT INTO Con_Licencia([IdLicencia],[RFC]) VALUES(@IdLicencia,@RFC);
SELECT @IdLicencia;
END;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Registrar_Nuevo_Conductor;
	
/*
	REGISTRAR UN VEHICULO EN LA BASE DE DATOS 
	DADOS LOS DATOS DEL VEHICULO Y EL FRC DE LA PERSONA
	Este Procedimiento nos premite registrar una vehiculo en la base de datos asi como registrar a quien pertence el mismo
	Solo es necesario darle los datos necesarios que son rl RFC del propietarios asi como ciertas caracteristicas especificas del
	vehiculo:
	RFC, Numero de Serie, Litros del Motor, Color del vehiculo, Capacidad del Tanque, Numero de Pasajeros y por ultimo el
	el Modelo del vehiculo
*/

--/*
CREATE PROCEDURE Registrar_Vehiculo(
	@RFC VARCHAR(13),@NumSerie VARCHAR(17),@Litros_Motor FLOAT,@Color VARCHAR(50),
	@Capacidad_Tanque INTEGER,@Pasajeros INTEGER,@Modelo_Nombre VARCHAR(100)
)
AS
BEGIN
	DECLARE @Placas VARCHAR(10)
	DECLARE @Fecha_asignacion AS DATE
	SET @Fecha_asignacion = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Placas = (SELECT dbo.fnCustomPass(1,'C')) + (SELECT dbo.fnCustomPass(2,'N')) + '-'+ (SELECT dbo.fnCustomPass(3,'C'));
INSERT INTO Vehiculo([Placas],[NumSerie],[Litros_Motor],[Color],[Capacidad_Tanque],[Pasajeros],[Fecha_asignacion],[Modelo_Nombre]) VALUES(@Placas,@NumSerie,@Litros_Motor,@Color,@Capacidad_Tanque,@Pasajeros,@Fecha_asignacion,@Modelo_Nombre);
INSERT INTO Pertenece([Placas],[RFC]) VALUES(@Placas,@RFC);
SELECT @Placas;
END;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Registrar_Vehiculo;

/*
	REALIZA EL CAMBIO DE PROPIETARIO DADO EL RFC DEL PROPIETARIO ACTUAL, EL RFC DEL NUEVO PROPIETARIO, LAS PLACAS DEL AUTO A TRANSFERIR
	Y EL ESTADO DONDE SE HIZO ESTE REGISTRO O CAMBIO
	Este procedimiento nos permite realizar el cambio de propietario de un vehiculo, indicandole el RFC del propietario actual
	el RFC del nuevo propietario, las Placas actuales del vehiculo y tambien el estado donde se realiza el cambio de propiedad.
*/

--/*
CREATE PROCEDURE Cambio_Propietario(@RFCPa VARCHAR(13),@RFCNp VARCHAR(13),@PlacasAct VARCHAR(10), @Edo_Registro VARCHAR(100))
AS
BEGIN
	DECLARE @Placas VARCHAR(10)
	DECLARE @FechaIn DATE
	DECLARE @FechaCambio DATE
	SET @Placas = (SELECT dbo.fnCustomPass(1,'C')) + (SELECT dbo.fnCustomPass(2,'N')) + '-'+ (SELECT dbo.fnCustomPass(3,'C'));
	SET @FechaIn = (SELECT Fecha_asignacion FROM Vehiculo WHERE Placas = @PlacasAct);
	SET @FechaCambio = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	UPDATE Vehiculo SET Placas = @Placas WHERE Placas = @PlacasAct;
	UPDATE Vehiculo SET Fecha_asignacion = @FechaCambio WHERE Placas = @Placas;
	UPDATE Pertenece SET RFC = @RFCNp WHERE Placas = @Placas;
	INSERT INTO Fue_Propietario([Placas],[RFC]) VALUES(@Placas,@RFCPa);
	INSERT INTO Fue_propiedad([Placas],[Fecha_Inicio],[Fecha_Fin],[Placas_ant],[Edo_Registro]) VALUES(@Placas,@FechaIn,@FechaCambio,@PlacasAct,@Edo_Registro);
END;
	SELECT @Placas
GO
--*/ 

--ELIMINAR PROCEDIMIENTO 
--DROP PROCEDURE Cambio_Propietario;

/*
	REGISTRAR TARJETA DE CIRCULACION
	Este procedimiento nos permite relaizar el registro de una Tarjeta de Circulacion para un vehiculo por lo que solo
	es necesario proveer la placas del Vehiculo deseado y el sistem obtendra toda la informacion necesaria.
*/

--/*
CREATE PROCEDURE Registro_Tarjeta_Circulacion(@Placas VARCHAR(10))
AS
BEGIN
	DECLARE @Fecha DATE
	DECLARE @Num_Tarjeta INTEGER
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Fecha = DATEADD(YEAR,3,@Fecha);
	INSERT INTO Tarjeta_Circulacion([Vigencia],[Fecha_vencimiento],[Placas]) VALUES('ACTIVA',@Fecha,@Placas);
	SET @Num_Tarjeta = (SELECT MAX(Num_Tarjeta)FROM Tarjeta_Circulacion);
RETURN @Num_Tarjeta
END;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Registro_Tarjeta_Circulacion;

/*
	RENOVAR LA TARJETA DE CIRCULACION DADAS LAS PLACAS Y EL NUMERO DE LA ULTIMA TEARJETA DE CIRCULACION
	Este procedimiento nos permite renovar la tarjeta de circulacion de un vehiculo a partir de alguna tarjeta
	de circulacion que tenga el propietario, aunque es muy raro que no sea la ultima tramitada.
*/

--/*
CREATE PROCEDURE Actualiza_Tarjeta_Circulacion(@NUT INTEGER)
AS
BEGIN
	DECLARE @Placas VARCHAR(10)
	DECLARE @Fecha DATE
	DECLARE @Num_Tarjeta INTEGER
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Fecha = DATEADD(YEAR,3,@Fecha);
	SET @Placas = (SELECT Placas FROM Tarjeta_Circulacion WHERE Num_Tarjeta = @NUT)
	UPDATE Tarjeta_Circulacion SET Vigencia = 'CANCELADA' WHERE Num_Tarjeta = @NUT;
	INSERT INTO Tarjeta_Circulacion([Vigencia],[Fecha_vencimiento],[Placas]) VALUES('ACTIVA',@Fecha,@Placas);
	SET @Num_Tarjeta = (SELECT MAX(Num_Tarjeta)FROM Tarjeta_Circulacion);
END;
	SELECT * FROM Tarjeta_Circulacion WHERE Num_Tarjeta = @Num_Tarjeta;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Actualiza_Tarjeta_Circulacion;

/*
	GENERA UNA FOTOMULTA
	Procedimiento almacenado que nos permite generar una foto multa y almacenarla en el sistema dado los requisitos basicos
	que son el ID de la camara que detecto la multa, las placas del vehiculo infractor, la velocidad de infraccion asi como
	la penalizacion correspondiente a la multa y el importe de la multa y el procedimiento se encargara de registrar la multa
	con la informcacion obtenida del vehiculo en el sistema
	NOTA: tanto la penalizacion como el importe son generados por la aplicacion web.
*/

--/*
CREATE PROCEDURE Genera_Fotomulta(@IdCamara INTEGER, @Placas VARCHAR(10),@Velocidad FLOAT, @Penalizacion INTEGER, @Importe DECIMAL)
AS
BEGIN 
	DECLARE @RFC VARCHAR(13)
	DECLARE @IdLicencia VARCHAR(9)
	DECLARE @IdExpediente INTEGER
	DECLARE @NumTarjeta INTEGER
	DECLARE @Pa INTEGER
	DECLARE @Fecha DATE
	DECLARE @Hora TIME
	DECLARE @Multa INTEGER
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Hora =  (SELECT CONVERT(TIME, SYSDATETIME(), 108));
	INSERT INTO Infraccion([Fecha],[Penalizacion],[Hora]) VALUES (@Fecha,@Penalizacion,@Hora);
	SET @IdExpediente = (SELECT MAX(IdExpediente) FROM Infraccion);
	INSERT INTO Involucra([IdExpediente],[Placas]) VALUES(@IdExpediente,@Placas);
	INSERT INTO Crea ([IdCamara],[IdExpediente],[Velocidad_Infraccion]) VALUES(@IdCamara,@IdExpediente,@Velocidad);
	SET @RFC = (SELECT RFC FROM Pertenece WHERE Placas = @Placas);
	SET @IdLicencia = (SELECT TOP 1 IdLicencia FROM Con_Licencia WHERE RFC = @RFC)
	SET @Pa = (SELECT Puntos_Acumulados FROM Licencia where IdLicencia = @IdLicencia) 
	SET @NumTarjeta = (SELECT MAX(Num_Tarjeta) FROM Tarjeta_Circulacion WHERE Placas = @Placas)
	INSERT INTO Multa([IdExpediente],[Num_Tarjeta],[IdLicencia],[Estatus],[Importe]) VALUES(@IdExpediente,@NumTarjeta,@IdLicencia,'NO PAGADO',@Importe);
	UPDATE Licencia SET Puntos_Acumulados = (@Pa + @Penalizacion) WHERE idLicencia = @IdLicencia;
	SET @Multa = (SELECT MAX(IdMulta) FROM MULTA);
	RETURN @MULTA
END;
GO
--*/

-- ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Genera_Fotomulta;

/*
	GENERA UNA MULTA HECHA POR UN AGENTE
	Procedimiento almacenado que nos permite generar una multa y amacenarla en la base de datos, a paritr de la informacion basica que se requiere que
	el agente recoja y el resto es otorgada por el sistema dados los registros del vehiculo y conductor por lo que solo 
	se le indica el numero de agente, el codigo de ubicacion, el articulo infringido, el municipio donde se infringio,
	el ID de la licencia del conductor y las placas del vehiculo infractor.
	NOTA: tanto la penalizacion como el importe son generados por la aplicacion web.
*/

--/*
CREATE PROCEDURE Genera_Multa(@NRP VARCHAR(6),@Ubicacion INTEGER,@Articulo VARCHAR(20),@Municipio VARCHAR(80),@Penalizacion INTEGER,@Importe DECIMAL,@IdLicencia VARCHAR(9),@Placas VARCHAR(10))
AS
BEGIN
	DECLARE @IdExpediente INTEGER
	DECLARE @RFC VARCHAR(13)
	DECLARE @NumTarjeta INTEGER
	DECLARE @Pa INTEGER
	DECLARE @Fecha DATE
	DECLARE @Hora TIME
	DECLARE @Multa INTEGER
	SET @Fecha = (SELECT CONVERT(VARCHAR(10),GETDATE(),103));
	SET @Hora =  (SELECT CONVERT(TIME, SYSDATETIME(), 108));
	INSERT INTO Infraccion([Fecha],[Penalizacion],[Hora]) VALUES(@Fecha,@Penalizacion,@Hora);
	SET @IdExpediente = (SELECT MAX(IdExpediente) FROM Infraccion);
	SET @RFC = (SELECT RFC FROM Con_Licencia WHERE IdLicencia = @IdLicencia);
	SET @Pa = (SELECT Puntos_Acumulados FROM Licencia where IdLicencia = @IdLicencia) 
	INSERT INTO Involucra([IdExpediente],[Placas]) VALUES(@IdExpediente,@Placas);
	INSERT INTO Comete([IdExpediente],[RFC]) VALUES(@IdExpediente,@RFC);
	SET @NumTarjeta = (SELECT MAX(Num_Tarjeta) FROM Tarjeta_Circulacion WHERE Placas = @Placas);
	INSERT INTO Multa([IdExpediente],[Num_Tarjeta],[IdLicencia],[Estatus],[Importe]) VALUES(@IdExpediente,@NumTarjeta,@IdLicencia,'NO PAGADO',@Importe);
	UPDATE Licencia SET Puntos_Acumulados = (@Pa + @Penalizacion) WHERE idLicencia = @IdLicencia;
	SET @Multa = (SELECT MAX(IdMulta) FROM Multa);
	RETURN @Multa;
END; 
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Genera_Multa;

/*
	Pagar Multa
	Procedimiento almacenado que se encarga de pagar o liquidar la deuda de la multa generada
	indicandole el ID de la misma.
*/

--/*
CREATE PROCEDURE Pagar_Multa(@IdMulta INTEGER OUTPUT)
AS
BEGIN
	UPDATE Multa SET Estatus = 'PAGADO' WHERE IdMulta = @IdMulta;
	RETURN @IdMulta;
END;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Pagar_Multa;

/*
	MUESTRA LA INFORMACION QUE RECOPILA EL AGENTE AL LEVANTAR UNA MULTA
	Nos muestra toda la informacion que se recopila en una infraccion levantada por un agente, indicandole el ID de la multa,
	Siempre y cuando la multa la registrara un agente y no una camara de vigilancia.
*/
--/*
CREATE PROCEDURE Ver_Multa_Agente(@IdMulta INTEGER)
AS
BEGIN
	DECLARE @IdExpediente INTEGER
	DECLARE @IdExpM INTEGER
	SET @IdExpM = (SELECT IdExpediente FROM Multa WHERE IdMulta = @IdMulta);
	SET @IdExpediente = (SELECT IdExpediente FROM Impone WHERE IdExpediente = @IdExpM)
IF @IdExpediente IS NULL
	BEGIN 
		SELECT 'MULTA NO IMPUESTA POR AGENTE';
		RETURN;
	END
SELECT IdMulta,IdExpediente,NRP 'No. de Agente',Penalizacion,Importe,Estatus,Calle Sobre,Calle1,Calle2,Calle3,Articulo 'Articulo Infringido',Municipio,Hora,Placas,Modelo_Nombre Modelo,Marca,Num_Tarjeta 'Tarjeta de Circulacion',TVigencia 'Vigencia Tarjeta',FVTC 'Fecha de Vencimiento',IdLicencia,TipoL 'Tipo de Licencia',VigenciaL Vigencia,FVL 'Fecha de Vencimiento',RFC,Nombre,Ap 'Apellido Paterno', Am 'Apellido Materno' FROM
	(SELECT IdMulta, NRP,Calle,Referencia,Calle1,Calle2,Calle3,LM.Articulo,Municipio,FechaM,Penalizacion,Hora,Num_Tarjeta,TVigencia,FVTC,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,Modelo_Nombre,Marca FROM
		(SELECT IdMulta, NRP,U.Ubicacion,U.Calle,U.Referencia,Articulo,Municipio,FechaM,Penalizacion,Hora,Num_Tarjeta,TVigencia,FVTC,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,Modelo_Nombre,Marca FROM
			(SELECT IdMulta, NRP, Ubicacion,Articulo,Municipio,Inf.Fecha FechaM,Penalizacion,Hora,Num_Tarjeta,TVigencia,FVTC,J.IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,Modelo_Nombre,Marca FROM
				(SELECT IdMulta,N_Registro_Personal NRP, Ubicacion,Articulo,Municipio,Num_Tarjeta,TVigencia,FVTC,H.IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,Modelo_Nombre,Marca FROM
					(SELECT IdMulta,T.Num_Tarjeta, T.Vigencia TVigencia,T.Fecha_vencimiento FVTC,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,G.Placas,Modelo_Nombre,Marca FROM
						(SELECT IdMulta,Num_Tarjeta,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,Modelo_Nombre,Ar.Marca FROM
							(SELECT IdMulta,Num_Tarjeta,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas,E.Modelo_Nombre,NombreArmadora FROM
								(SELECT IdMulta,Num_Tarjeta,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,V.Placas,Modelo_Nombre FROM
									(SELECT IdMulta,Num_Tarjeta,C.IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,RFC,Nombre,Ap,Am,Placas FROM 
										(SELECT IdMulta,Num_Tarjeta,IdExpediente,IdLicencia,TipoL,VigenciaL,FVL,Estatus,Importe,P.RFC,Nombre,Apellido_Paterno Ap,Apellido_Materno Am FROM
											(SELECT IdMulta,Num_Tarjeta,IdExpediente,M.IdLicencia,Tipo TipoL, Vigencia VigenciaL, Fecha_Vencimiento FVL,Estatus,Importe,RFC FROM (SELECT * FROM Multa WHERE IdMulta = @IdMulta) M JOIN
												(SELECT L.IdLicencia,RFC,Tipo,Vigencia,Fecha_Vencimiento FROM Con_Licencia CL JOIN Licencia L ON CL.IdLicencia = L.IdLicencia) A ON M.IdLicencia = A.IdLicencia) B JOIN Persona P ON B.RFC = P.RFC) C JOIN Involucra I ON C.IdExpediente = I.IdExpediente) D JOIN Vehiculo V ON D.Placas = V.Placas) E JOIN Modelo M ON E.Modelo_Nombre = M.Modelo_Nombre) F JOIN Armadora Ar ON F.NombreArmadora = Ar.NombreArmadora) G JOIN Tarjeta_Circulacion T ON G.Num_Tarjeta = T.Num_Tarjeta) H JOIN Impone Im ON H.IdExpediente = Im.IdExpediente) J JOIN Infraccion Inf ON J.IdExpediente = Inf.IdExpediente) K JOIN Ubicacion U ON K.Ubicacion = U.Ubicacion) LM JOIN EntreCalles EC ON LM.Ubicacion = EC.Ubicacion) AA
END;
GO
--*/

--ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Ver_Multa_Agente;

/*
	PROCEDIMIENTO QUE NOS PERMITE VER LA INFORMACION RECOPILADA POR LA VAMARA DE VIGILANCIA PARA LA MULTA
	Nos muestra toda la informacion que se recopila en una infraccion levantada por una camara de vigilancia , indicandole el ID de la multa,
	Siempre y cuando la multa la registrara una camara de vigilancia y no un agente.
*/
--/*
CREATE PROCEDURE Ver_FotoMulta(@IdMulta INTEGER)
AS 
BEGIN
	DECLARE @IdExpediente INTEGER
	DECLARE @IdExpM INTEGER
	SET @IdExpM = (SELECT IdExpediente FROM Multa WHERE IdMulta = @IdMulta);
	SET @IdExpediente = (SELECT IdExpediente FROM Crea WHERE IdExpediente = @IdExpM);
	IF(@IdExpediente IS NULL)
		BEGIN
			SELECT 'MULTA NO IMPUESTA POR FOTOMULTA'
			RETURN;
		END
	SELECT IdMulta,IdExpediente,Calle,Colonia,Delegacion,Fecha,Hora,Placas,Color,Velocidad_Infraccion Velocidad,Penalizacion,Importe,Estatus FROM 
	(SELECT IdMulta,IdExpediente,V.Placas,Color,Estatus,Importe,Fecha,Penalizacion,Hora,IdCamara,Velocidad_Infraccion,Colonia,Calle,Delegacion FROM
		(SELECT IdMulta,C.IdExpediente,Placas,Estatus,Importe,Fecha,Penalizacion,Hora,IdCamara,Velocidad_Infraccion,Colonia,Calle,Delegacion FROM
			(SELECT IdMulta,IdExpediente,Estatus,Importe,Fecha,Penalizacion,Hora,B.IdCamara,Velocidad_Infraccion,Colonia,Calle,Delegacion FROM
				(SELECT IdMulta,A.IdExpediente,Estatus,Importe,Fecha,Penalizacion,Hora,IdCamara,Velocidad_Infraccion FROM
					(SELECT IdMulta,M.IdExpediente,Estatus,Importe,Fecha,Penalizacion,Hora FROM
						(SELECT IdMulta,IdExpediente,Estatus,Importe FROM Multa WHERE IdExpediente = @IdExpediente) M JOIN Infraccion Inf ON M.IdExpediente = Inf.IdExpediente) A JOIN Crea Cr ON A.IdExpediente = Cr.IdExpediente) B JOIN Sistema_Camara Sc ON B.IdCamara = Sc.IdCamara) C JOIN Involucra Inv ON C.IdExpediente = Inv.IdExpediente) D JOIN Vehiculo V ON D.Placas = V.Placas) AA;
END;
GO
-- ELIMINAR PROCEDIMIENTO
--DROP PROCEDURE Ver_FotoMulta

/**
triggers(disparadores)
**/

/*Este disparador(trigger),permite actualizar el importe de la
multa.
Se crea el disparador(trigger) llamado ve_importe
este se ejecutara sobre la Tabla Multa a la hora
de que esta sea actualizada(update),este
disparador solo permitira,actualizaciones en el atributo 
Importe,como lo dicta el condicional, y realizara la consulta
mostrando el Importe,anterior, y el actualizado,pasado
como parametro por el usuario*/

--/*
create trigger ve_importe
on Multa
for update
as 
if (update(Importe))
	begin
		select d.Importe as 'Debia',
		i.Importe as 'Adeuda'
		from deleted as d
		join inserted as i 
		on d.IdMulta = i.IdMulta
	end;
GO
--*/

/*
Se  actualiza el atributo Importe de la tabla Multa donde el 
IdExpediente sea igual 53
*/
--Update Multa set Importe ='3800.05' where IdExpediente =53;

/*
Se elimina el disparador ve_importe
*/
--drop trigger ve_importe;


/*Este disparador(trigger),permite actualizar los puntos de la
licencia.
Se crea el disparador(trigger) llamado ve_puntos
este se ejecutara sobre la Tabla Licencia a la hora
de que esta sea actualizada(update),este
disparador solo permitira,actualizaciones en el atributo 
Puntos_Acumulados,como lo dicta el condicional, y realizara la consulta
mostrando el los Puntos_Acumulados,anteriormente, y el actualizado,
pasado como parametro por el usuario*/

--/*
create trigger ve_puntos
on Licencia
for update
as
if(update (Puntos_Acumulados))
	begin 
	select d.Puntos_Acumulados as 'Tenias',
	i.Puntos_Acumulados as 'Tienes'
	from deleted as d
	join inserted as i 
	on d.IdLicencia = i.IdLicencia;
end;
GO
--*/

/*
Se actualiza el atributo Puntos_Acumulados sobre la tabla Licencia
donde el IdLicencia sea: 'L99253986'
*/
--Update Licencia set Puntos_Acumulados=5 where IdLicencia='L99253986';

/*Se elimina el disparados ve_Puntos
*/
--drop trigger ve_puntos;

/*
	Disparador que actualiza la vigencia de la licencia
	cada que se registra una multa en en alguna licencia,
	Una vez alcance los 12 puntos esta se cancela
*/

--/*
CREATE TRIGGER Puntos ON Licencia FOR UPDATE
AS
BEGIN
 IF(UPDATE(PUNTOS_ACUMULADOS))
	BEGIN 
	DECLARE @PUNTOS INTEGER
	DECLARE @IdLicencia VARCHAR(9)
	SET @PUNTOS = (SELECT inserted.Puntos_Acumulados FROM inserted);
	SET @IdLicencia = (SELECT inserted.IdLicencia FROM inserted);
	IF(@PUNTOS >= 12)
		BEGIN
		UPDATE Licencia SET Vigencia = 'CANCELADA' WHERE IdLicencia = @IdLicencia;
		END
	END
END;
GO
--*/

/*
	ELIMINAR EL DISPARADOR Puntos
*/
--DROP TRIGGER Puntos;

/*
	Activar el disparador
*/
--UPDATE Licencia SET Puntos_Acumulados = 12 WHERE IdLicencia = 'B84492520';