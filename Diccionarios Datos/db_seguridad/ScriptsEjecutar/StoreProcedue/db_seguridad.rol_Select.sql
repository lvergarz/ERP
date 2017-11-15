

/***************************************************************************/
/*Nombre del Objeto:      [db_seguridad].[sp_rol_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_rol_Select')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_rol_Select];
	END
	GO
CREATE PROCEDURE [db_seguridad].[sp_rol_Select] 
   ( 
	@id_rol VARCHAR(8),
	@cod_rol VARCHAR(20),
	@nombrerol VARCHAR(20),
	@descripcionrol VARCHAR(500),
	@fechacreacionrol DATE,
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_rol,cod_rol,nombrerol,descripcionrol,fechacreacionrol,estado,estadoexistencia
	From [db_seguridad].[tb_rol]
	Where (id_rol=@id_rol or @id_rol IS NULL) and
(cod_rol=@cod_rol or @cod_rol IS NULL) and
(nombrerol=@nombrerol or @nombrerol IS NULL) and
(descripcionrol=@descripcionrol or @descripcionrol IS NULL) and
(fechacreacionrol=@fechacreacionrol or @fechacreacionrol IS NULL) and
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