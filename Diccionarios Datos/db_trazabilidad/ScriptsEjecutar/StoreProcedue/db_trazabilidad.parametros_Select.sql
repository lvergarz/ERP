

/***************************************************************************/
/*Nombre del Objeto:      [db_trazabilidad].[sp_parametros_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_parametros_Select')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_parametros_Select];
	END
	GO
CREATE PROCEDURE [db_trazabilidad].[sp_parametros_Select] 
   ( 
	@uid_parametro VARCHAR(36),
	@cod_parametro INT,
	@valor VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@fecharegistro DATE,
	@fechamodificacion DATE,
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_parametro,cod_parametro,valor,estadoexistencia,fecharegistro,fechamodificacion
	From [db_trazabilidad].[tb_parametros]
	Where (uid_parametro=@uid_parametro or @uid_parametro IS NULL) and
(cod_parametro=@cod_parametro or @cod_parametro IS NULL) and
(valor=@valor or @valor IS NULL) and
(estadoexistencia=@estadoexistencia or @estadoexistencia IS NULL) and
(fecharegistro=@fecharegistro or @fecharegistro IS NULL) and
(fechamodificacion=@fechamodificacion or @fechamodificacion IS NULL)	

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