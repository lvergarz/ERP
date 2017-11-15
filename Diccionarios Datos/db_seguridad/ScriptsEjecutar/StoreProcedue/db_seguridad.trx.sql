/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_trx]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_trx')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_trx];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_trx] 
   ( 
	@uid_trx VARCHAR(36),
	@cod_trx VARCHAR(20),
	@nombre_trx VARCHAR(20),
	@descripciontrx VARCHAR(500),
	@fechadecreaciontrx DATE,
	@estadotrx BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='01052' BEGIN  
		EXEC [db_seguridad].[sp_trx_select] 
			@uid_trx,
			@cod_trx,
			@nombre_trx,
			@descripciontrx,
			@fechadecreaciontrx,
			@estadotrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='01053' BEGIN  
		EXEC [db_seguridad].[sp_trx_insert] 
			@uid_trx,
			@cod_trx,
			@nombre_trx,
			@descripciontrx,
			@fechadecreaciontrx,
			@estadotrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='01054' BEGIN  
		EXEC [db_seguridad].[sp_trx_update] 
			@uid_trx,
			@cod_trx,
			@nombre_trx,
			@descripciontrx,
			@fechadecreaciontrx,
			@estadotrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='01055' BEGIN  
		EXEC [db_seguridad].[sp_trx_delete] 
			@uid_trx,
			@cod_trx,
			@nombre_trx,
			@descripciontrx,
			@fechadecreaciontrx,
			@estadotrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END