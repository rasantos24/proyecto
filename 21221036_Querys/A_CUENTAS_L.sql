IF OBJECT_ID('SP_A_CUENTAS_CREATE') IS NOT NULL
BEGIN 
DROP PROC SP_A_CUENTAS_CREATE 
END
GO
CREATE PROCEDURE SP_A_CUENTAS_CREATE
  @NUMERO_CUENTA NUMERIC(12),
  @ID_EMPLEADO NUMERIC(12),
  @TIPO_CUENTA CHAR(1),
  @FECHA_APERTURA DATE,
  @SALDO FLOAT,
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
AS
BEGIN
INSERT INTO A_CUENTAS  (
    NUMERO_CUENTA,
    ID_EMPLEADO,
    TIPO_CUENTA,
    FECHA_APERTURA,
    SALDO,
	  FECHA_CREACION,
    FECHA_ACTUALIZACION,
    USUARIO_CREADOR, 
    USUARIO_ACTUALIZACION)
  VALUES (
    @NUMERO_CUENTA,
    @ID_EMPLEADO,
    @TIPO_CUENTA,
    @FECHA_APERTURA,
    @SALDO,
    @FECHA_CREACION,
    @FECHA_ACTUALIZACION,
    @USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION)
      
SELECT 
	  @ID_EMPLEADO = ID_EMPLEADO,
    @TIPO_CUENTA = TIPO_CUENTA,
    @FECHA_APERTURA = FECHA_APERTURA,
    @SALDO = SALDO,
	  @FECHA_CREACION = FECHA_CREACION,
    @FECHA_ACTUALIZACION = FECHA_ACTUALIZACION,
    @USUARIO_CREADOR = USUARIO_CREADOR,
    @USUARIO_ACTUALIZACION = USUARIO_ACTUALIZACION
FROM A_CUENTAS 
WHERE  NUMERO_CUENTA = @NUMERO_CUENTA
END


------------------------------DELETE
IF OBJECT_ID('SP_A_CUENTAS_DELETE') IS NOT NULL
BEGIN 
DROP PROC SP_A_CUENTAS_DELETE
END 
GO
CREATE PROC SP_A_CUENTAS_DELETE 
    @NUMERO_CUENTA NUMERIC
AS 
BEGIN 
DELETE
FROM   A_CUENTAS
WHERE  NUMERO_CUENTA = @NUMERO_CUENTA
 
END
GO


---------------------------------READ
IF OBJECT_ID('SP_A_CUENTAS_READ') IS NOT NULL
BEGIN 
    DROP PROC SP_A_CUENTAS_READ
END 
GO
CREATE PROC SP_A_CUENTAS_READ
    @NUMERO_CUENTA NUMERIC
AS 
BEGIN 
 
    SELECT NUMERO_CUENTA, ID_EMPLEADO, TIPO_CUENTA, FECHA_APERTURA, SALDO, FECHA_CREACION, FECHA_ACTUALIZACION, USUARIO_CREADOR, USUARIO_ACTUALIZACION
    FROM   A_CUENTAS 
    WHERE  (NUMERO_CUENTA = @NUMERO_CUENTA) 
END
GO

-------------------------------UPDATE
IF OBJECT_ID('SP_A_CUENTAS_UPDATE') IS NOT NULL
BEGIN 
DROP PROC SP_A_CUENTAS_UPDATE
END 
GO
CREATE PROC SP_A_CUENTAS_UPDATE
  @NUMERO_CUENTA NUMERIC(12),
  @ID_EMPLEADO NUMERIC(12),
  @TIPO_CUENTA CHAR(1),
  @FECHA_APERTURA DATE,
  @SALDO FLOAT,
  @FECHA_CREACION DATE,
  @FECHA_ACTUALIZACION DATE,
  @USUARIO_CREADOR VARCHAR(100),
  @USUARIO_ACTUALIZACION VARCHAR(100)
AS 
BEGIN 
 
UPDATE A_CUENTAS
SET 
    ID_EMPLEADO = @ID_EMPLEADO,
    TIPO_CUENTA = @TIPO_CUENTA,
    FECHA_APERTURA = @FECHA_APERTURA,
    SALDO = @SALDO,
	  FECHA_CREACION = @FECHA_CREACION,
    FECHA_ACTUALIZACION = @FECHA_ACTUALIZACION,
    USUARIO_CREADOR = @USUARIO_CREADOR,
    USUARIO_ACTUALIZACION = @USUARIO_ACTUALIZACION
WHERE NUMERO_CUENTA = @NUMERO_CUENTA
END
GO