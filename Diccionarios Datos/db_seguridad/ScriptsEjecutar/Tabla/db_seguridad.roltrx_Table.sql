
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[tb_roltrx]                                    
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
           AND TABLE_NAME='tb_roltrx')
	BEGIN
		DROP TABLE [db_seguridad].[tb_roltrx];
	END
	GO
	CREATE TABLE  [db_seguridad].[tb_roltrx](
	id_roltrx VARCHAR(8) NOT NULL  PRIMARY KEY(id_roltrx),
cod_rol VARCHAR(20) NOT NULL ,
cod_trx VARCHAR(20) NOT NULL ,
fechacreacionroltrx DATE NOT NULL ,
fechamodificacion DATE NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
