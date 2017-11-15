

/***************************************************************************/
/*Nombre del Objeto:      [db_seguridad].[sp_roltrx_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_roltrx_Select')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_roltrx_Select];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx_Select] 
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

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_roltrx,cod_rol,cod_trx,fechacreacionroltrx,fechamodificacion,estadoexistencia
	From [db_seguridad].[tb_roltrx]
	Where (uid_roltrx=@uid_roltrx or @uid_roltrx IS NULL) and
(cod_rol=@cod_rol or @cod_rol IS NULL) and
(cod_trx=@cod_trx or @cod_trx IS NULL) and
(fechacreacionroltrx=@fechacreacionroltrx or @fechacreacionroltrx IS NULL) and
(fechamodificacion=@fechamodificacion or @fechamodificacion IS NULL) and
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