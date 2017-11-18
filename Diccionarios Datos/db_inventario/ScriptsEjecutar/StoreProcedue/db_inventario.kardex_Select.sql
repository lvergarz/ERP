

/***************************************************************************/
/*Nombre del Objeto:      [db_inventario].[sp_kardex_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_kardex_Select')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_kardex_Select];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_kardex_Select] 
   ( 
	@uid_kardex VARCHAR(36),
	@uid_materia VARCHAR(36),
	@ingreso FLOAT,
	@egreso FLOAT,
	@fechakardex DATE,
	@horakardex TIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_kardex,uid_materia,ingreso,egreso,fechakardex,horakardex,estadoexistencia
	From [db_inventario].[tb_kardex]
	Where (uid_kardex=@uid_kardex or @uid_kardex IS NULL) and
(uid_materia=@uid_materia or @uid_materia IS NULL) and
(ingreso=@ingreso or @ingreso IS NULL) and
(egreso=@egreso or @egreso IS NULL) and
(fechakardex=@fechakardex or @fechakardex IS NULL) and
(horakardex=@horakardex or @horakardex IS NULL) and
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