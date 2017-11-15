/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_traza]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_traza')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_traza];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_traza] 
   ( 
	@uid_traza VARCHAR(36),
	@uid_trx VARCHAR(36),
	@uid_login VARCHAR(36),
	@accion VARCHAR(200),
	@log DATE,
	@fechalog DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='02028' BEGIN  
		EXEC [db_trazabilidad].[sp_traza_select] 
			@uid_traza,
			@uid_trx,
			@uid_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='02029' BEGIN  
		EXEC [db_trazabilidad].[sp_traza_insert] 
			@uid_traza,
			@uid_trx,
			@uid_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='02030' BEGIN  
		EXEC [db_trazabilidad].[sp_traza_update] 
			@uid_traza,
			@uid_trx,
			@uid_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='02031' BEGIN  
		EXEC [db_trazabilidad].[sp_traza_delete] 
			@uid_traza,
			@uid_trx,
			@uid_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END