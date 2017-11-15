
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[tb_login]                                    
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
           WHERE TABLE_SCHEMA='db_seguridad' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_login')
	BEGIN
		DROP TABLE [db_seguridad].[tb_login];
	END
	GO
	CREATE TABLE  [db_seguridad].[tb_login](
	id_login INT NOT NULL  PRIMARY KEY(id_login),
usuario VARCHAR(8) NOT NULL ,
clave VARCHAR(20) NOT NULL ,
fechacreacionlogin DATE NOT NULL ,
fechamodificacion DATE NOT NULL ,
fechaexpiracion DATE NOT NULL ,
estado BIT NOT NULL ,
expira BIT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
