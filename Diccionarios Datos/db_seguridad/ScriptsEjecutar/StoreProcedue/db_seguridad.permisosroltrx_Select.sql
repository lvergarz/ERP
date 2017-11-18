

/***************************************************************************/
/*Nombre del Objeto:      [db_seguridad].[sp_permisosroltrx_Select]      */
/*Fecha de creación:                                                       */
/*Responsable:                                                             */ 
/*Funcionalidad:                                                           */
/***************************************************************************/
/*                        Cambios Efectuados                               */
/* Responsable:                                                            */
/* Fecha:                                                                  */
/* descripcion del Cambio:                                                 */
/***************************************************************************/


USE[db_comsucre]


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_permisosroltrx_Select')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_permisosroltrx_Select];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_Select] 
   ( 
	@uid_permiso VARCHAR(36),
	@uid_roltrx VARCHAR(36),
	@uid_login VARCHAR(36),
	@fechacreacionpermisosroltrx DATE,
	@fechamodificacionpermisosroltrx DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_permiso,uid_roltrx,uid_login,fechacreacionpermisosroltrx,fechamodificacionpermisosroltrx,estadoexistencia
	From [db_seguridad].[tb_permisosroltrx]
	Where (uid_permiso=@uid_permiso or @uid_permiso IS NULL) and
(uid_roltrx=@uid_roltrx or @uid_roltrx IS NULL) and
(uid_login=@uid_login or @uid_login IS NULL) and
(fechacreacionpermisosroltrx=@fechacreacionpermisosroltrx or @fechacreacionpermisosroltrx IS NULL) and
(fechamodificacionpermisosroltrx=@fechamodificacionpermisosroltrx or @fechamodificacionpermisosroltrx IS NULL) and
(estadoexistencia=@estadoexistencia or @estadoexistencia IS NULL)	

	COMMIT  TRANSACTION transaccionSql;
    END TRY
    BEGIN CATCH 
         /* SELECT
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE() AS ErrorState,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage*/

            ROLLBACK TRANSACTION transaccionSql
			
    END CATCH


END