/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_centrocostos]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_centrocostos')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_centrocostos];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_centrocostos] 
   ( 
	@uid_centro VARCHAR(36),
	@codigo_centro VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='07084' BEGIN  
		EXEC [db_nomina].[sp_centrocostos_select] 
			@uid_centro,
			@codigo_centro,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07085' BEGIN  
		EXEC [db_nomina].[sp_centrocostos_insert] 
			@uid_centro,
			@codigo_centro,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07086' BEGIN  
		EXEC [db_nomina].[sp_centrocostos_update] 
			@uid_centro,
			@codigo_centro,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07087' BEGIN  
		EXEC [db_nomina].[sp_centrocostos_delete] 
			@uid_centro,
			@codigo_centro,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END