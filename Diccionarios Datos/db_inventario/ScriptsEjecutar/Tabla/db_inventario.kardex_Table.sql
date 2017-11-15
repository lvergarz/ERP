
/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[tb_kardex]                                    
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
           WHERE TABLE_SCHEMA='db_inventario' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_kardex')
	BEGIN
		DROP TABLE [db_inventario].[tb_kardex];
	END
	GO
	CREATE TABLE  [db_inventario].[tb_kardex](
	id_kardex INT NOT NULL  PRIMARY KEY(id_kardex),
id_materia INT NOT NULL ,
ingreso FLOAT NOT NULL ,
egreso FLOAT NOT NULL ,
fechakardex DATE NOT NULL ,
horakardex TIME NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
