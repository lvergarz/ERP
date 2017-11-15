

/***************************************************************************/
/*Nombre del Objeto:      [db_marcaciones].[sp_marcaciones_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcaciones_Select')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcaciones_Select];
	END
	GO
CREATE PROCEDURE [db_marcaciones].[sp_marcaciones_Select] 
   ( 
	@estadoexistencia VARCHAR(1),
	@uid_marcaciones VARCHAR(36),
	@cod_marcacion VARCHAR(5),
	@nombreemp VARCHAR(100),
	@fechamarc VARCHAR(15),
	@hentrada TIME,
	@hsalida TIME,
	@horariot VARCHAR(30),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select estadoexistencia,uid_marcaciones,cod_marcacion,nombreemp,fechamarc,hentrada,hsalida,horariot
	From [db_marcaciones].[tb_marcaciones]
	Where (estadoexistencia=@estadoexistencia or @estadoexistencia IS NULL) and
(uid_marcaciones=@uid_marcaciones or @uid_marcaciones IS NULL) and
(cod_marcacion=@cod_marcacion or @cod_marcacion IS NULL) and
(nombreemp=@nombreemp or @nombreemp IS NULL) and
(fechamarc=@fechamarc or @fechamarc IS NULL) and
(hentrada=@hentrada or @hentrada IS NULL) and
(hsalida=@hsalida or @hsalida IS NULL) and
(horariot=@horariot or @horariot IS NULL)	

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