

/***************************************************************************/
/*Nombre del Objeto:      [db_inventario].[sp_bodega_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_bodega_Select')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_bodega_Select];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_bodega_Select] 
   ( 
	@uid_bodega VARCHAR(36),
	@cod_bodega VARCHAR(10),
	@descripcionbodega VARCHAR(100),
	@capacidad VARCHAR(5),
	@fechacreacionbodega DATE,
	@direccionbodega VARCHAR(200),
	@cod_empresa VARCHAR(36),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_bodega,cod_bodega,descripcionbodega,capacidad,fechacreacionbodega,direccionbodega,cod_empresa,estadoexistencia
	From [db_inventario].[tb_bodega]
	Where (uid_bodega=@uid_bodega or @uid_bodega IS NULL) and
(cod_bodega=@cod_bodega or @cod_bodega IS NULL) and
(descripcionbodega=@descripcionbodega or @descripcionbodega IS NULL) and
(capacidad=@capacidad or @capacidad IS NULL) and
(fechacreacionbodega=@fechacreacionbodega or @fechacreacionbodega IS NULL) and
(direccionbodega=@direccionbodega or @direccionbodega IS NULL) and
(cod_empresa=@cod_empresa or @cod_empresa IS NULL) and
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