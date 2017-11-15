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
	@id_login INT,
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
			@id_login,
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
			@id_login,
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
			@id_login,
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
			@id_login,
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