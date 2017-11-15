

/***************************************************************************/
/*Nombre del Objeto:      [db_manufactura].[sp_datalleordenmprima_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datalleordenmprima_Select')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_Select];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_Select] 
   ( 
	@id_datelleorden INT,
	@id_cabecera INT,
	@cod_materiaprima VARCHAR(10),
	@cantidad FLOAT,
	@costounit FLOAT,
	@porcentaje FLOAT,
	@costototal FLOAT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select id_datelleorden,id_cabecera,cod_materiaprima,cantidad,costounit,porcentaje,costototal,estadoexistencia
	From [db_manufactura].[tb_datalleordenmprima]
	Where (id_datelleorden=@id_datelleorden or @id_datelleorden IS NULL) and
(id_cabecera=@id_cabecera or @id_cabecera IS NULL) and
(cod_materiaprima=@cod_materiaprima or @cod_materiaprima IS NULL) and
(cantidad=@cantidad or @cantidad IS NULL) and
(costounit=@costounit or @costounit IS NULL) and
(porcentaje=@porcentaje or @porcentaje IS NULL) and
(costototal=@costototal or @costototal IS NULL) and
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