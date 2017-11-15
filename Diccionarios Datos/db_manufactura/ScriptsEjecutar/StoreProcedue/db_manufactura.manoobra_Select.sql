

/***************************************************************************/
/*Nombre del Objeto:      [db_manufactura].[sp_manoobra_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_manoobra_Select')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_manoobra_Select];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra_Select] 
   ( 
	@id_manoobra INT,
	@descripcionmanoobra VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_manoobra,descripcionmanoobra,estado,estadoexistencia
	From [db_manufactura].[tb_manoobra]
	Where (id_manoobra=@id_manoobra or @id_manoobra IS NULL) and
(descripcionmanoobra=@descripcionmanoobra or @descripcionmanoobra IS NULL) and
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