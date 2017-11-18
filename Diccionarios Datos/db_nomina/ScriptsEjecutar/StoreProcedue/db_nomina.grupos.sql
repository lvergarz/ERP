/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_grupos]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_grupos')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_grupos];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_grupos] 
   ( 
	@uid_grupos VARCHAR(36),
	@cod_grupos VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='07080' BEGIN  
		EXEC [db_nomina].[sp_grupos_select] 
			@uid_grupos,
			@cod_grupos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07081' BEGIN  
		EXEC [db_nomina].[sp_grupos_insert] 
			@uid_grupos,
			@cod_grupos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07082' BEGIN  
		EXEC [db_nomina].[sp_grupos_update] 
			@uid_grupos,
			@cod_grupos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07083' BEGIN  
		EXEC [db_nomina].[sp_grupos_delete] 
			@uid_grupos,
			@cod_grupos,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END