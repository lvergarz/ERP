
/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[tb_empleados]                                    
	--Fecha de creación:  2017/11/10 9:51 AM                                                 
	--Responsable:        mlopez                                                         
	--Funcionalidad:                                                          
/***************************************************************************/
/*                        Cambios Efectuados                               */
	-- Responsable:                                                            
	-- Fecha:                                                                  
	-- descripcion del Cambio:                                                 
/***************************************************************************/

USE[db_comsucre]


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA='db_nomina' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_empleados')
	BEGIN
		DROP TABLE [db_nomina].[tb_empleados];
	END
	GO
	CREATE TABLE  [db_nomina].[tb_empleados](
	uid_codigo VARCHAR(36) NOT NULL  PRIMARY KEY(uid_codigo),
cod_empleado VARCHAR(13) NOT NULL ,
nombres VARCHAR(100) NOT NULL ,
apellidos VARCHAR(100) NOT NULL ,
nacionalidad VARCHAR(50) NOT NULL ,
lnacimiento VARCHAR(50) NOT NULL ,
fechanacimiento DATE NOT NULL ,
estadocivil VARCHAR(20) NOT NULL ,
edad  NOT NULL ,
genero VARCHAR(20) NOT NULL ,
celularcontacto VARCHAR(20) NOT NULL ,
telefonocontacto VARCHAR(20) NOT NULL ,
emailcontacto VARCHAR(80) NOT NULL ,
emailempresa VARCHAR(80) NOT NULL ,
tidentificacion VARCHAR(2) NOT NULL ,
identificación VARCHAR(20) NOT NULL ,
nafiliacioniess VARCHAR(20) NOT NULL ,
nlibretamilitar VARCHAR(20) NOT NULL ,
observaciones VARCHAR(MAX) NOT NULL ,
cod_marcacion VARCHAR(36) NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
