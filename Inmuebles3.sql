GO
USE Agencia;
GO

CREATE TABLE inmuebles.propietario_inmueble(
cuit INT,
CONSTRAINT FK_cuit_prop_propietario_inmueble FOREIGN KEY (cuit) REFERENCES inmuebles.propietario(cuit),
nro_referencia INT,
CONSTRAINT FK_nro_referencia_propietario_inmueble FOREIGN key (nro_referencia) REFERENCES inmuebles.inmueble(nro_referencia),
cod_oficina INT,
CONSTRAINT FK_cod_oficina_propietario_inmueble FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
);

ALTER TABLE inmuebles.inmueble DROP CONSTRAINT FK_cuit_prop_inmueble;
ALTER TABLE inmuebles.inmueble DROP COLUMN cuit;

CREATE TABLE inmuebles.tipo_recurso(
cod_tipo_recurso INT IDENTITY(1,1) CONSTRAINT PK_cod_tipo_recurso PRIMARY KEY,
nombre varchar(254),
);

CREATE TABLE inmuebles.tipo_formato(
cod_tipo_recurso INT,
CONSTRAINT FK_cod_tipo_recurso_tipo_formato FOREIGN KEY (cod_tipo_recurso) REFERENCES inmuebles.tipo_recurso(cod_tipo_recurso),
cod_tipo_formato INT IDENTITY(1,1) CONSTRAINT PK_cod_tipo_formato PRIMARY KEY,
nombre varchar(254),
);

CREATE TABLE inmuebles.galeria(
nro_referencia INT,
CONSTRAINT FK_nro_referencia_galeria FOREIGN KEY (nro_referencia) REFERENCES inmuebles.inmueble(nro_referencia),
cod_oficina INT,
CONSTRAINT FK_cod_oficina_galeria FOREIGN KEY (cod_oficina) REFERENCES inmuebles.oficina(cod_oficina),
cod_recurso INT IDENTITY(1,1) CONSTRAINT PK_cod_recurso PRIMARY KEY,
descripcion varchar(254),
enlace varchar(254),
cod_tipo_formato INT,
CONSTRAINT FK_cod_tipo_formato_galeria FOREIGN KEY (cod_tipo_formato) REFERENCES inmuebles.tipo_formato(cod_tipo_formato),
cod_tipo_recurso INT,
CONSTRAINT FK_cod_tipo_recurso_galeria FOREIGN KEY (cod_tipo_recurso) REFERENCES inmuebles.tipo_recurso(cod_tipo_recurso),
);