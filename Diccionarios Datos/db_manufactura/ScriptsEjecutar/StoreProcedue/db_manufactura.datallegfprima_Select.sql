

/***************************************************************************/
/*Nombre del Objeto:      [db_manufactura].[sp_datallegfprima_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datallegfprima_Select')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datallegfprima_Select];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_Select] 
   ( 
	@id_datelleordengf INT,
	@id_cabecera INT,
	@id_gatosf INT,
	@horas INT,
	@costo FLOAT,
	@porcentaje FLOAT,
	@total FLOAT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_datelleordengf,id_cabecera,id_gatosf,horas,costo,porcentaje,total,estadoexistencia
	From [db_manufactura].[tb_datallegfprima]
	Where (id_datelleordengf=@id_datelleordengf or @id_datelleordengf IS NULL) and
(id_cabecera=@id_cabecera or @id_cabecera IS NULL) and
(id_gatosf=@id_gatosf or @id_gatosf IS NULL) and
(horas=@horas or @horas IS NULL) and
(costo=@costo or @costo IS NULL) and
(porcentaje=@porcentaje or @porcentaje IS NULL) and
(total=@total or @total IS NULL) and
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