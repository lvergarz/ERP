
/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[tb_errores]                                    
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
           AND TABLE_NAME='tb_errores')
	BEGIN
		DROP TABLE [db_trazabilidad].[tb_errores];
	END
	GO
	CREATE TABLE  [db_trazabilidad].[tb_errores](
	id_error INT NOT NULL  PRIMARY KEY(id_error),
cod_error VARCHAR(20) NOT NULL ,
mensajeusuario VARCHAR(MAX) NOT NULL ,
mensajenativo VARCHAR(MAX) NOT NULL ,
tipoerror VARCHAR(15) NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
