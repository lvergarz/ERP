/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_areas]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_areas')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_areas];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_areas] 
   ( 
	@uid_areas VARCHAR(36),
	@cod_areas VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='07072' BEGIN  
		EXEC [db_nomina].[sp_areas_select] 
			@uid_areas,
			@cod_areas,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07073' BEGIN  
		EXEC [db_nomina].[sp_areas_insert] 
			@uid_areas,
			@cod_areas,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07074' BEGIN  
		EXEC [db_nomina].[sp_areas_update] 
			@uid_areas,
			@cod_areas,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07075' BEGIN  
		EXEC [db_nomina].[sp_areas_delete] 
			@uid_areas,
			@cod_areas,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END