
/***************************************************************************/
	--Nombre del Objeto:  [db_empresa].[tb_empresa]                                    
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
           WHERE TABLE_SCHEMA='db_empresa' AND TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='tb_empresa')
	BEGIN
		DROP TABLE [db_empresa].[tb_empresa];
	END
	GO
	CREATE TABLE  [db_empresa].[tb_empresa](
	uid_empresa VARCHAR(36) NOT NULL  PRIMARY KEY(uid_empresa),
ruc INT NOT NULL ,
nombre FLOAT NOT NULL ,
descripcion VARCHAR(500) NOT NULL ,
direccion VARCHAR(200) NOT NULL ,
telefono VARCHAR(100) NOT NULL ,
representantelegal VARCHAR(200) NOT NULL ,
estado  NOT NULL ,
imagen VARCHAR(50) NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
