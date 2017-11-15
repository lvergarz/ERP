
/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[tb_materiaprima]                                    
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
           AND TABLE_NAME='tb_materiaprima')
	BEGIN
		DROP TABLE [db_inventario].[tb_materiaprima];
	END
	GO
	CREATE TABLE  [db_inventario].[tb_materiaprima](
	descripcionmateria VARCHAR(100) NOT NULL ,
unidad VARCHAR(5) NOT NULL ,
fechacreacionmateria DATE NOT NULL ,
fechamodificacionmateria DATE NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL ,
uid_materia VARCHAR(36) NOT NULL  PRIMARY KEY(uid_materia),
cod_materia VARCHAR(10) NOT NULL 
	);
 
 
