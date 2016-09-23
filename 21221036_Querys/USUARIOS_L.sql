IF OBJECT_ID('SP_USUARIOS_CREATE') IS NOT NULL
BEGIN 
DROP PROC SP_USUARIOS_CREATE 
END
GO
CREATE PROCEDURE SP_USUARIOS_CREATE
  @CORREO_ELECTRONICO VARCHAR(100),
  @NOMBRE VARCHAR(100),
  @CLAVE	NUMERIC(12,0),
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
AS
BEGIN
INSERT INTO USUARIOS  (
    CORREO_ELECTRONICO,
	  NOMBRE,
	  CLAVE,
	  FECHA_CREACION,
    FECHA_ACTUALIZACION,
    USUARIO_CREADOR,
    USUARIO_ACTUALIZACION)
  VALUES (
    @CORREO_ELECTRONICO,
	  @NOMBRE,
	  @CLAVE,
    @FECHA_CREACION,
    @FECHA_ACTUALIZACION,
    @USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION)
      
SELECT 
	  @NOMBRE = NOMBRE,
	  @CLAVE = CLAVE,
	  @FECHA_CREACION = FECHA_CREACION,
    @FECHA_ACTUALIZACION = FECHA_ACTUALIZACION,
    @USUARIO_CREADOR = USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION = USUARIO_ACTUALIZACION
FROM USUARIOS 
WHERE  CORREO_ELECTRONICO = @CORREO_ELECTRONICO
END


------------------------------DELETE
IF OBJECT_ID('SP_USUARIOS_DELETE') IS NOT NULL
BEGIN 
DROP PROC SP_USUARIOS_DELETE
END 
GO
CREATE PROC SP_USUARIOS_DELETE 
    @CORREO_ELECTRONICO VARCHAR
AS 
BEGIN 
DELETE
FROM   USUARIOS
WHERE  CORREO_ELECTRONICO = @CORREO_ELECTRONICO
 
END
GO


---------------------------------READ
IF OBJECT_ID('SP_USUARIOS_READ') IS NOT NULL
BEGIN 
    DROP PROC SP_USUARIOS_READ
END 
GO
CREATE PROC SP_USUARIOS_READ
    @CORREO_ELECTRONICO VARCHAR
AS 
BEGIN 
 
    SELECT CORREO_ELECTRONICO, NOMBRE, CLAVE, FECHA_CREACION, FECHA_ACTUALIZACION, USUARIO_CREADOR, USUARIO_ACTUALIZACION
    FROM   USUARIOS  
    WHERE  (CORREO_ELECTRONICO = @CORREO_ELECTRONICO) 
END
GO

-------------------------------UPDATE
IF OBJECT_ID('SP_USUARIOS_UPDATE') IS NOT NULL
BEGIN 
DROP PROC SP_USUARIOS_UPDATE
END 
GO
CREATE PROC SP_USUARIOS_UPDATE
  @CORREO_ELECTRONICO VARCHAR(100),
  @NOMBRE VARCHAR(100),
  @CLAVE	NUMERIC(12,0),
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
  
AS 
BEGIN 
 
UPDATE USUARIOS
SET  
    NOMBRE = @NOMBRE,
	  CLAVE = @CLAVE,
	  FECHA_CREACION = @FECHA_CREACION,
    FECHA_ACTUALIZACION = @FECHA_ACTUALIZACION,
    USUARIO_CREADOR = @USUARIO_CREADOR,
    USUARIO_ACTUALIZACION = @USUARIO_ACTUALIZACION
WHERE  CORREO_ELECTRONICO = @CORREO_ELECTRONICO
END
GO