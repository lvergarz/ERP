/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_login]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_login')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_login];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_login] 
   ( 
	@uid_login VARCHAR(36),
	@usuario VARCHAR(8),
	@clave VARCHAR(20),
	@fechacreacionlogin DATE,
	@fechamodificacion DATE,
	@fechaexpiracion DATE,
	@estado BIT,
	@expira BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='01036' BEGIN  
		EXEC [db_seguridad].[sp_login_select] 
			@uid_login,
			@usuario,
			@clave,
			@fechacreacionlogin,
			@fechamodificacion,
			@fechaexpiracion,
			@estado,
			@expira,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='01037' BEGIN  
		EXEC [db_seguridad].[sp_login_insert] 
			@uid_login,
			@usuario,
			@clave,
			@fechacreacionlogin,
			@fechamodificacion,
			@fechaexpiracion,
			@estado,
			@expira,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='01038' BEGIN  
		EXEC [db_seguridad].[sp_login_update] 
			@uid_login,
			@usuario,
			@clave,
			@fechacreacionlogin,
			@fechamodificacion,
			@fechaexpiracion,
			@estado,
			@expira,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='01039' BEGIN  
		EXEC [db_seguridad].[sp_login_delete] 
			@uid_login,
			@usuario,
			@clave,
			@fechacreacionlogin,
			@fechamodificacion,
			@fechaexpiracion,
			@estado,
			@expira,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END