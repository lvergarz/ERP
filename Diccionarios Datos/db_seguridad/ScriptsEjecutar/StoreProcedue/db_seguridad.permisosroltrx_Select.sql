

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

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_permiso,id_roltrx,id_login,fechacreacionpermisosroltrx,fechamodificacionpermisosroltrx,estadoexistencia
	From [db_seguridad].[tb_permisosroltrx]
	Where (id_permiso=@id_permiso or @id_permiso IS NULL) and
(id_roltrx=@id_roltrx or @id_roltrx IS NULL) and
(id_login=@id_login or @id_login IS NULL) and
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