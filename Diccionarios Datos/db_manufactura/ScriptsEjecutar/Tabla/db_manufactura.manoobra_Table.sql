
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[tb_manoobra]                                    
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
           AND TABLE_NAME='tb_manoobra')
	BEGIN
		DROP TABLE [db_manufactura].[tb_manoobra];
	END
	GO
	CREATE TABLE  [db_manufactura].[tb_manoobra](
	uid_manoobra VARCHAR(36) NOT NULL  PRIMARY KEY(uid_manoobra),
descripcionmanoobra VARCHAR(100) NOT NULL ,
estado BIT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
