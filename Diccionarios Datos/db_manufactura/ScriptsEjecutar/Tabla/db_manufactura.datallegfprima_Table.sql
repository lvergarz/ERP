
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[tb_datallegfprima]                                    
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
           AND TABLE_NAME='tb_datallegfprima')
	BEGIN
		DROP TABLE [db_manufactura].[tb_datallegfprima];
	END
	GO
	CREATE TABLE  [db_manufactura].[tb_datallegfprima](
	uid_datelleordengf VARCHAR(36) NOT NULL  PRIMARY KEY(uid_datelleordengf),
uid_cabecera VARCHAR(36) NOT NULL ,
uid_gatosf VARCHAR(36) NOT NULL ,
horas INT NOT NULL ,
costo FLOAT NOT NULL ,
porcentaje FLOAT NOT NULL ,
total FLOAT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
