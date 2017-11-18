
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[tb_gastosg]                                    
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
           WHERE TABLE_SCHEMA='db_manufactura' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_gastosg')
	BEGIN
		DROP TABLE [db_manufactura].[tb_gastosg];
	END
	GO
	CREATE TABLE  [db_manufactura].[tb_gastosg](
	uid_gastosg VARCHAR(36) NOT NULL  PRIMARY KEY(uid_gastosg),
descripciongastosg VARCHAR(100) NOT NULL ,
estado BIT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
