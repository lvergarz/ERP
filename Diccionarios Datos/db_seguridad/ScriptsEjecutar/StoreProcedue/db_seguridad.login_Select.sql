

/***************************************************************************/
/*Nombre del Objeto:      [db_seguridad].[sp_login_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_login_Select')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_login_Select];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_login_Select] 
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

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_login,usuario,clave,fechacreacionlogin,fechamodificacion,fechaexpiracion,estado,expira,estadoexistencia
	From [db_seguridad].[tb_login]
	Where (id_login=@id_login or @id_login IS NULL) and
(usuario=@usuario or @usuario IS NULL) and
(clave=@clave or @clave IS NULL) and
(fechacreacionlogin=@fechacreacionlogin or @fechacreacionlogin IS NULL) and
(fechamodificacion=@fechamodificacion or @fechamodificacion IS NULL) and
(fechaexpiracion=@fechaexpiracion or @fechaexpiracion IS NULL) and
(estado=@estado or @estado IS NULL) and
(expira=@expira or @expira IS NULL) and
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