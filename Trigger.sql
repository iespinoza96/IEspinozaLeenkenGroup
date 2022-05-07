--- Trigger que genera el numero de nomina de un empleado
-- Un trigger esta anclado a una tabla y funcionan para proteger a la BD de alteraciones.

CREATE TRIGGER Trigger_Empleado
ON Empleado
AFTER INSERT
--La diferencia entre AFTER Y FOR es el tiempo de activacion:  
--FOR: activa primero el trigger y despues la instruccion DML  
--AFETER: activa primero la instruccion DML y despues el trigger
AS
BEGIN 
 
	DECLARE @NumeroNomina VARCHAR(10)
	DECLARE @IdEmpleado int

	SET @NumeroNomina = 
	(
		SELECT CONVERT(VARCHAR(2), IdEstado ) + CONVERT(VARCHAR(14), IdEmpleado ) FROM Inserted --Inserted es una tabla temporal que almacena los datos que se ejecutan durante el trigger  
	)

	SET @IdEmpleado = 
	(
	SELECT IdEmpleado FROM Inserted 
	)

	UPDATE Empleado SET NumeroNomina = @NumeroNomina
	WHERE IdEmpleado = @IdEmpleado

END

INSERT INTO Empleado (Nombre,ApellidoPaterno,ApellidoMaterno,IdEstado) VALUES ('Oziel','Silva','Lopez',1)

-- Donde esta alamcenado
--Concepto
--FOR, AFTER
--Convert varchar 
--