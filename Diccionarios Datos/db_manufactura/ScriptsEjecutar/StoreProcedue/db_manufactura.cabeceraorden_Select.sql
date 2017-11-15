

/***************************************************************************/
/*Nombre del Objeto:      [db_manufactura].[sp_cabeceraorden_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_cabeceraorden_Select')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_cabeceraorden_Select];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_Select] 
   ( 
	@uid_cabecera VARCHAR(36),
	@fechainiciocabecera DATETIME,
	@operador VARCHAR(200),
	@fechafin DATETIME,
	@fechaempaque DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_cabecera,fechainiciocabecera,operador,fechafin,fechaempaque,estadoexistencia
	From [db_manufactura].[tb_cabeceraorden]
	Where (uid_cabecera=@uid_cabecera or @uid_cabecera IS NULL) and
(fechainiciocabecera=@fechainiciocabecera or @fechainiciocabecera IS NULL) and
(operador=@operador or @operador IS NULL) and
(fechafin=@fechafin or @fechafin IS NULL) and
(fechaempaque=@fechaempaque or @fechaempaque IS NULL) and
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