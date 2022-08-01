CREATE TRIGGER EmpleadoTrigger
ON Empleado 
--FOR: Se ejecuta primero el trigger y despues la accion de DML 
--AFTER: Primero se ejecuta la instrucción DML y despues el trigger 
AFTER INSERT 
AS 
	BEGIN 
		DECLARE @NumeroNomina VARCHAR(10)
		DECLARE @IdEmpleado INT
		
		 SET @NumeroNomina = 
		 (
			SELECT CONVERT(VARCHAR,IdEmpleado) +'-'+ CONVERT(VARCHAR,IdEstado) FROM inserted
		 ) 

		 SET @IdEmpleado =
		 (
			SELECT IdEmpleado FROM inserted
		 )


		UPDATE Empleado 
			SET NumeroNomina = @NumeroNomina
			WHERE IdEmpleado  = @IdEmpleado

	END 
	

	INSERT INTO Empleado (Nombre,ApellidoPaterno,ApellidoMaterno,IdEstado) VALUES ('Hernan','Glinz','Mena',3)