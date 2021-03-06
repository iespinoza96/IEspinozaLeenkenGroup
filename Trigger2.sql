USE [IEspinozaLeenkenGroup]
GO
/****** Object:  Trigger [dbo].[TriggerEmpleado]    Script Date: 1/13/2022 10:55:30 AM ******/
--- Trigger que genera el numero de nomina de un empleado
-- Un trigger esta anclado a una tabla y funcionan para proteger a la BD de alteraciones
ALTER TRIGGER [dbo].[TriggerEmpleado]
ON [dbo].[Empleado]
AFTER INSERT 
--La diferencia entre AFTER Y FOR es el tiempo de activacion:  
--FOR: activa primero el trigger y despues la instruccion DML  
--AFETER: activa primero la instruccion DML y despues el trigger
AS
BEGIN 
 
	DECLARE @Numero varchar(10)
	DECLARE @IdEmeplado int

	SET @Numero = 
	(
		SELECT CONVERT(VARCHAR(2), IdEstado )+ '-' + CONVERT(VARCHAR(14), IdEmpleado ) FROM Inserted
	)

	SET @IdEmeplado = 
	(
	SELECT IdEmpleado FROM Inserted 
	)

	UPDATE Empleado SET NumeroNomina = @Numero
	WHERE IdEmpleado = @IdEmeplado

END