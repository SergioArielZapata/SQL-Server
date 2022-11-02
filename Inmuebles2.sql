--Agrega una o varias filas nuevas a una tabla o una vista.
GO
USE Agencia;
GO

INSERT INTO inmuebles.encargado(dni, nombre, apellido) VALUES 
(12123123,'Jorge','GOMEZ'),
(22123123,'Samuel','VAZQUES'),
(32123123,'Jaime','ROMERO'),
(42123123,'Francisco','GUTIERREZ');

SELECT * FROM inmuebles.encargado;

INSERT INTO inmuebles.oficina(domicilio, dni) VALUES 
('Junin 2584', 42123123),
('San Juan 1478', 32123123),
('Tucuman 6587', 22123123),
('San Martin 321', 12123123);

SELECT * FROM inmuebles.oficina;

INSERT INTO inmuebles.propietario(cuit, apellido, nombre) VALUES 
(2012123123, 'TOMASO', 'Juan Jose'),
(2022123123, 'TARASCA', 'Federico'),
(2032123123, 'CHILIN', 'Andrea Maria'),
(2042123123, 'GAUNA', 'Mirta'),
(2052123123, 'ZARATE', 'Veronica');

SELECT * FROM inmuebles.propietario;

INSERT INTO inmuebles.cliente(cuit, apellido, nombre, domicilio, email) VALUES
(2112123123, 'ROMERO', 'Juana Manuela', 'Salta 3258', 'juana@hotmail.com'),
(2122123123, 'ZAMUDIO', 'Raimunda', 'Santa Fe 8521', 'raimunda@hotmail.com'),
(2132123123, 'GORRITI', 'Esteban', '9 de Julio 1475', 'esteban@hotmail.com'),
(2142123123, 'PIRAGINE', 'Benjamin', '3 de Abril 8521', 'benjamin@hotmail.com'),
(2142133123, 'IOSCOR', 'Ramon', 'Codoba 521', 'ioscor@hotmail.com');


SELECT * FROM inmuebles.cliente;

INSERT INTO inmuebles.operacion(nombre) VALUES 
('VENTA'),
('ALQUILER'),
('VENTA O ALQUILER');

SELECT * FROM inmuebles.operacion;

INSERT INTO inmuebles.tipo_inmueble(nombre) VALUES
('CASA'),
('DEPARTAMENTO'),
('LOCAL COMERCIAL'),
('QUINTA');

SELECT * FROM inmuebles.tipo_inmueble;

INSERT INTO inmuebles.ambiente(nombre) VALUES
('LIVING/COMEDOR'),
('DORMITORIOS'),
('BAÑOS'),
('COCINAS'),
('COCHERA');

SELECT * FROM inmuebles.ambiente;

INSERT INTO inmuebles.inmueble(cod_oficina, superficie, domicilio, cod_tipo_inmueble, cuit) VALUES
(4, 450, 'Peru 2410', 1, 2042123123),
(1, 830, 'San Lorenzo 1235', 2, 2032123123),
(4, 950, 'San Martin 2584', 3, 2022123123),
(5, 600, 'Roca 6541', 1, 2012123123);

SELECT * FROM inmuebles.inmueble;

INSERT INTO inmuebles.visita(nro_referencia, cod_oficina, fecha, hora, comentario, cuit) VALUES 
(9, 5, 27100222, 1430, 'Falta de pintura',2142133123),
(2, 4, 18092022, 1530, 'Falta de limpieza',2142133123),
(7, 3, 13072022, 1630, 'Techo con goteras',2132123123),
(1, 1, 04052022, 1730, 'Ventanas no se abren',2122123123);

SELECT * FROM inmuebles.visita;

INSERT INTO inmuebles.operacion_inmueble(nro_referencia, cod_oficina, cod_operacion, precio) VALUES 
(9, 5, 2, 24000.50),
(2, 4, 2, 36500.00),
(7, 3, 1, 24000.50),
(1, 1, 2, 24000.50);

SELECT * FROM inmuebles.operacion_inmueble;

INSERT INTO inmuebles.inmueble_ambiente(nro_referencia, cod_oficina, cod_ambiente, cantidad) VALUES 
(9, 5, 2, 3),
(9, 5, 3, 1),
(9, 5, 5, 1),
(2, 4, 2, 2),
(2, 4, 4, 1),
(7, 3, 2, 1),
(7, 3, 1, 1),
(1, 1, 2, 2),
(1, 1, 1, 1);

SELECT * FROM inmuebles.inmueble_ambiente;