/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_parametros]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_parametros')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_parametros];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_parametros] 
   ( 
	@uid_parametro VARCHAR(36),
	@cod_parametro INT,
	@valor VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@fecharegistro DATE,
	@fechamodificacion DATE,
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='02088' BEGIN  
		EXEC [db_trazabilidad].[sp_parametros_select] 
			@uid_parametro,
			@cod_parametro,
			@valor,
			@estadoexistencia,
			@fecharegistro,
			@fechamodificacion,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='02089' BEGIN  
		EXEC [db_trazabilidad].[sp_parametros_insert] 
			@uid_parametro,
			@cod_parametro,
			@valor,
			@estadoexistencia,
			@fecharegistro,
			@fechamodificacion,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='02090' BEGIN  
		EXEC [db_trazabilidad].[sp_parametros_update] 
			@uid_parametro,
			@cod_parametro,
			@valor,
			@estadoexistencia,
			@fecharegistro,
			@fechamodificacion,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='02091' BEGIN  
		EXEC [db_trazabilidad].[sp_parametros_delete] 
			@uid_parametro,
			@cod_parametro,
			@valor,
			@estadoexistencia,
			@fecharegistro,
			@fechamodificacion,
			@trx,
			@resultado OUT;
	END	
END