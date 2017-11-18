/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_errores]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_errores')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_errores];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_errores] 
   ( 
	@uid_error VARCHAR(36),
	@cod_error VARCHAR(20),
	@mensajeusuario VARCHAR(MAX),
	@mensajenativo VARCHAR(MAX),
	@tipoerror VARCHAR(15),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='02032' BEGIN  
		EXEC [db_trazabilidad].[sp_errores_select] 
			@uid_error,
			@cod_error,
			@mensajeusuario,
			@mensajenativo,
			@tipoerror,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='02033' BEGIN  
		EXEC [db_trazabilidad].[sp_errores_insert] 
			@uid_error,
			@cod_error,
			@mensajeusuario,
			@mensajenativo,
			@tipoerror,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='02034' BEGIN  
		EXEC [db_trazabilidad].[sp_errores_update] 
			@uid_error,
			@cod_error,
			@mensajeusuario,
			@mensajenativo,
			@tipoerror,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='02035' BEGIN  
		EXEC [db_trazabilidad].[sp_errores_delete] 
			@uid_error,
			@cod_error,
			@mensajeusuario,
			@mensajenativo,
			@tipoerror,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END