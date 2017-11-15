
/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[tb_traza]                                    
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
           AND TABLE_NAME='tb_traza')
	BEGIN
		DROP TABLE [db_trazabilidad].[tb_traza];
	END
	GO
	CREATE TABLE  [db_trazabilidad].[tb_traza](
	uid_traza VARCHAR(36) NOT NULL  PRIMARY KEY(uid_traza),
id_trx VARCHAR(5) NOT NULL ,
id_login INT NOT NULL ,
accion VARCHAR(200) NOT NULL ,
log DATE NOT NULL ,
fechalog DATE NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
