
/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[tb_parametros]                                    
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
           WHERE TABLE_SCHEMA='db_trazabilidad' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_parametros')
	BEGIN
		DROP TABLE [db_trazabilidad].[tb_parametros];
	END
	GO
	CREATE TABLE  [db_trazabilidad].[tb_parametros](
	uid_parametro VARCHAR(36) NOT NULL  PRIMARY KEY(uid_parametro),
cod_parametro INT NOT NULL ,
valor VARCHAR(2000) NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL ,
fecharegistro DATE NOT NULL ,
fechamodificacion DATE NOT NULL 
	);
 
 
