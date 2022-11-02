CREATE DATABASE Forestal;

USE Forestal;

CREATE SCHEMA empresa;

CREATE TABLE empresa.tipo_empleado(
id_TipoEmpleado INT IDENTITY(1,1) CONSTRAINT PK_id_TipoEmpleado PRIMARY KEY,
nombre VARCHAR(50),
sueldoBasico DECIMAL(10,2),
activo VARCHAR(2),
);

CREATE TABLE empresa.empleados(
cod_empleado INT IDENTITY(1,1) CONSTRAINT PK_cod_empleado PRIMARY KEY,
id_TipoEmpleado INT,
legajo VARCHAR(15),
nombre VARCHAR(50),
apellido VARCHAR(50),
cuil BIGINT,
fecha_ingreso DATE,
activo VARCHAR(2),
CONSTRAINT FK_id_TipoEmpleado_empleados FOREIGN KEY (id_TipoEmpleado) REFERENCES empresa.tipo_empleado(id_TipoEmpleado),
);

CREATE TABLE empresa.corte(
cod_corte INT IDENTITY(1,1) CONSTRAINT PK_cod_corte PRIMARY KEY,
corte VARCHAR(50),
descripcion varchar(200),
precioVenta DECIMAL(10,2),
activo VARCHAR(2),
);

CREATE TABLE empresa.produccion(
id_produccion INT IDENTITY(1,1) CONSTRAINT PK_id_produccion PRIMARY KEY,
cod_corte INT,
CONSTRAINT FK_cod_corte_produccion FOREIGN KEY (cod_corte) REFERENCES empresa.corte(cod_corte),
);

CREATE TABLE empresa.empleados_produccion(
cod_empleado INT,
id_produccion INT,
CONSTRAINT PK_intermedia_produccion PRIMARY KEY (cod_empleado,id_produccion),
CONSTRAINT FK_cod_empleado_emp_produccion FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
CONSTRAINT FK_id_produccion_emp_produccion FOREIGN KEY (id_produccion) REFERENCES empresa.produccion(id_produccion),
);

CREATE TABLE empresa.remito(
primeros INT,
id_remito INT,
id_produccion INT,
fecha DATE,
cantidad INT,
CONSTRAINT PK_nro_remito PRIMARY KEY (primeros,id_remito),
CONSTRAINT FK_id_produccion_remito FOREIGN KEY (id_produccion) REFERENCES empresa.produccion(id_produccion),
);

CREATE TABLE empresa.empleado_remito (
cod_empleado INT,
primeros INT,
id_remito INT,
CONSTRAINT FK_cod_empleado FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
CONSTRAINT FK_primeros_remito FOREIGN KEY (primeros,id_remito) REFERENCES empresa.remito(primeros,id_remito),
);

CREATE TABLE empresa.proveedores(
id_proveedor INT IDENTITY(1,1) CONSTRAINT PK_id_proveedor PRIMARY KEY,
nombre VARCHAR(50),
direccion VARCHAR(50)
);

CREATE TABLE empresa.insumo(
id_insumo INT IDENTITY(1,1) CONSTRAINT PK_id_insumo PRIMARY KEY,
producto VARCHAR(50),
precio DECIMAL(10,2),
proveedor INT,
activo varchar(2),
);
use forestal;

drop table empresa.empleado_insumo;
CREATE TABLE empresa.empleado_insumo(
cod_empleado INT,
id_insumo INT,
fecha DATE,
CONSTRAINT PK_intermedia_insumo PRIMARY KEY(cod_empleado,id_insumo,fecha),
CONSTRAINT FK_cod_empleado_insumo FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
CONSTRAINT FK_cod_id_insumo_insumo FOREIGN KEY (id_insumo) REFERENCES empresa.insumo(id_insumo),
periodo VARCHAR(7),
cantidad int,
);

CREATE TABLE empresa.anticipo(
id_anticipo INT CONSTRAINT PK_id_anticipo PRIMARY KEY,
cod_empleado INT,
fecha DATE,
monto DECIMAL(10,2),
periodo VARCHAR(7),
detalle VARCHAR(200),
CONSTRAINT FK_cod_empleado_anticipo FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
);

CREATE TABLE empresa.tipo_vales(
id_tipo_vale INT IDENTITY(1,1) CONSTRAINT PK_id_tipo_vale PRIMARY KEY,
nombre VARCHAR(50),
direccion VARCHAR(50),
);

CREATE TABLE empresa.vale(
nro_vale INT,
cod_empleado INT,
id_tipo_vale INT,
fecha DATE,
monto DECIMAL(10,2),
periodo VARCHAR(7),
CONSTRAINT FK_cod_empleado_vale FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
CONSTRAINT FK_id_tipo_vale FOREIGN KEY (id_tipo_vale) REFERENCES empresa.tipo_vales(id_tipo_vale)
);

CREATE TABLE empresa.perfil(
id_perfil INT IDENTITY(1,1) CONSTRAINT PK_id_perfil PRIMARY KEY,
perfil VARCHAR(50),
descripcion VARCHAR(250),
);

CREATE TABLE empresa.usuario(
id_usuario INT IDENTITY(1,1) CONSTRAINT PK_id_usuario PRIMARY KEY,
id_perfil INT,
usuario VARCHAR(50),
contrasena VARCHAR(250),
CONSTRAINT FK_id_perfil_usuario FOREIGN KEY (id_perfil) REFERENCES empresa.perfil(id_perfil),
);

CREATE TABLE empresa.acceso(
id_usuario INT,
cod_empleado INT,
CONSTRAINT PK_usuarios_accesos PRIMARY KEY (id_usuario,cod_empleado),
CONSTRAINT FK_id_usuario_acceso FOREIGN KEY (id_usuario) REFERENCES empresa.usuario(id_usuario),
CONSTRAINT FK_id_empleado_acceso FOREIGN KEY (cod_empleado) REFERENCES empresa.empleados(cod_empleado),
);
