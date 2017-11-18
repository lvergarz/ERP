/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcacionesproc_Procesar]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcacionesproc_Procesar')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcacionesproc_Procesar];
	END
	GO
CREATE PROCEDURE [db_marcaciones].[sp_marcacionesproc_Procesar] 
   ( 
	@uid_marcacionesproc VARCHAR(36),
	@cod_marcacion VARCHAR(5)
	)
as
BEGIN
  select 'dfgdf'
END