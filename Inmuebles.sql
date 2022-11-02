CREATE DATABASE Agencia;
GO
USE Agencia;
GO
CREATE SCHEMA inmuebles;

CREATE TABLE inmuebles.encargado(
dni INT CONSTRAINT PK_dni PRIMARY KEY,
nombre varchar(254),
apellido varchar(254),
);

CREATE TABLE inmuebles.oficina(
cod_oficina INT IDENTITY CONSTRAINT PK_cod_oficina PRIMARY KEY,
domicilio varchar(254),
dni INT,
CONSTRAINT FK_dni_oficina FOREIGN KEY (dni) REFERENCES inmuebles.encargado(dni),
);

CREATE TABLE inmuebles.propietario(
cuit INT CONSTRAINT PK_cuit_prop PRIMARY KEY,
apellido varchar(254),
nombre varchar(254),
);

CREATE TABLE inmuebles.cliente(
cuit INT CONSTRAINT PK_cuit_cli PRIMARY KEY,
apellido varchar(254),
nombre varchar(254),
domicilio varchar(254),
email varchar(254),
);

CREATE TABLE inmuebles.operacion(
cod_operacion INT IDENTITY CONSTRAINT PK_cod_operacion PRIMARY KEY,
nombre varchar(254),
);

CREATE TABLE inmuebles.tipo_inmueble(
cod_tipo_inmueble INT IDENTITY CONSTRAINT PK_cod_tipo_inmueble PRIMARY KEY,
nombre varchar(254),
);

CREATE TABLE inmuebles.inmueble(
cod_oficina INT,
CONSTRAINT FK_cod_oficina_inmueble FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
nro_referencia INT IDENTITY CONSTRAINT PK_nro_referencia PRIMARY KEY,
superficie DECIMAL (5,2),
domicilio varchar(254),
cod_tipo_inmueble INT,
CONSTRAINT FK_cod_tipo_inmueble_inmueble FOREIGN KEY (cod_tipo_inmueble) REFERENCES inmuebles.tipo_inmueble(cod_tipo_inmueble),
cuit INT,
CONSTRAINT FK_cuit_prop_inmueble FOREIGN KEY (cuit) REFERENCES inmuebles.propietario(cuit), 
);

CREATE TABLE inmuebles.visita(
nro_referencia INT,
CONSTRAINT FK_nro_referencia_inmueble FOREIGN KEY (nro_referencia) REFERENCES inmuebles.inmueble(nro_referencia),
cod_oficina INT,
CONSTRAINT FK_cod_oficina_oficina FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
nro_visita INT IDENTITY CONSTRAINT PK_nro_visita PRIMARY KEY,
fecha DATE,
hora TIME,
comentario varchar(254),
cuit INT,
CONSTRAINT FK_cuit_cliente_visita FOREIGN KEY (cuit) REFERENCES inmuebles.cliente(cuit),
);

CREATE TABLE inmuebles.operacion_inmueble(
nro_referencia INT,
CONSTRAINT FK_nro_referencia_operacion_inmueble FOREIGN KEY (nro_referencia) REFERENCES inmuebles.inmueble(nro_referencia),
cod_oficina INT,
CONSTRAINT FK_cod_oficina_operacion_inmueble FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
cod_operacion INT,
CONSTRAINT FK_cod_operacion_operacion_inmueble FOREIGN KEY (cod_operacion) REFERENCES inmuebles.operacion(cod_operacion),
precio DECIMAL (8,2),
);

CREATE TABLE inmuebles.ambiente(
cod_ambiente INT IDENTITY CONSTRAINT PK_cod_ambiente PRIMARY KEY,
nombre varchar(254),
);

CREATE TABLE inmuebles.inmueble_ambiente(
nro_referencia INT,
CONSTRAINT FK_nro_referencia_inmueble_ambiente FOREIGN KEY (nro_referencia) REFERENCES inmuebles.inmueble(nro_referencia),
cod_oficina INT,
CONSTRAINT FK_cod_oficina_inmueble_ambiente FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
cod_ambiente INT,
CONSTRAINT FK_cod_ambiente_inmueble_ambiente FOREIGN KEY (cod_ambiente) REFERENCES inmuebles.ambiente(cod_ambiente),
cantidad INT,
);