/*
SCRIPT DE CREACION DE ESQUEMA DELM SISTEMA DE MULTAS DE LA CMDX
*/

CREATE DATABASE MULTAS_CDMX;
Go
USE MULTAS_CDMX;

-- Tabla Persona
-- Tabla Licencia
-- Tabla Infraccion
-- Tabla Ubicacion
-- Tabla Armadora
-- Tabla Sistema_Camara
-- Tabla EntreCalles
-- Tabla Agente
-- Tabla Con_Licencia
-- Tabla Comete
-- Tabla Crea
-- Tabla Impone
-- Tabla Modelo
-- Tabla Vehiculo
-- Tabla Fue_Propiedad
-- Tabla Involucra
-- Tabla Tarjeta_Circulacion
-- Tabla Pertenece
-- Tabla Fue_Propietario
-- Tabla Multa


-- Tabla Persona
CREATE TABLE Persona(
	RFC VARCHAR(13),
	Nombre VARCHAR(80),
	Apellido_Paterno VARCHAR(80),
	Apellido_Materno VARCHAR(80),
	Genero VARCHAR(1),
	Fecha_Nacimiento DATE,
	Telefono VARCHAR(14),
	Correo_Electronico VARCHAR(100),
	Calle VARCHAR(100),
	Numero VARCHAR(10),
	Colonia VARCHAR(80),
	Delegacion VARCHAR(80),
	Codigo_Postal VARCHAR(5),
	Estado VARCHAR(50)
);
-- Tabla Licencia
CREATE TABLE Licencia(
	IdLicencia VARCHAR(9),
	Puntos_Acumulados INTEGER,
	Tipo VARCHAR(1),
	Vigencia VARCHAR(10),
	Fecha_Vencimiento DATE
);
-- Tabla Infraccion
CREATE TABLE Infraccion(
	IdExpediente INT IDENTITY,
	Fecha DATE,
	Penalizacion INTEGER,
	Hora TIME
);
-- Tabla Ubicacion
CREATE TABLE Ubicacion(
	Ubicacion INT IDENTITY,
	Calle VARCHAR(100),
	Referencia VARCHAR(100)
);
-- Tabla Armadora
CREATE TABLE Armadora(
	NombreArmadora VARCHAR(100),
	Marca VARCHAR(50),
	Calle VARCHAR(100),
	Numero VARCHAR(10),
	Colonia VARCHAR(80),
	Delegacion VARCHAR(80),
	Estado VARCHAR(50), 
	Codigo_Postal VARCHAR(5)
);
-- Tabla Sistema_Camara
CREATE TABLE Sistema_Camara(
	IdCamara INT IDENTITY,
	Colonia VARCHAR(100),
	Calle VARCHAR(100),
	Delegacion VARCHAR(80)
);
-- Tabla EntreCalles
CREATE TABLE EntreCalles(
	Ubicacion INTEGER,
	Calle1 VARCHAR(100),
	Calle2 VARCHAR(100),
	Calle3 VARCHAR(100)
);
-- Tabla Agente
CREATE TABLE Agente(
	N_Registro_Personal VARCHAR(6),
	RFC VARCHAR(13),
	Sector VARCHAR(100)
); 
-- Tabla Con_Licencia
CREATE TABLE Con_Licencia(
	IdLicencia VARCHAR(9),
	RFC VARCHAR(13)
);
-- Tabla Comete
CREATE TABLE Comete(
	IdExpediente INTEGER,
	RFC VARCHAR(13)
);
-- Tabla Crea
CREATE TABLE Crea(
	IdExpediente INTEGER,
	IdCamara INTEGER,
	Velocidad_Infraccion FLOAT
);
-- Tabla Impone
CREATE TABLE Impone(
	IdExpediente INTEGER,
	Ubicacion INTEGER,
	N_Registro_Personal VARCHAR(6),
	Articulo VARCHAR(20),
	Municipio VARCHAR(80)
);
-- Tabla Modelo
CREATE TABLE Modelo(
	Modelo_Nombre VARCHAR(100),
	NombreArmadora VARCHAR(100),
	Cilindros INTEGER,
	Transmision VARCHAR(10),
	Tipo VARCHAR(20),
	Litros_Motor FLOAT,
	Capacidad_Tanque INTEGER,
	Pasajeros INTEGER, 
	Espacio_Equipaje FLOAT,
	PaisFabricacion VARCHAR(100)
);
-- Tabla Vehiculo
CREATE TABLE Vehiculo(
	Placas VARCHAR(10),
	NumSerie VARCHAR(17),
	Litros_Motor FLOAT,
	Color VARCHAR(50),
	Capacidad_Tanque INTEGER,
	Pasajeros INTEGER,
	Fecha_asignacion DATE,
	Modelo_Nombre VARCHAR(100)
);
-- Tabla Fue_Propiedad
CREATE TABLE Fue_propiedad(
	Placas VARCHAR(10),
	Fecha_Inicio DATE,
	Fecha_Fin DATE,
	Placas_ant VARCHAR(10),
	Edo_Registro VARCHAR(100)
);
-- Tabla Involucra
CREATE TABLE Involucra(
	IdExpediente INTEGER,
	Placas VARCHAR(10)
);
-- Tabla Tarjeta_Circulacion
CREATE TABLE Tarjeta_Circulacion(
	Num_Tarjeta INT IDENTITY,
	Vigencia VARCHAR(10),
	Fecha_vencimiento DATE,
	Placas VARCHAR(10)
);
-- Tabla Pertenece
CREATE TABLE Pertenece(
	Placas VARCHAR(10),
	RFC VARCHAR(13)
);
-- Tabla Fue_Propietario
CREATE TABLE Fue_Propietario(
	Placas VARCHAR(10),
	RFC VARCHAR(13)
);
-- Tabla Multa
CREATE TABLE Multa(
	IdMulta INT IDENTITY,
	Num_Tarjeta INTEGER,
	IdExpediente INTEGER,
	IdLicencia VARCHAR(9),
	Estatus VARCHAR(10),
	Importe DECIMAL
);

USE MULTAS_CDMX;
/*
		---------------- Restricciones ----------------
*/

/*
	NOT NULL
*/

-- Tabla Persona
	ALTER TABLE Persona ALTER COLUMN RFC VARCHAR(13) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Nombre VARCHAR(80) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Apellido_Materno VARCHAR(80) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Genero VARCHAR(1) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Fecha_Nacimiento DATE NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Telefono VARCHAR(14) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Correo_Electronico VARCHAR(100) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Calle VARCHAR(100) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Numero VARCHAR(10) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Colonia VARCHAR(80) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Delegacion VARCHAR(80) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Codigo_Postal VARCHAR(5) NOT NULL;
	ALTER TABLE Persona ALTER COLUMN Estado VARCHAR(50) NOT NULL;
-- Tabla Licencia
	ALTER TABLE Licencia ALTER COLUMN IdLicencia VARCHAR(9) NOT NULL;
	ALTER TABLE Licencia ALTER COLUMN Puntos_Acumulados INTEGER NOT NULL;
	ALTER TABLE Licencia ALTER COLUMN Tipo VARCHAR(1) NOT NULL;
	ALTER TABLE Licencia ALTER COLUMN Vigencia VARCHAR(10) NOT NULL;
-- Tabla Infraccion
	ALTER TABLE Infraccion ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Infraccion ALTER COLUMN Fecha DATE NOT NULL;
	ALTER TABLE Infraccion ALTER COLUMN Penalizacion INTEGER NOT NULL;
	ALTER TABLE Infraccion ALTER COLUMN Hora TIME(7) NOT NULL;
-- Tabla Ubicacion
	ALTER TABLE Ubicacion ALTER COLUMN Ubicacion INTEGER NOT NULL;
	ALTER TABLE Ubicacion ALTER COLUMN Calle VARCHAR(100) NOT NULL;
	ALTER TABLE Ubicacion ALTER COLUMN Referencia VARCHAR(100) NOT NULL;
-- Tabla Armadora
	ALTER TABLE Armadora ALTER COLUMN NombreArmadora VARCHAR(100) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Marca VARCHAR(50) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Calle VARCHAR(100) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Numero VARCHAR(10) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Colonia VARCHAR(80) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Delegacion VARCHAR(80) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Estado VARCHAR(50) NOT NULL;
	ALTER TABLE Armadora ALTER COLUMN Codigo_Postal VARCHAR(5) NOT NULL;
-- Tabla Sistema_Camara
	ALTER TABLE Sistema_Camara ALTER COLUMN IdCamara INTEGER NOT NULL;
	ALTER TABLE Sistema_Camara ALTER COLUMN Colonia VARCHAR(100) NOT NULL;
	ALTER TABLE Sistema_Camara ALTER COLUMN Calle VARCHAR(100) NOT NULL;
	ALTER TABLE Sistema_Camara ALTER COLUMN Delegacion VARCHAR(80) NOT NULL; 
-- Tabla EntreCalles
	ALTER TABLE EntreCalles ALTER COLUMN Ubicacion INTEGER NOT NULL;
	ALTER TABLE EntreCalles ALTER COLUMN Calle1 VARCHAR(100) NOT NULL;
	ALTER TABLE EntreCalles ALTER COLUMN Calle2 VARCHAR(100) NOT NULL;
	ALTER TABLE EntreCalles ALTER COLUMN Calle3 VARCHAR(100) NOT NULL;
-- Tabla Agente
	ALTER TABLE Agente ALTER COLUMN n_Registro_Personal VARCHAR(6) NOT NULL;
	ALTER TABLE Agente ALTER COLUMN Sector VARCHAR(100) NOT NULL;
	ALTER TABLE Agente ALTER COLUMN RFC VARCHAR(13) NOT NULL;
-- Tabla Con_Licencia
	ALTER TABLE Con_Licencia ALTER COLUMN IdLicencia VARCHAR(9) NOT NULL;
	ALTER TABLE Con_Licencia ALTER COLUMN RFC VARCHAR(13) NOT NULL;
-- Tabla Comete
	ALTER TABLE Comete ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Comete ALTER COLUMN RFC VARCHAR(13) NOT NULL;
-- Tabla Crea
	ALTER TABLE Crea ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Crea ALTER COLUMN IdCamara INTEGER NOT NULL;
	ALTER TABLE Crea ALTER COLUMN Velocidad_Infraccion FLOAT NOT NULL;
-- Tabla Impone
	ALTER TABLE Impone ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Impone ALTER COLUMN Ubicacion INTEGER NOT NULL;
	ALTER TABLE Impone ALTER COLUMN N_Registro_Personal VARCHAR(6) NOT NULL;
	ALTER TABLE Impone ALTER COLUMN Articulo VARCHAR(20) NOT NULL;
	ALTER TABLE Impone ALTER COLUMN Municipio VARCHAR(80) NOT NULL;
-- Tabla Modelo
	ALTER TABLE Modelo ALTER COLUMN Modelo_Nombre VARCHAR(100) NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN NombreArmadora VARCHAR(100) NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Cilindros INTEGER NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Transmision VARCHAR(10) NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Tipo VARCHAR(20) NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Litros_Motor FLOAT NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Capacidad_tanque INTEGER NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Pasajeros INTEGER NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN Espacio_Equipaje FLOAT NOT NULL;
	ALTER TABLE Modelo ALTER COLUMN PaisFabricacion VARCHAR(100) NOT NULL;
-- Tabla Vehiculo
	ALTER TABLE Vehiculo ALTER COLUMN Placas VARCHAR(10) NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN NumSerie VARCHAR(17) NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Litros_Motor FLOAT NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Color VARCHAR(50) NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Capacidad_Tanque INTEGER NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Pasajeros INTEGER NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Fecha_asignacion DATE NOT NULL;
	ALTER TABLE Vehiculo ALTER COLUMN Modelo_Nombre VARCHAR(100) NOT NULL;
-- Tabla Fue_Propiedad
	ALTER TABLE Fue_propiedad ALTER COLUMN Placas VARCHAR(10) NOT NULL;
	ALTER TABLE Fue_propiedad ALTER COLUMN Fecha_Inicio DATE NOT NULL;
	ALTER TABLE Fue_propiedad ALTER COLUMN Fecha_Fin DATE NOT NULL;
	ALTER TABLE Fue_propiedad ALTER COLUMN Placas_ant VARCHAR(10) NOT NULL;
	ALTER TABLE Fue_propiedad ALTER COLUMN Edo_registro VARCHAR(100) NOT NULL;
-- Tabla Involucra
	ALTER TABLE Involucra ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Involucra ALTER COLUMN Placas VARCHAR(10) NOT NULL;
-- Tabla Tarjeta_Circulacion
	ALTER TABLE Tarjeta_Circulacion ALTER COLUMN Num_Tarjeta INTEGER NOT NULL;
	ALTER TABLE Tarjeta_Circulacion ALTER COLUMN Vigencia VARCHAR(10) NOT NULL;
	ALTER TABLE Tarjeta_Circulacion ALTER COLUMN Fecha_vencimiento DATE NOT NULL;
	ALTER TABLE Tarjeta_Circulacion ALTER COLUMN Placas VARCHAR(10) NOT NULL;
-- Tabla Pertenece
	ALTER TABLE Pertenece ALTER COLUMN Placas VARCHAR(10) NOT NULL;
	ALTER TABLE Pertenece ALTER COLUMN RFC VARCHAR(13) NOT NULL;
-- Tabla Fue_Propietario
	ALTER TABLE Fue_Propietario ALTER COLUMN Placas VARCHAR(10) NOT NULL;
	ALTER TABLE Fue_Propietario ALTER COLUMN RFC VARCHAR(13) NOT NULL;
-- Tabla Multa
	ALTER TABLE Multa ALTER COLUMN IdMulta INTEGER NOT NULL;
	ALTER TABLE Multa ALTER COLUMN Num_Tarjeta INTEGER NOT NULL
	ALTER TABLE Multa ALTER COLUMN IdExpediente INTEGER NOT NULL;
	ALTER TABLE Multa ALTER COLUMN IdLicencia VARCHAR(9) NOT NULL;
	ALTER TABLE Multa ALTER COLUMN Estatus VARCHAR(10) NOT NULL;
	ALTER TABLE Multa ALTER COLUMN Importe DECIMAL NOT NULL;


/*
	UNIQUE
*/

-- Tabla Persona
	ALTER TABLE Persona ADD CONSTRAINT uc_Persona_RFC UNIQUE(RFC);
	ALTER TABLE Persona ADD CONSTRAINT uc_Persona_Correo_Electronico UNIQUE(Correo_Electronico);
-- Tabla Licencia
	ALTER TABLE Licencia ADD CONSTRAINT uc_Licencia_IdLicencia UNIQUE(IdLicencia);	
-- Tabla Infraccion
	 ALTER TABLE Infraccion ADD CONSTRAINT uc_Infraccion_IdExpediente UNIQUE(IdExpediente);
-- Tabla Ubicacion
	ALTER TABLE Ubicacion ADD CONSTRAINT uc_Ubicacion_Ubicacion UNIQUE(Ubicacion);
-- Tabla Armadora
	ALTER TABLE Armadora ADD CONSTRAINT uc_Armadora_NombreArmadora UNIQUE(NombreArmadora);
-- Tabla Sistema_Camara
	ALTER TABLE Sistema_Camara ADD CONSTRAINT uc_Sistema_Camara_IdCamara UNIQUE(IdCamara);
-- Tabla EntreCalles
	ALTER TABLE EntreCalles ADD CONSTRAINT uc_EntreCalles_Ubicacion UNIQUE(Ubicacion);
-- Tabla Agente
	ALTER TABLE Agente ADD CONSTRAINT uc_Agente_nRegistroPersonal UNIQUE(N_Registro_Personal);
	ALTER TABLE Agente ADD CONSTRAINT uc_Agente_RFC UNIQUE(RFC);
-- Tabla Con_Licencia
	ALTER TABLE Licencia ADD CONSTRAINT uc_Con_Licencia_IdLicencia UNIQUE(IdLicencia);
-- Tabla Comete
	ALTER TABLE Comete ADD CONSTRAINT uc_Comete_IdInfraccion UNIQUE(IdExpediente);
-- Tabla Crea
	ALTER TABLE Crea ADD CONSTRAINT uc_Crea_IdExpediente UNIQUE(IdExpediente);
-- Tabla Impone
	ALTER TABLE Impone ADD CONSTRAINT uc_Impone_IdExpediente UNIQUE(IdExpediente);
-- Tabla Modelo
	ALTER TABLE Modelo ADD CONSTRAINT uc_Modelo_ModeloNombre UNIQUE(Modelo_Nombre);
-- Tabla Vehiculo
	ALTER TABLE Vehiculo ADD CONSTRAINT uc_Vehiculo_Placas UNIQUE(Placas);
	ALTER TABLE Vehiculo ADD CONSTRAINT uc_Vehiculo_NumSerie UNIQUE(NumSerie);
-- Tabla Fue_Propiedad
	ALTER TABLE Fue_propiedad ADD CONSTRAINT uc_Fuepropiedad_Placas UNIQUE(Placas);
	ALTER TABLE Fue_propiedad ADD CONSTRAINT uc_Fuepropiedad_Placasant UNIQUE(Placas_ant);
-- Tabla Involucra
	ALTER TABLE Involucra ADD CONSTRAINT uc_Involucra_IdExpediente UNIQUE(IdExpediente);
-- Tabla Tarjeta_Circulacion
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT uc_TarjetaCirculacion_Num_Tarjeta UNIQUE(Num_Tarjeta);
-- Tabla Pertenece
	ALTER TABLE Pertenece ADD CONSTRAINT uc_Pertenece_Placas UNIQUE(Placas);
-- Tabla Fue_Propietario
	-- NO TIENE
-- Tabla Multa
	ALTER TABLE Multa ADD CONSTRAINT uc_Multa_IdMulta UNIQUE(IdMulta);
	ALTER TABLE Multa ADD CONSTRAINT uc_Multa_IdExpediente UNIQUE(IdExpediente);

/*
	CHECK
*/

-- Tabla Persona
	ALTER TABLE Persona ADD CONSTRAINT ck_PersonaRFCFormato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
	ALTER TABLE Persona ADD CONSTRAINT ck_Persona_Telefono_Formato CHECK(Telefono LIKE('[0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9]'));
	ALTER TABLE Persona ADD CONSTRAINT ck_PersonaCodigoPostalFormato CHECK(Codigo_Postal LIKE('[0-9][0-9][0-9][0-9][0-9]'));
-- Tabla Licencia
	ALTER TABLE Licencia ADD CONSTRAINT ck_LicenciaIdLicenciaFormato CHECK(IdLicencia LIKE('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
	ALTER TABLE Licencia ADD CONSTRAINT ck_LicenciaPuntosacumuladosFormato CHECK(Puntos_acumulados >= 0 AND Puntos_acumulados <= 12);	
	ALTER TABLE Licencia ADD CONSTRAINT ck_LicenciaTipoFormato CHECK(Tipo IN ('A','B'));
	ALTER TABLE Licencia ADD CONSTRAINT ck_LicenciaVigenciaFormato CHECK(Vigencia IN ('ACTIVA','CANCELADA','SUSPENDIDA'));
-- Tabla Infraccion
	ALTER TABLE Infraccion ADD CONSTRAINT ck_Infraccion_IdExpediente_Formato CHECK(IdExpediente > 0);
	ALTER TABLE Infraccion ADD CONSTRAINT ck_Infraccion_Penalizacion_Formato CHECK(Penalizacion IN ('0','1','3','6'));	
-- Tabla Ubicacion
	ALTER TABLE Ubicacion ADD CONSTRAINT ck_Ubicacion_Ubicacion_Formato CHECK(Ubicacion > 0);
-- Tabla Armadora
	ALTER TABLE Armadora ADD CONSTRAINT ck_ArmadoraCodigoPostalFormato CHECK(codigo_Postal LIKE('[0-9][0-9][0-9][0-9][0-9]'));
-- Tabla Sistema_Camara
	ALTER TABLE Sistema_Camara ADD CONSTRAINT ck_Sistema_Camara_IdCamara_Formato CHECK(IdCamara > 0);
-- Tabla EntreCalles
	ALTER TABLE EntreCalles ADD CONSTRAINT ck_EntreCalles_Ubicacion_Formato CHECK(Ubicacion > 0);
-- Tabla Agente
	ALTER TABLE Agente ADD CONSTRAINT ck_AgenteNRegistroPersonalFormato CHECK(N_Registro_Personal LIKE('[0-9][0-9][0-9][0-9][0-9][0-9]'));
	ALTER TABLE Agente ADD CONSTRAINT ck_AgenteRFCFormato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
-- Tabla Con_Licencia
	ALTER TABLE Con_Licencia ADD CONSTRAINT ck_Con_LicenciaIdLicenciaFormato CHECK(IdLicencia LIKE('[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
	ALTER TABLE Con_Licencia ADD CONSTRAINT ck_Con_LicenciaRFCFormato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
-- Tabla Comete
	ALTER TABLE Comete ADD CONSTRAINT ck_Comete_RFC_Formato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
	ALTER TABLE Comete ADD CONSTRAINT ck_Comete_IdExpediente_Formato CHECK(IdExpediente > 0);
-- Tabla Crea
	ALTER TABLE Crea ADD CONSTRAINT ck_Crea_IdExpediente_Formato CHECK(IdExpediente > 0);
	ALTER TABLE Crea ADD CONSTRAINT ck_Crea_IdCamara_Formato CHECK(IdCamara > 0);
	ALTER TABLE Crea ADD CONSTRAINT ck_Crea_Velocidad_Infraccion_Formato CHECK(Velocidad_Infraccion > 0);
-- Tabla Impone
	ALTER TABLE Impone ADD CONSTRAINT ck_ImponeIdExpedienteFormato CHECK(IdExpediente > 0);
	ALTER TABLE Impone ADD CONSTRAINT ck_Impone_N_Registro_Personal_Formato CHECK(N_Registro_Personal > 0);
-- Tabla Modelo
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_CilindrosFormato CHECK(Cilindros > 0);
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_TransmisionFormato CHECK(Transmision IN('AUTOMATICA','MANUAL')); 
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_TipoFormato CHECK(Tipo IN('SEDAN','DEPORTIVO','VAN','MINIVAN','DE LUJO','HYBIRD','PICK-UP','CONVERTIBLE','STATION WAGON','SPORT UTILITIES'));
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_LitrosMotorFormato CHECK(Litros_Motor > 0);
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_CapacidadTanqueFormato CHECK(Capacidad_Tanque > 0);
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_PasajerosFormato CHECK(Pasajeros > 0);
	ALTER TABLE Modelo ADD CONSTRAINT ck_Modelo_EquipajeFormato CHECK(Espacio_Equipaje > 0);
-- Tabla Vehiculo
	ALTER TABLE Vehiculo ADD CONSTRAINT ck_VehiculoPlacasFormato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
	ALTER TABLE Vehiculo ADD CONSTRAINT ck_Vehiculo_NumSerie_Formato CHECK(NumSerie LIKE('[A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][A-Z][0-9][0-9][0-9][0-9][0-9][0-9]'));
	ALTER TABLE Vehiculo ADD CONSTRAINT ck_VehiculoLitrosMotorFormato CHECK(Litros_Motor > 0);
	ALTER TABLE Vehiculo ADD CONSTRAINT ck_VehiculoCapacidadtanqueFormato CHECK(Capacidad_Tanque > 0);
	ALTER TABLE Vehiculo ADD CONSTRAINT ck_VehiculoNumPasajerosFormato CHECK(Pasajeros > 0);
-- Tabla Fue_Propiedad
	ALTER TABLE Fue_propiedad ADD CONSTRAINT ck_FuepropiedadPlacasFormato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
	ALTER TABLE Fue_propiedad ADD CONSTRAINT ck_FuepropiedadPlacasantFormato CHECK(Placas_ant LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
-- Tabla Involucra
	ALTER TABLE Involucra ADD CONSTRAINT ck_Involucra_IdExpediente_Formato CHECK(IdExpediente > 0);
	ALTER TABLE Involucra ADD CONSTRAINT ck_Involucra_Placas_Formato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
-- Tabla Tarjeta_Circulacion
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT ck_TarjetaCirculacion_NumTarjeta_Formato CHECK(Num_Tarjeta > 0);
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT ck_TarjetaCircualcion_Vigencia_Formato CHECK(Vigencia IN ('ACTIVA','CANCELADA','SUSPENDIDA'));
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT ck_TarjetaCirculacion_Placas_Formato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
-- Tabla Pertenece
	ALTER TABLE Pertenece ADD CONSTRAINT ck_Pertenece_Placas_Formato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
	ALTER TABLE Pertenece ADD CONSTRAINT ck_Pertenece_RFC_Formato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
-- Tabla Fue_Propietario
	ALTER TABLE Fue_Propietario ADD CONSTRAINT ck_Fue_Propietario_Placas_Formato CHECK(Placas LIKE ('[A-Z][0-9][0-9]-[A-Z][A-Z][A-Z]'));
	ALTER TABLE Fue_Propietario ADD CONSTRAINT ck_Fue_Propietario_RFC_Formato CHECK(RFC LIKE('[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
-- Tabla Multa
	ALTER TABLE Multa ADD CONSTRAINT ck_Multa_IdMultaFormato CHECK(IdMulta > 0);
	ALTER TABLE Multa ADD CONSTRAINT ck_Multa_Num_Tarjeta_Formato CHECK(Num_Tarjeta > 0);
	ALTER TABLE Multa ADD CONSTRAINT ck_Multa_IdExpediente_Formato CHECK(IdExpediente > 0);
	ALTER TABLE Multa ADD CONSTRAINT ck_Multa_IdLicencia_Formato CHECK(Num_Tarjeta > 0);
	ALTER TABLE Multa ADD CONSTRAINT ck_MultaEstatusFormato CHECK(Estatus IN ('PAGADO','NO PAGADO'));
	ALTER TABLE Multa ADD CONSTRAINT ck_MultaImporteFormato CHECK(Importe > 0);

		USE MULTAS_CDMX;
/*
	PRIMARY KEY
*/
-- Tabla Persona
	ALTER TABLE Persona ADD CONSTRAINT pk_Persona_RFC PRIMARY KEY (RFC);
-- Tabla Licencia
	ALTER TABLE Licencia ADD CONSTRAINT pk_Licencia_IdLicencia PRIMARY KEY (IdLicencia);
-- Tabla Infraccion
	ALTER TABLE Infraccion ADD CONSTRAINT pk_Infraccion_IdExpediente PRIMARY KEY (IdExpediente);
-- Tabla Ubicacion
	ALTER TABLE Ubicacion ADD CONSTRAINT pk_Ubicacion_Ubicacion PRIMARY KEY (Ubicacion);
-- Tabla Armadora
	ALTER TABLE Armadora ADD CONSTRAINT pk_Armadora_Nombre_Armadora PRIMARY KEY (NombreArmadora);
-- Tabla Sistema_Camara
	ALTER TABLE Sistema_Camara ADD CONSTRAINT pk_Sistema_Camara_IdCamara PRIMARY KEY (IdCamara);
-- Tabla EntreCalles
	-- NO TIENE
-- Tabla Agente
	ALTER TABLE Agente ADD CONSTRAINT pk_Agente_N_Registro_Personal PRIMARY KEY (N_Registro_Personal);
-- Tabla Con_Licencia
	-- NO TIENE
-- Tabla Comete
	-- NO TIENE
-- Tabla Crea
	-- NO TIENE
-- Tabla Impone
	-- NO TIENE
-- Tabla Modelo
	ALTER TABLE Modelo ADD CONSTRAINT pk_Modelo_Modelo_Nombre PRIMARY KEY (Modelo_Nombre);
-- Tabla Vehiculo
	ALTER TABLE Vehiculo ADD CONSTRAINT pk_Vehiculo_Placas PRIMARY KEY (Placas);
-- Tabla Fue_Propiedad
	-- NO TIENE
-- Tabla Involucra
	-- NO TIENE
-- Tabla Tarjeta_Circulacion
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT pk_Tarjeta_Circulacion_Num_Tarjeta PRIMARY KEY (Num_Tarjeta);
-- Tabla Pertenece
	-- NO TIENE
-- Tabla Fue_Propietario
	-- NO TIENE
-- Tabla Multa
	ALTER TABLE Multa ADD CONSTRAINT pk_Multa_IdMulta PRIMARY KEY (IdMulta);

/*
	FOREIGN KEY
*/

-- Tabla Persona
	-- NO TIENE
-- Tabla Licencia
	-- NO TIENE
-- Tabla Infraccion
	-- NO TIENE
-- Tabla Ubicacion
	-- NO TIENE
-- Tabla Armadora
	-- NO TIENE
-- Tabla Sistema_Camara
	-- NO TIENE 
-- Tabla EntreCalles
	ALTER TABLE EntreCalles ADD CONSTRAINT fk_EntreCalles_Ubicacion FOREIGN KEY (Ubicacion) REFERENCES Ubicacion (Ubicacion) ON UPDATE CASCADE ON DELETE CASCADE;
-- Tabla Agente
	ALTER TABLE Agente ADD CONSTRAINT fk_Agente_RFC FOREIGN KEY (RFC) REFERENCES Persona(RFC) ON UPDATE CASCADE;
-- Tabla Con_Licencia
	ALTER TABLE Con_Licencia ADD CONSTRAINT fk_Con_Licencia_IdLicencia FOREIGN KEY (IdLicencia) REFERENCES Licencia (IdLicencia) ON UPDATE CASCADE;
	ALTER TABLE Con_Licencia ADD CONSTRAINT fk_Con_Licencia_RFC FOREIGN KEY (RFC) REFERENCES Persona (RFC) ON UPDATE CASCADE;
-- Tabla Comete
	ALTER TABLE Comete ADD CONSTRAINT fk_Comete_IdExpediente FOREIGN KEY (IdExpediente) REFERENCES Infraccion (IdExpediente) ON UPDATE CASCADE ON DELETE CASCADE;
	ALTER TABLE Comete ADD CONSTRAINT fk_Comete_RFC FOREIGN KEY (RFC) REFERENCES Persona (RFC) ON UPDATE CASCADE;	
-- Tabla Crea
	ALTER TABLE Crea ADD CONSTRAINT fk_Crea_IdExpediente FOREIGN KEY (IdExpediente) REFERENCES Infraccion (IdExpediente) ON UPDATE CASCADE ON DELETE CASCADE;
	ALTER TABLE Crea ADD CONSTRAINT fk_Crea_IdCamara FOREIGN KEY (IdCamara) REFERENCES Sistema_Camara (IdCamara) ON UPDATE CASCADE;	
-- Tabla Impone
	ALTER TABLE Impone ADD CONSTRAINT fk_Impone_IdExpediente FOREIGN KEY (IdExpediente) REFERENCES Infraccion (IdExpediente) ON UPDATE CASCADE ON DELETE CASCADE;
	ALTER TABLE Impone ADD CONSTRAINT fk_Impone_Ubicacion FOREIGN KEY (Ubicacion) REFERENCES Ubicacion (Ubicacion) ON UPDATE CASCADE;
	ALTER TABLE Impone ADD CONSTRAINT fk_Impone_N_Registro_Personal FOREIGN KEY (N_Registro_Personal) REFERENCES Agente (N_Registro_Personal) ON UPDATE CASCADE;
-- Tabla Modelo
	ALTER TABLE Modelo ADD CONSTRAINT fk_Modelo_NombreArmadora FOREIGN KEY (NombreArmadora) REFERENCES Armadora (NombreArmadora) ON UPDATE CASCADE;
-- Tabla Vehiculo
	ALTER TABLE Vehiculo ADD CONSTRAINT fk_Vehiculo_Modelo_Nombre FOREIGN KEY (Modelo_Nombre) REFERENCES Modelo (Modelo_Nombre) ON UPDATE CASCADE;
-- Tabla Fue_Propiedad
	ALTER TABLE Fue_Propiedad ADD CONSTRAINT fk_Fue_Propiedad_Placas FOREIGN KEY (Placas) REFERENCES Vehiculo (Placas)
-- Tabla Involucra
	ALTER TABLE Involucra ADD CONSTRAINT fk_Involucra_IdExpediente FOREIGN KEY (IdExpediente) REFERENCES Infraccion (IdExpediente) ON UPDATE CASCADE ON DELETE CASCADE; 
	ALTER TABLE Involucra ADD CONSTRAINT fk_Involucra_Placas FOREIGN KEY (Placas) REFERENCES Vehiculo (Placas) ON UPDATE CASCADE;
-- Tabla Tarjeta_Circulacion
	ALTER TABLE Tarjeta_Circulacion ADD CONSTRAINT fk_Tarjeta_Circulacion_Placas FOREIGN KEY (Placas) REFERENCES Vehiculo (Placas);
-- Tabla Pertenece
	ALTER TABLE Pertenece ADD CONSTRAINT fk_Pertenece_Placas FOREIGN KEY (Placas) REFERENCES Vehiculo (Placas) ON UPDATE CASCADE;
	ALTER TABLE Pertenece ADD CONSTRAINT fk_Pertenece_RFC FOREIGN KEY (RFC) REFERENCES Persona (RFC) ON UPDATE CASCADE;
-- Tabla Fue_Propietario
	ALTER TABLE Fue_Propietario ADD CONSTRAINT fk_Fue_Propietario_Placas FOREIGN KEY (Placas) REFERENCES Vehiculo (Placas) ON UPDATE CASCADE;
	ALTER TABLE Fue_Propietario ADD CONSTRAINT fk_Fue_Propietario_RFC FOREIGN KEY (RFC) REFERENCES Persona (RFC) ON UPDATE CASCADE;	
-- Tabla Multa
	ALTER TABLE Multa ADD CONSTRAINT fk_Multa_Num_Tarjeta FOREIGN KEY (Num_Tarjeta) REFERENCES Tarjeta_Circulacion (Num_Tarjeta);
	ALTER TABLE Multa ADD CONSTRAINT fk_Multa_IdExpediente FOREIGN KEY (IdExpediente) REFERENCES Infraccion (IdExpediente) ON UPDATE CASCADE ON DELETE CASCADE;
	ALTER TABLE Multa ADD CONSTRAINT fk_Multa_IdLicencia FOREIGN KEY (IdLicencia) REFERENCES Licencia (IdLicencia) ON UPDATE CASCADE;
/*
	PRIMARY KEY WITH FOREIGN KEY
*/
-- Tabla Persona
	-- NO TIENE
-- Tabla Licencia
	-- NO TIENE
-- Tabla Infraccion
	-- NO TIENE
-- Tabla Ubicacion
	-- NO TIENE
-- Tabla Armadora
	-- NO TIENE
-- Tabla Sistema_Camara
	-- NO TIENE
-- Tabla EntreCalles
	ALTER TABLE EntreCalles ADD CONSTRAINT pk_EntreCalles_Ubicacion PRIMARY KEY (Ubicacion);
-- Tabla Agente
	-- NO TIENE
-- Tabla Con_Licencia
	ALTER TABLE Con_Licencia ADD CONSTRAINT pk_Con_Licencia_IdLicencia PRIMARY KEY (IdLicencia);
-- Tabla Comete
	ALTER TABLE Comete ADD CONSTRAINT pk_Comete_IdExpediente PRIMARY KEY (IdExpediente);
-- Tabla Crea
	ALTER TABLE Crea ADD CONSTRAINT pk_Crea_IdExpediente_IdCamara PRIMARY KEY (IdExpediente,IdCamara);
-- Tabla Impone
	ALTER TABLE Impone ADD CONSTRAINT pk_Impone_IdExpediente PRIMARY KEY (IdExpediente);	
-- Tabla Modelo
	-- NO TIENE
-- Tabla Vehiculo
	-- NO TIENE
-- Tabla Fue_Propiedad
	ALTER TABLE Fue_Propiedad ADD CONSTRAINT pk_Fue_Propiedad_Placas PRIMARY KEY (Placas);
-- Tabla Involucra
	ALTER TABLE Involucra ADD CONSTRAINT pk_Involucra_IdExpediente PRIMARY KEY (IdExpediente)
-- Tabla Tarjeta_Circulacion
	-- NO TIENE
-- Tabla Pertenece
	ALTER TABLE Pertenece ADD CONSTRAINT pk_Pertenece_Placas PRIMARY KEY (Placas);
-- Tabla Fue_Propietario
	ALTER TABLE Fue_Propietario ADD CONSTRAINT pk_Pertenece_Placas_RFC PRIMARY KEY (Placas,RFC); 
-- Tabla Multa
	-- NO TIENE