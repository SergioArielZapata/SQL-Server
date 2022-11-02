GO
USE Agencia;
GO
-- la cantidad de ambientes no puede ser menor a 0
ALTER TABLE inmuebles.inmueble_ambiente
	ADD CONSTRAINT CK_inmueble_cantidad CHECK( cantidad > 0);

-- el valor del precio debe ser mayor a 0
ALTER TABLE inmuebles.operacion_inmueble
	ADD CONSTRAINT CK_inmueble_precio CHECK( precio > 0);

-- cuando se registra la visita debe ser la fecha actual, no se debe registra fechas anteriores
ALTER TABLE inmuebles.visita
	ADD CONSTRAINT DF_visita_fecha DEFAULT (CONVERT(varchar(15),GETDATE(),112)) FOR fecha;

ALTER TABLE inmuebles.visita
	ADD CONSTRAINT CK_no_fechas_anteriores CHECK (fecha >= getdate());

-- el correo del cliente debe ser unico
ALTER TABLE inmuebles.cliente 
	ADD CONSTRAINT UQ_cliente_correo UNIQUE(email);

ALTER TABLE inmuebles.visita   
DROP CONSTRAINT DF_visita_fecha;

