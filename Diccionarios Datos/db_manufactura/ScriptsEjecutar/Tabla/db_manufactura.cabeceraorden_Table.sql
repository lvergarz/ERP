
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[tb_cabeceraorden]                                    
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
           AND TABLE_NAME='tb_cabeceraorden')
	BEGIN
		DROP TABLE [db_manufactura].[tb_cabeceraorden];
	END
	GO
	CREATE TABLE  [db_manufactura].[tb_cabeceraorden](
	uid_cabecera VARCHAR(36) NOT NULL  PRIMARY KEY(uid_cabecera),
fechainiciocabecera DATETIME NOT NULL ,
operador VARCHAR(200) NOT NULL ,
fechafin DATETIME NOT NULL ,
fechaempaque DATE NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
