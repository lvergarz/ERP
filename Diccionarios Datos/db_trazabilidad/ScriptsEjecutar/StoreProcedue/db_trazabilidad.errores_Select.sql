

/***************************************************************************/
/*Nombre del Objeto:      [db_trazabilidad].[sp_errores_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_errores_Select')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_errores_Select];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_errores_Select] 
   ( 
	@uid_error VARCHAR(36),
	@cod_error VARCHAR(20),
	@mensajeusuario VARCHAR(MAX),
	@mensajenativo VARCHAR(MAX),
	@tipoerror VARCHAR(15),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_error,cod_error,mensajeusuario,mensajenativo,tipoerror,estadoexistencia
	From [db_trazabilidad].[tb_errores]
	Where (uid_error=@uid_error or @uid_error IS NULL) and
(cod_error=@cod_error or @cod_error IS NULL) and
(mensajeusuario=@mensajeusuario or @mensajeusuario IS NULL) and
(mensajenativo=@mensajenativo or @mensajenativo IS NULL) and
(tipoerror=@tipoerror or @tipoerror IS NULL) and
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