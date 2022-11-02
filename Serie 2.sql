-- SERIE 2 --
GO
USE base_consorcio;
GO
-- QUITA DE RESTRICCIONES --
-- administrador --
ALTER TABLE administrador DROP CONSTRAINT CK_habitante_viveahi;
ALTER TABLE administrador DROP CONSTRAINT CK_sexo;
ALTER TABLE administrador DROP CONSTRAINT DF__administr__vivea__412EB0B6;
-- conseje --
ALTER TABLE conserje DROP CONSTRAINT CK_estadocivil;
ALTER TABLE conserje DROP CONSTRAINT DF__conserje__estciv__3D5E1FD2;
-- gasto ? --

-- Ejercicio 1 --
SELECT * FROM conserje;

-- Ejercicio 2 --
SELECT idconserje, apeynom FROM conserje;

-- Ejercicio 3 --
SELECT 4+5*3/2-1;
SELECT (4+5)*3/2-1;

-- Ejercicio 4 --
SELECT (((importe/100)*20)+importe) "Sin Formato" FROM gasto;
SELECT ROUND((((importe/100)*20)+importe),1) "Redondeado a 1 digito decimaL" FROM gasto;
SELECT CAST(ROUND((((importe/100)*20)+importe),1) AS DECIMAL(10,1)) "Truncado a 1 digito" FROM gasto;

-- Ejercicio 5 --
SELECT descripcion, poblacion FROM provincia;

-- Ejercicio 6 --
SELECT DISTINCT idprovincia FROM consorcio;

--Ejercicio 7 --
SELECT TOP 15 apeynom FROM conserje;

-- Ejercicio 8 --
SELECT nombre, direccion FROM consorcio WHERE idprovincia=2;

-- Ejercicio 9 --
SELECT nombre, direccion FROM consorcio WHERE nombre LIKE 'EDIFICIO-3%';

-- Ejercicio 10 --
SELECT (CONCAT(apeynom, ' - ', tel, ' - ', CONVERT(varchar,fechnac,106) )) 'Datos personales' FROM administrador WHERE sexo='F';

-- Ejercicio 11 --
SELECT idprovincia, idlocalidad, idconsorcio, idgasto, periodo, fechapago, idtipogasto, importe FROM gasto WHERE (importe >= 10.10) and (importe <= 100.00);

-- Ejercicio 12 --
SELECT idadmin, apeynom, viveahi, tel, sexo, fechnac FROM administrador WHERE CONVERT(varchar, fechnac, 112) BETWEEN '19600101' AND '19703112' ORDER BY fechnac DESC;

-- Ejercicio 13 --
SELECT idprovincia, idlocalidad, descripcion FROM localidad WHERE (idprovincia = 1) or (idprovincia = 2) ORDER BY idprovincia, descripcion ASC;

-- Ejercicio 14 --
SELECT idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin FROM consorcio WHERE SUBSTRING(direccion,5, len(1)) = 'N';

-- Ejercicio 15 --
SELECT TOP 697 idprovincia, idlocalidad, idconsorcio, idgasto, periodo, fechapago, idtipogasto, importe FROM gasto ORDER BY importe DESC;

-- Ejercicio 16 --
SELECT TOP 697 WITH TIES idprovincia, idlocalidad, idconsorcio, idgasto, periodo, fechapago, idtipogasto, importe FROM gasto ORDER BY importe DESC;

-- Ejercicio 17 --
SELECT periodo, fechapago, importe, 
		(CASE
			WHEN (importe <= 10000) THEN (((importe/100)*15)+importe)
			WHEN (importe >= 10000 and importe <= 20000) THEN (((importe/100)*10)+importe)
			WHEN (importe >= 20000) THEN (((importe/100)*5)+importe)
		END) 'Importe Actualizado' FROM gasto;

-- Ejercicio 18 --
SELECT count(CASE WHEN sexo = 'M' THEN sexo END) Masculino, count(CASE WHEN sexo = 'F' THEN sexo END) Femenino FROM administrador;

-- Ejercicio 19 --
SELECT sum(importe) as sumatoria, count(*) as  cantidad, AVG(importe) as promedio FROM gasto;

-- Ejercicio 20 --
--a--
SELECT idtipogasto, sum(importe) as 'Importe Acumulado' FROM gasto GROUP BY idtipogasto;
--b--
select idtipogasto, sum(importe) as 'Importe acumulado' FROM gasto GROUP BY idtipogasto HAVING sum(importe) > 2000000;
--c--
select top 2 idtipogasto, sum(importe) 'Importe acumulado' FROM gasto GROUP BY idtipogasto order by "Importe acumulado" asc;

-- Ejercicio 21 --


-- Clase --
select datediff(year,cj.fechnac,getdate()) as edad, count(*) cantidad from conserje as cj group by datediff(year,cj.fechnac,getdate()) 

select cj.estciv as 'estado civil', count(*) cantidad from conserje as cj group by cj.estciv; 

select cj.estciv as 'estado civil', datediff(year,cj.fechnac,getdate()) as edad, count(*) as cantidad from conserje as cj group by cj.estciv, datediff(year,cj.fechnac,getdate());
use base_consorcio

select * from gasto g where g.idgasto in (3,5,5)
select * from gasto g where g.idtipogasto between 1 and 3

