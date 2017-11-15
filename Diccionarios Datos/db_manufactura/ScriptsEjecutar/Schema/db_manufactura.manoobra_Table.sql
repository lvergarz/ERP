
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura]                                        
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
WHERE   schema_name ='db_manufactura')
BEGIN
DROP SCHEMA [db_manufactura]
END
GO
 CREATE SCHEMA [db_manufactura]
GO