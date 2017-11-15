
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[tb_permisosroltrx]                                    
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
           AND TABLE_NAME='tb_permisosroltrx')
	BEGIN
		DROP TABLE [db_seguridad].[tb_permisosroltrx];
	END
	GO
	CREATE TABLE  [db_seguridad].[tb_permisosroltrx](
	uid_permiso VARCHAR(36) NOT NULL  PRIMARY KEY(uid_permiso),
uid_roltrx VARCHAR(36) NOT NULL ,
uid_login VARCHAR(36) NOT NULL ,
fechacreacionpermisosroltrx DATE NOT NULL ,
fechamodificacionpermisosroltrx DATE NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
