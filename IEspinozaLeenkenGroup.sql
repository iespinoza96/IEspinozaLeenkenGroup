CREATE DATABASE IEspinozaLeenkenGroup
GO

USE IEspinozaLeenkenGroup
GO

CREATE TABLE CatEntidadFederativa
	(IdEstado INT IDENTITY (1,1) PRIMARY KEY
	,Estado VARCHAR (100))

GO

CREATE TABLE Empleado 
	(IdEmpleado INT IDENTITY (1,1) PRIMARY KEY
	,NumeroNomina VARCHAR(10)
	,Nombre VARCHAR(100)
	,ApellidoPaterno VARCHAR(100)
	,ApellidoMaterno VARCHAR(100)
	,IdEstado INT FOREIGN KEY REFERENCES CatEntidadFederativa(IdEstado))

GO

------------------------------------------------
--Datos de prueba 

--Tabla CatEntidadFederativa 

INSERT INTO CatEntidadFederativa
           (Estado)
     VALUES
           ('CDMX')

INSERT INTO CatEntidadFederativa
           (Estado)
     VALUES
           ('Jalisco')

INSERT INTO CatEntidadFederativa
           (Estado)
     VALUES
           ('Oaxaca')

INSERT INTO CatEntidadFederativa
           (Estado)
     VALUES
           ('Monterrey')

------------------------------------------------
--Datos de prueba 

--Tabla Empleado  

INSERT INTO Empleado
           (NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado)
     VALUES
           ('1234567890'
           ,'Isaac'
           ,'Espinoza'
           ,'Ocampo'
           ,1)
GO

INSERT INTO Empleado
           (NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado)
     VALUES
           ('8552014789'
           ,'David'
           ,'Martinez'
           ,'Gonzalez'
           ,2)
GO

INSERT INTO Empleado
           (NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado)
     VALUES
           ('9510369874'
           ,'Sebastian'
           ,'Hernandez'
           ,'Garcia'
           ,3)
GO

INSERT INTO Empleado
           (NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado)
     VALUES
           ('7530148652'
           ,'Juan'
           ,'Vega'
           ,'Cruz'
           ,4)
GO

----------------------------------------
--STORED PROCEDURE 

--AGREGAR EMPLEADO 

CREATE PROCEDURE EmpleadoAdd
@NumeroNomina VARCHAR (100)
,@Nombre VARCHAR (100)
,@ApellidoPaterno VARCHAR (100)
,@ApellidoMaterno VARCHAR (100)
,@IdEstado INT 
AS
	INSERT INTO Empleado
           (NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado)
     VALUES
           (@NumeroNomina
           ,@Nombre
           ,@ApellidoPaterno
           ,@ApellidoMaterno
           ,@IdEstado)

GO 
--ACTUALIZAR EMPLEADO 

CREATE PROCEDURE EmpleadoUpdate 
@IdEmpleado INT
,@NumeroNomina VARCHAR (100)
,@Nombre VARCHAR (100)
,@ApellidoPaterno VARCHAR (100)
,@ApellidoMaterno VARCHAR (100)
,@IdEstado INT 
AS
	UPDATE Empleado
   SET [NumeroNomina] = @NumeroNomina
      ,[Nombre] = @Nombre
      ,[ApellidoPaterno] = @ApellidoPaterno
      ,[ApellidoMaterno] = @ApellidoMaterno
      ,[IdEstado] = @IdEstado
 WHERE IdEmpleado = @IdEmpleado
GO

--Eliminar 

CREATE PROCEDURE EmpleadoDelete
@IdEmpleado INT
AS 
	DELETE FROM Empleado 
		WHERE IdEmpleado = @IdEmpleado

GO

--Mostrar empleados 

CREATE PROCEDURE EmpleadoGetAll
AS 
	SELECT 
			IdEmpleado 
			,NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado

		   FROM Empleado 
GO

--Mostrar solo un empleado 
CREATE PROCEDURE EmpleadoGeById 
@IdEmpleado INT 
AS 
	SELECT NumeroNomina
           ,Nombre
           ,ApellidoPaterno
           ,ApellidoMaterno
           ,IdEstado

		   FROM Empleado 

			WHERE IdEmpleado = @IdEmpleado
GO


-- SELECCIONAR TODOS LOS ESTADOS 

CREATE PROCEDURE EstadosGetAll
AS
	SELECT IdEstado
      ,Estado
  FROM CatEntidadFederativa
GO

