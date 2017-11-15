

/***************************************************************************/
/*Nombre del Objeto:      [db_trazabilidad].[sp_traza_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_traza_Select')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_traza_Select];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_traza_Select] 
   ( 
	@uid_traza VARCHAR(36),
	@uid_trx VARCHAR(36),
	@uid_login VARCHAR(36),
	@accion VARCHAR(200),
	@log DATE,
	@fechalog DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_traza,uid_trx,uid_login,accion,log,fechalog,estadoexistencia
	From [db_trazabilidad].[tb_traza]
	Where (uid_traza=@uid_traza or @uid_traza IS NULL) and
(uid_trx=@uid_trx or @uid_trx IS NULL) and
(uid_login=@uid_login or @uid_login IS NULL) and
(accion=@accion or @accion IS NULL) and
(log=@log or @log IS NULL) and
(fechalog=@fechalog or @fechalog IS NULL) and
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