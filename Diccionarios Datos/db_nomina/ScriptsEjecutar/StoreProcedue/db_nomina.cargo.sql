/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_cargo]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_cargo')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_cargo];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_cargo] 
   ( 
	@uid_cargos VARCHAR(36),
	@cod_cargos VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='07068' BEGIN  
		EXEC [db_nomina].[sp_cargo_select] 
			@uid_cargos,
			@cod_cargos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07069' BEGIN  
		EXEC [db_nomina].[sp_cargo_insert] 
			@uid_cargos,
			@cod_cargos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07070' BEGIN  
		EXEC [db_nomina].[sp_cargo_update] 
			@uid_cargos,
			@cod_cargos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07071' BEGIN  
		EXEC [db_nomina].[sp_cargo_delete] 
			@uid_cargos,
			@cod_cargos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END