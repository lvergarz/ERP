

/***************************************************************************/
/*Nombre del Objeto:      [db_nomina].[sp_grupos_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_grupos_Select')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_grupos_Select];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_grupos_Select] 
   ( 
	@uid_grupos VARCHAR(36),
	@cod_grupos VARCHAR(5),
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
       
	Select uid_grupos,cod_grupos,descripcion,fechacreacion,estadoexistencia
	From [db_nomina].[tb_grupos]
	Where (uid_grupos=@uid_grupos or @uid_grupos IS NULL) and
(cod_grupos=@cod_grupos or @cod_grupos IS NULL) and
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