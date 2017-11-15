
/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[tb_marcaciones]                                    
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
           WHERE TABLE_SCHEMA='db_marcaciones' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_marcaciones')
	BEGIN
		DROP TABLE [db_marcaciones].[tb_marcaciones];
	END
	GO
	CREATE TABLE  [db_marcaciones].[tb_marcaciones](
	estadoexistencia VARCHAR(1) NOT NULL ,
uid_marcaciones VARCHAR(36) NOT NULL  PRIMARY KEY(uid_marcaciones),
cod_marcacion VARCHAR(5) NULL ,
nombreemp VARCHAR(100) NULL ,
fechamarc VARCHAR(15) NULL ,
hentrada TIME NULL ,
hsalida TIME NULL ,
horariot VARCHAR(30) NULL 
	);
 
 
