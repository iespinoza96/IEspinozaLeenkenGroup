		--Creación
		CREATE TRIGGER EmpleadoTrigger
		--La tabla en la que estara anclado el trigger 
		ON Empleado 
		-- Tiempo de ejecución / activación de un trigger 
		--FOR: Primero se activa el trigger y despues la instruccion DML
		--AFTER: Primero se activa la instruccion DML y despues el trigger
		AFTER INSERT
		AS 
			BEGIN
				DECLARE @NumeroNomina VARCHAR(10)
				DECLARE @IdEmpleado INT
		
				SET @NumeroNomina =
				(
					SELECT CONVERT(VARCHAR(5),IdEstado) +'-' + CONVERT(VARCHAR(5),IdEmpleado) 
					FROM inserted
					-- Inserted es una tabla temporal 
					-- almacena los datos que se ejecutan durante el trigger
				)
		
				SET @IdEmpleado = 
				(
					SELECT IdEmpleado
						FROM inserted
				)
		
				UPDATE Empleado SET NumeroNomina = @NumeroNomina
				WHERE IdEmpleado = @IdEmpleado
		
			END
		
INSERT INTO Empleado (Nombre,ApellidoPaterno,ApellidoMaterno,IdEstado) VALUES ('Oziel','Silva','Lopez',3)