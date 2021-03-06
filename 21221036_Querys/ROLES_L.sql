IF OBJECT_ID('SP_ROLES_CREATE') IS NOT NULL
BEGIN 
DROP PROC SP_ROLES_CREATE 
END
GO
CREATE PROCEDURE SP_ROLES_CREATE
  @ID_ROL NUMERIC(12),
  @NOMBRE VARCHAR(100),
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
AS
BEGIN
INSERT INTO ROLES  (
    ID_ROL,
	  NOMBRE,
	  FECHA_CREACION,
    FECHA_ACTUALIZACION,
    USUARIO_CREADOR,
    USUARIO_ACTUALIZACION)
  VALUES (
    @ID_ROL,
	  @NOMBRE,
    @FECHA_CREACION,
    @FECHA_ACTUALIZACION,
    @USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION)
      
SELECT 
	  @NOMBRE = NOMBRE,
	  @FECHA_CREACION = FECHA_CREACION,
    @FECHA_ACTUALIZACION = FECHA_ACTUALIZACION,
    @USUARIO_CREADOR = USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION = USUARIO_ACTUALIZACION
FROM ROLES 
WHERE  ID_ROL = @ID_ROL
END


------------------------------DELETE
IF OBJECT_ID('SP_ROLES_DELETE') IS NOT NULL
BEGIN 
DROP PROC SP_ROLES_DELETE
END 
GO
CREATE PROC SP_ROLES_DELETE 
    @ID_ROL NUMERIC
AS 
BEGIN 
DELETE
FROM   ROLES
WHERE  ID_ROL = @ID_ROL
 
END
GO


---------------------------------READ
IF OBJECT_ID('SP_ROLES_READ') IS NOT NULL
BEGIN 
    DROP PROC SP_ROLES_READ
END 
GO
CREATE PROC SP_ROLES_READ
    @ID_ROL NUMERIC
AS 
BEGIN 
 
    SELECT ID_ROL, NOMBRE, FECHA_CREACION, FECHA_ACTUALIZACION, USUARIO_CREADOR, USUARIO_ACTUALIZACION
    FROM   ROLES  
    WHERE  (ID_ROL = @ID_ROL) 
END
GO

-------------------------------UPDATE
IF OBJECT_ID('SP_ROLES_UPDATE') IS NOT NULL
BEGIN 
DROP PROC SP_ROLES_UPDATE
END 
GO
CREATE PROC SP_ROLES_UPDATE
  @ID_ROL NUMERIC(12),
  @NOMBRE VARCHAR(100),
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
  
AS 
BEGIN 
 
UPDATE ROLES
SET  
    NOMBRE = @NOMBRE,
	  FECHA_CREACION = @FECHA_CREACION,
    FECHA_ACTUALIZACION = @FECHA_ACTUALIZACION,
    USUARIO_CREADOR = @USUARIO_CREADOR,
    USUARIO_ACTUALIZACION = @USUARIO_ACTUALIZACION
WHERE  ID_ROL = @ID_ROL
END
GO