-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-09-02 00:18:01 CST
--   site:      SQL Server 2000
--   type:      SQL Server 2000




CREATE
  TABLE ABONOS
  (
    CODIGO_ABONO  NUMERIC (12) NOT NULL ,
    NUMERO_CUENTA NUMERIC (12) NOT NULL ,
    FECHA_ABONADO DATETIME ,
    MONTO FLOAT ,
    COMENTARIO            VARCHAR ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE ABONOS ADD CONSTRAINT ABONOS_PK PRIMARY KEY CLUSTERED (CODIGO_ABONO
)
GO

CREATE
  TABLE A_CUENTAS
  (
    NUMERO_CUENTA  NUMERIC (12) NOT NULL ,
    ID_EMPLEADO    NUMERIC (12) NOT NULL ,
    TIPO_CUENTA    CHAR (1) ,
    FECHA_APERTURA DATETIME ,
    SALDO FLOAT ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE A_CUENTAS ADD CONSTRAINT A_CUENTAS_PK PRIMARY KEY CLUSTERED (
NUMERO_CUENTA)
GO

CREATE
  TABLE EMPLEADO
  (
    ID_EMPLEADO        NUMERIC (12) NOT NULL ,
    CORREO_ELECTRONICO VARCHAR (100) NOT NULL ,
    PRIMER_NOMBRE      VARCHAR ,
    SEGUNDO_NOMBRE     VARCHAR ,
    PRIMER_APELLIDO    VARCHAR ,
    SEGUNDO_APELLIDO   VARCHAR ,
    DIRECCION          VARCHAR ,
    FECHA_INICIO       DATETIME ,
    FECHA_NACIMIENTO   DATETIME ,
    CORREO_PRIMARIO NCHAR (100) ,
    CORREO_SECUNDARIO NCHAR (100) ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY CLUSTERED (
ID_EMPLEADO)
GO

CREATE
  TABLE PAGOS
  (
    NUMERO_PAGO     NUMERIC (12) NOT NULL ,
    NUMERO_PRESTAMO NUMERIC (12) NOT NULL ,
    FECHA           DATETIME ,
    MONTO FLOAT ,
    INTERESES_PAGADOS FLOAT ,
    CAPITAL_PAGADOS FLOAT ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE PAGOS ADD CONSTRAINT PAGOS_PK PRIMARY KEY CLUSTERED (
NUMERO_PRESTAMO, NUMERO_PAGO)
GO

CREATE
  TABLE PERSONAEXT_PRESTAMO
  (
    CODIGO_PERSONA_EXTERNA NUMERIC (12) NOT NULL ,
    NUMERO_PRESTAMO        NUMERIC (12) NOT NULL
  )
GO
ALTER TABLE PERSONAEXT_PRESTAMO ADD CONSTRAINT PERSONAEXT_PRESTAMO_PK PRIMARY
KEY CLUSTERED (CODIGO_PERSONA_EXTERNA, NUMERO_PRESTAMO)
GO

CREATE
  TABLE PERSONA_EXTERNA
  (
    CODIGO_PERSONA_EXTERNA NUMERIC (12) NOT NULL ,
    PRIMER_NOMBRE          VARCHAR ,
    SEGUNDO_NOMBRE         VARCHAR ,
    PRIMER_APELLIDO        VARCHAR ,
    SEGUNDO_APELLIDO       VARCHAR ,
    PARENTESCO_AVAL        VARCHAR ,
    DIRECCION              VARCHAR ,
    AVAL                   VARCHAR ,
    FECHA_NACIMIENTO       DATETIME ,
    CORREO_PRIMARIO NCHAR (100) ,
    CORREO_SECUNDARIO NCHAR (100) ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE PERSONA_EXTERNA ADD CONSTRAINT PERSONA_EXTERNA_PK PRIMARY KEY
CLUSTERED (CODIGO_PERSONA_EXTERNA)
GO

CREATE
  TABLE PRESTAMOS
  (
    NUMERO_PRESTAMO NUMERIC (12) NOT NULL ,
    ID_EMPLEADO     NUMERIC (12) NOT NULL ,
    PERIODO NCHAR (100) ,
    SALDO FLOAT ,
    EMPLEADO_AVAL NCHAR (100) ,
    MONTO FLOAT ,
    FECHA                 DATETIME ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE PRESTAMOS ADD CONSTRAINT PRESTAMOS_PK PRIMARY KEY CLUSTERED (
NUMERO_PRESTAMO)
GO

CREATE
  TABLE PRIVILEGIOS
  (
    ID_PRIVILEGIO         NUMERIC (12) NOT NULL ,
    NOMBRE                VARCHAR (100) ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE PRIVILEGIOS ADD CONSTRAINT PRIVILEGIOS_PK PRIMARY KEY CLUSTERED (
ID_PRIVILEGIO)
GO

CREATE
  TABLE PRIVILEGIOS_ROLES
  (
    ID_PRIVILEGIO NUMERIC (12) NOT NULL ,
    ID_ROL        NUMERIC (12) NOT NULL
  )
GO
ALTER TABLE PRIVILEGIOS_ROLES ADD CONSTRAINT PRIVILEGIOS_ROLES_PK PRIMARY KEY
CLUSTERED (ID_PRIVILEGIO, ID_ROL)
GO

CREATE
  TABLE ROLES
  (
    ID_ROL                NUMERIC (12) NOT NULL ,
    NOMBRE                VARCHAR (100) ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE ROLES ADD CONSTRAINT ROLES_PK PRIMARY KEY CLUSTERED (ID_ROL)
GO

CREATE
  TABLE TELEFONO_EMPLEADOS
  (
    TELEFONO_EMPLEADO NUMERIC (8) NOT NULL ,
    ID_EMPLEADO       NUMERIC (12) NOT NULL
  )
GO
ALTER TABLE TELEFONO_EMPLEADOS ADD CONSTRAINT TELEFONO_EMPLEADOS_PK PRIMARY KEY
CLUSTERED (TELEFONO_EMPLEADO)
GO

CREATE
  TABLE TELEFONO_PERSONA_E
  (
    TELEFONO_PE            NUMERIC (8) NOT NULL ,
    CODIGO_PERSONA_EXTERNA NUMERIC (12) NOT NULL
  )
GO
ALTER TABLE TELEFONO_PERSONA_E ADD CONSTRAINT TELEFONO_PERSONA_E_PK PRIMARY KEY
CLUSTERED (TELEFONO_PE)
GO

CREATE
  TABLE USUARIOS
  (
    CORREO_ELECTRONICO    VARCHAR (100) NOT NULL ,
    NOMBRE                VARCHAR (100) ,
    CLAVE                 NUMERIC (12) ,
    FECHA_CREACION        DATETIME ,
    FECHA_ACTUALIZACION   DATETIME ,
    USUARIO_CREADOR       VARCHAR (100) ,
    USUARIO_ACTUALIZACION VARCHAR (100)
  )
GO
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_PK PRIMARY KEY CLUSTERED (
CORREO_ELECTRONICO)
GO

CREATE
  TABLE USUARIO_ROLES
  (
    CORREO_ELECTRONICO VARCHAR (100) NOT NULL ,
    ID_ROL             NUMERIC (12) NOT NULL
  )
GO
ALTER TABLE USUARIO_ROLES ADD CONSTRAINT USUARIO_ROLES_PK PRIMARY KEY CLUSTERED
(CORREO_ELECTRONICO, ID_ROL)
GO

ALTER TABLE ABONOS
ADD CONSTRAINT ABONOS_A_CUENTAS_FK FOREIGN KEY
(
NUMERO_CUENTA
)
REFERENCES A_CUENTAS
(
NUMERO_CUENTA
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE A_CUENTAS
ADD CONSTRAINT A_CUENTAS_EMPLEADO_FK FOREIGN KEY
(
ID_EMPLEADO
)
REFERENCES EMPLEADO
(
ID_EMPLEADO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE EMPLEADO
ADD CONSTRAINT EMPLEADO_USUARIOS_FK FOREIGN KEY
(
CORREO_ELECTRONICO
)
REFERENCES USUARIOS
(
CORREO_ELECTRONICO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PAGOS
ADD CONSTRAINT PAGOS_PRESTAMOS_FK FOREIGN KEY
(
NUMERO_PRESTAMO
)
REFERENCES PRESTAMOS
(
NUMERO_PRESTAMO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PERSONAEXT_PRESTAMO
ADD CONSTRAINT PEP_PERSONA_EXTERNA_FK FOREIGN KEY
(
CODIGO_PERSONA_EXTERNA
)
REFERENCES PERSONA_EXTERNA
(
CODIGO_PERSONA_EXTERNA
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PERSONAEXT_PRESTAMO
ADD CONSTRAINT PEP_PRESTAMOS_FK FOREIGN KEY
(
NUMERO_PRESTAMO
)
REFERENCES PRESTAMOS
(
NUMERO_PRESTAMO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PRESTAMOS
ADD CONSTRAINT PRESTAMOS_EMPLEADO_FK FOREIGN KEY
(
ID_EMPLEADO
)
REFERENCES EMPLEADO
(
ID_EMPLEADO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PRIVILEGIOS_ROLES
ADD CONSTRAINT P_R_PRIVILEGIOS_FK FOREIGN KEY
(
ID_PRIVILEGIO
)
REFERENCES PRIVILEGIOS
(
ID_PRIVILEGIO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PRIVILEGIOS_ROLES
ADD CONSTRAINT P_R_ROLES_FK FOREIGN KEY
(
ID_ROL
)
REFERENCES ROLES
(
ID_ROL
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE TELEFONO_EMPLEADOS
ADD CONSTRAINT TE_EMPLEADO_FK FOREIGN KEY
(
ID_EMPLEADO
)
REFERENCES EMPLEADO
(
ID_EMPLEADO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE TELEFONO_PERSONA_E
ADD CONSTRAINT TPE_PERSONA_EXTERNA_FK FOREIGN KEY
(
CODIGO_PERSONA_EXTERNA
)
REFERENCES PERSONA_EXTERNA
(
CODIGO_PERSONA_EXTERNA
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE USUARIO_ROLES
ADD CONSTRAINT UR_ROLES_FK FOREIGN KEY
(
ID_ROL
)
REFERENCES ROLES
(
ID_ROL
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE USUARIO_ROLES
ADD CONSTRAINT UR_USUARIOS_FK FOREIGN KEY
(
CORREO_ELECTRONICO
)
REFERENCES USUARIOS
(
CORREO_ELECTRONICO
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
