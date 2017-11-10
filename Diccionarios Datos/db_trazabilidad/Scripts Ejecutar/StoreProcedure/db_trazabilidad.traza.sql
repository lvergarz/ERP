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
	@id_traza INT,
	@id_trx INT,
	@id_login INT,
	@accion VARCHAR(20),
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
			@id_traza,
			@id_trx,
			@id_login,
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
			@id_traza,
			@id_trx,
			@id_login,
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
			@id_traza,
			@id_trx,
			@id_login,
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
			@id_traza,
			@id_trx,
			@id_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END