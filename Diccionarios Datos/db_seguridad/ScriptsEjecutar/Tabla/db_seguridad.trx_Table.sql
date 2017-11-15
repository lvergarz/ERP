
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[tb_trx]                                    
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
           AND TABLE_NAME='tb_trx')
	BEGIN
		DROP TABLE [db_seguridad].[tb_trx];
	END
	GO
	CREATE TABLE  [db_seguridad].[tb_trx](
	id_trx VARCHAR(8) NOT NULL  PRIMARY KEY(id_trx),
cod_trx VARCHAR(20) NOT NULL ,
nombre_trx VARCHAR(20) NOT NULL ,
descripciontrx VARCHAR(500) NOT NULL ,
fechadecreaciontrx DATE NOT NULL ,
estadotrx BIT NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
