/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_permisosroltrx]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_permisosroltrx')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_permisosroltrx];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx] 
   ( 
	@id_permiso VARCHAR(8),
	@id_roltrx VARCHAR(8),
	@id_login VARCHAR(8),
	@fechacreacionpermisosroltrx DATE,
	@fechamodificacionpermisosroltrx DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='01040' BEGIN  
		EXEC [db_seguridad].[sp_permisosroltrx_select] 
			@id_permiso,
			@id_roltrx,
			@id_login,
			@fechacreacionpermisosroltrx,
			@fechamodificacionpermisosroltrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='01041' BEGIN  
		EXEC [db_seguridad].[sp_permisosroltrx_insert] 
			@id_permiso,
			@id_roltrx,
			@id_login,
			@fechacreacionpermisosroltrx,
			@fechamodificacionpermisosroltrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='01042' BEGIN  
		EXEC [db_seguridad].[sp_permisosroltrx_update] 
			@id_permiso,
			@id_roltrx,
			@id_login,
			@fechacreacionpermisosroltrx,
			@fechamodificacionpermisosroltrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='01043' BEGIN  
		EXEC [db_seguridad].[sp_permisosroltrx_delete] 
			@id_permiso,
			@id_roltrx,
			@id_login,
			@fechacreacionpermisosroltrx,
			@fechamodificacionpermisosroltrx,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END