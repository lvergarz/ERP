

/***************************************************************************/
/*Nombre del Objeto:      [db_manufactura].[sp_gastosg_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_gastosg_Select')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_gastosg_Select];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg_Select] 
   ( 
	@uid_gastosg VARCHAR(36),
	@descripciongastosg VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_gastosg,descripciongastosg,estado,estadoexistencia
	From [db_manufactura].[tb_gastosg]
	Where (uid_gastosg=@uid_gastosg or @uid_gastosg IS NULL) and
(descripciongastosg=@descripciongastosg or @descripciongastosg IS NULL) and
(estado=@estado or @estado IS NULL) and
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