

/***************************************************************************/
/*Nombre del Objeto:      [db_seguridad].[sp_trx_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_trx_Select')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_trx_Select];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_trx_Select] 
   ( 
	@id_trx VARCHAR(8),
	@cod_trx VARCHAR(20),
	@nombre_trx VARCHAR(20),
	@descripciontrx VARCHAR(500),
	@fechadecreaciontrx DATE,
	@estadotrx BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_trx,cod_trx,nombre_trx,descripciontrx,fechadecreaciontrx,estadotrx,estadoexistencia
	From [db_seguridad].[tb_trx]
	Where (id_trx=@id_trx or @id_trx IS NULL) and
(cod_trx=@cod_trx or @cod_trx IS NULL) and
(nombre_trx=@nombre_trx or @nombre_trx IS NULL) and
(descripciontrx=@descripciontrx or @descripciontrx IS NULL) and
(fechadecreaciontrx=@fechadecreaciontrx or @fechadecreaciontrx IS NULL) and
(estadotrx=@estadotrx or @estadotrx IS NULL) and
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