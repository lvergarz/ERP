

/***************************************************************************/
/*Nombre del Objeto:      [db_marcaciones].[sp_marcacionesproc_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcacionesproc_Select')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcacionesproc_Select];
	END
	GO
CREATE PROCEDURE [db_marcaciones].[sp_marcacionesproc_Select] 
   ( 
	@uid_marcacionesproc VARCHAR(36),
	@cod_marcacion VARCHAR(5),
	@cedula VARCHAR(13),
	@fechamarc DATE,
	@hentrada TIME,
	@hsalida TIME,
	@atraso TIME,
	@extra TIME,
	@justificado BIT,
	@motivojust VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_marcacionesproc,cod_marcacion,cedula,fechamarc,hentrada,hsalida,atraso,extra,justificado,motivojust,estadoexistencia
	From [db_marcaciones].[tb_marcacionesproc]
	Where (uid_marcacionesproc=@uid_marcacionesproc or @uid_marcacionesproc IS NULL) and
(cod_marcacion=@cod_marcacion or @cod_marcacion IS NULL) and
(cedula=@cedula or @cedula IS NULL) and
(fechamarc=@fechamarc or @fechamarc IS NULL) and
(hentrada=@hentrada or @hentrada IS NULL) and
(hsalida=@hsalida or @hsalida IS NULL) and
(atraso=@atraso or @atraso IS NULL) and
(extra=@extra or @extra IS NULL) and
(justificado=@justificado or @justificado IS NULL) and
(motivojust=@motivojust or @motivojust IS NULL) and
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