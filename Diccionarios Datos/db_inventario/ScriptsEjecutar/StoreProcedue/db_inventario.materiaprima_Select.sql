

/***************************************************************************/
/*Nombre del Objeto:      [db_inventario].[sp_materiaprima_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_materiaprima_Select')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_materiaprima_Select];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima_Select] 
   ( 
	@descripcionmateria VARCHAR(100),
	@unidad VARCHAR(5),
	@fechacreacionmateria DATE,
	@fechamodificacionmateria DATE,
	@estadoexistencia VARCHAR(1),
	@uid_materia VARCHAR(36),
	@cod_materia VARCHAR(10),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select descripcionmateria,unidad,fechacreacionmateria,fechamodificacionmateria,estadoexistencia,uid_materia,cod_materia
	From [db_inventario].[tb_materiaprima]
	Where (descripcionmateria=@descripcionmateria or @descripcionmateria IS NULL) and
(unidad=@unidad or @unidad IS NULL) and
(fechacreacionmateria=@fechacreacionmateria or @fechacreacionmateria IS NULL) and
(fechamodificacionmateria=@fechamodificacionmateria or @fechamodificacionmateria IS NULL) and
(estadoexistencia=@estadoexistencia or @estadoexistencia IS NULL) and
(uid_materia=@uid_materia or @uid_materia IS NULL) and
(cod_materia=@cod_materia or @cod_materia IS NULL)	

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