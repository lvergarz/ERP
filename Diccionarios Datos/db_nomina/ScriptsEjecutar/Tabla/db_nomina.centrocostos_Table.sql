
/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[tb_centrocostos]                                    
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
           AND TABLE_NAME='tb_centrocostos')
	BEGIN
		DROP TABLE [db_nomina].[tb_centrocostos];
	END
	GO
	CREATE TABLE  [db_nomina].[tb_centrocostos](
	uid_centro VARCHAR(36) NOT NULL  PRIMARY KEY(uid_centro),
codigo_centro VARCHAR(5) NOT NULL ,
descripcion VARCHAR(100) NOT NULL ,
fechacreacion DATETIME NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
