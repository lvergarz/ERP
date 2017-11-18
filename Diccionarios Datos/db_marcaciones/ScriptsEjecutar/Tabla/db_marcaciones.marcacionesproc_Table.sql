
/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[tb_marcacionesproc]                                    
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
           AND TABLE_NAME='tb_marcacionesproc')
	BEGIN
		DROP TABLE [db_marcaciones].[tb_marcacionesproc];
	END
	GO
	CREATE TABLE  [db_marcaciones].[tb_marcacionesproc](
	uid_marcacionesproc VARCHAR(36) NOT NULL  PRIMARY KEY(uid_marcacionesproc),
cod_marcacion VARCHAR(5) NULL ,
cedula VARCHAR(13) NULL ,
fechamarc DATE NULL ,
hentrada TIME NULL ,
hsalida TIME NULL ,
atraso TIME NULL ,
extra TIME NULL ,
justificado BIT NULL ,
motivojust VARCHAR(2000) NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
