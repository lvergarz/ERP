
/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[tb_bodega]                                    
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
           AND TABLE_NAME='tb_bodega')
	BEGIN
		DROP TABLE [db_inventario].[tb_bodega];
	END
	GO
	CREATE TABLE  [db_inventario].[tb_bodega](
	uid_bodega VARCHAR(36) NOT NULL ,
cod_bodega VARCHAR(10) NOT NULL ,
descripcionbodega VARCHAR(100) NOT NULL ,
capacidad VARCHAR(5) NOT NULL ,
fechacreacionbodega DATE NOT NULL ,
direccionbodega VARCHAR(200) NOT NULL ,
cod_empresa VARCHAR(36) NOT NULL ,
estadoexistencia VARCHAR(1) NOT NULL 
	);
 
 
