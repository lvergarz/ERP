/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_roltrx]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_roltrx')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_roltrx];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx] 
   ( 
	@uid_roltrx VARCHAR(36),
	@cod_rol VARCHAR(20),
	@cod_trx VARCHAR(20),
	@fechacreacionroltrx DATE,
	@fechamodificacion DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='01048' BEGIN  
		EXEC [db_seguridad].[sp_roltrx_select] 
			@uid_roltrx,
			@cod_rol,
			@cod_trx,
			@fechacreacionroltrx,
			@fechamodificacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='01049' BEGIN  
		EXEC [db_seguridad].[sp_roltrx_insert] 
			@uid_roltrx,
			@cod_rol,
			@cod_trx,
			@fechacreacionroltrx,
			@fechamodificacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='01050' BEGIN  
		EXEC [db_seguridad].[sp_roltrx_update] 
			@uid_roltrx,
			@cod_rol,
			@cod_trx,
			@fechacreacionroltrx,
			@fechamodificacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='01051' BEGIN  
		EXEC [db_seguridad].[sp_roltrx_delete] 
			@uid_roltrx,
			@cod_rol,
			@cod_trx,
			@fechacreacionroltrx,
			@fechamodificacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END