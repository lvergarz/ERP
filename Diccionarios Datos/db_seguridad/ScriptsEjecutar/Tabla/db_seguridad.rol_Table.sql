
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[tb_rol]                                    
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
           AND TABLE_NAME='tb_rol')
	BEGIN
		DROP TABLE [db_seguridad].[tb_rol];
	END
	GO
	CREATE TABLE  [db_seguridad].[tb_rol](
	id_rol VARCHAR(8) NOT NULL  PRIMARY KEY(id_rol),
cod_rol VARCHAR(20) NOT NULL ,
nombrerol VARCHAR(20) NOT NULL ,
descripcionrol VARCHAR(500) NOT NULL ,
fechacreacionrol DATE NOT NULL ,
estado BIT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
