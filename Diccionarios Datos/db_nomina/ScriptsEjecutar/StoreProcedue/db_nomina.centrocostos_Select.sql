

/***************************************************************************/
/*Nombre del Objeto:      [db_nomina].[sp_centrocostos_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_centrocostos_Select')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_centrocostos_Select];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_centrocostos_Select] 
   ( 
	@uid_centro VARCHAR(36),
	@codigo_centro VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_centro,codigo_centro,descripcion,fechacreacion,estadoexistencia
	From [db_nomina].[tb_centrocostos]
	Where (uid_centro=@uid_centro or @uid_centro IS NULL) and
(codigo_centro=@codigo_centro or @codigo_centro IS NULL) and
(descripcion=@descripcion or @descripcion IS NULL) and
(fechacreacion=@fechacreacion or @fechacreacion IS NULL) and
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