
/***************************************************************************/
	--Nombre del Objeto:  [db_inventario]                                        
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
GO

if EXISTS(SELECT  schema_name
FROM    information_schema.schemata
WHERE   schema_name ='db_inventario')
BEGIN
DROP SCHEMA [db_inventario]
END
GO
 CREATE SCHEMA [db_inventario]
GO