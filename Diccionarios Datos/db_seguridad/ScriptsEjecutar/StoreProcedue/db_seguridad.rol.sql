/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_rol]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_rol')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_rol];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_rol] 
   ( 
	@uid_rol VARCHAR(36),
	@cod_rol VARCHAR(20),
	@nombrerol VARCHAR(20),
	@descripcionrol VARCHAR(500),
	@fechacreacionrol DATE,
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='01044' BEGIN  
		EXEC [db_seguridad].[sp_rol_select] 
			@uid_rol,
			@cod_rol,
			@nombrerol,
			@descripcionrol,
			@fechacreacionrol,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='01045' BEGIN  
		EXEC [db_seguridad].[sp_rol_insert] 
			@uid_rol,
			@cod_rol,
			@nombrerol,
			@descripcionrol,
			@fechacreacionrol,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='01046' BEGIN  
		EXEC [db_seguridad].[sp_rol_update] 
			@uid_rol,
			@cod_rol,
			@nombrerol,
			@descripcionrol,
			@fechacreacionrol,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='01047' BEGIN  
		EXEC [db_seguridad].[sp_rol_delete] 
			@uid_rol,
			@cod_rol,
			@nombrerol,
			@descripcionrol,
			@fechacreacionrol,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END