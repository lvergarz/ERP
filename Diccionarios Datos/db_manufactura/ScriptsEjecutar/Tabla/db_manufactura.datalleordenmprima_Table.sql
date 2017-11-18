
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[tb_datalleordenmprima]                                    
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
           AND TABLE_NAME='tb_datalleordenmprima')
	BEGIN
		DROP TABLE [db_manufactura].[tb_datalleordenmprima];
	END
	GO
	CREATE TABLE  [db_manufactura].[tb_datalleordenmprima](
	uid_datelleorden VARCHAR(36) NOT NULL  PRIMARY KEY(uid_datelleorden),
uid_cabecera VARCHAR(36) NOT NULL ,
cod_materiaprima VARCHAR(10) NOT NULL ,
cantidad FLOAT NOT NULL ,
costounit FLOAT NOT NULL ,
porcentaje FLOAT NOT NULL ,
costototal FLOAT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
