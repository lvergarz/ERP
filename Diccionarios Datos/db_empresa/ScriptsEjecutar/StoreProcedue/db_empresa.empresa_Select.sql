

/***************************************************************************/
/*Nombre del Objeto:      [db_empresa].[sp_empresa_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empresa_Select')
	BEGIN
		DROP PROCEDURE [db_empresa].[sp_empresa_Select];
	END
	GO
CREATE PROCEDURE [db_empresa].[sp_empresa_Select] 
   ( 
	@uid_empresa VARCHAR(36),
	@ruc INT,
	@nombre FLOAT,
	@descripcion VARCHAR(500),
	@direccion VARCHAR(200),
	@telefono VARCHAR(100),
	@representantelegal VARCHAR(200),
	@estado ,
	@imagen VARCHAR(50),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_empresa,ruc,nombre,descripcion,direccion,telefono,representantelegal,estado,imagen,estadoexistencia
	From [db_empresa].[tb_empresa]
	Where (uid_empresa=@uid_empresa or @uid_empresa IS NULL) and
(ruc=@ruc or @ruc IS NULL) and
(nombre=@nombre or @nombre IS NULL) and
(descripcion=@descripcion or @descripcion IS NULL) and
(direccion=@direccion or @direccion IS NULL) and
(telefono=@telefono or @telefono IS NULL) and
(representantelegal=@representantelegal or @representantelegal IS NULL) and
(estado=@estado or @estado IS NULL) and
(imagen=@imagen or @imagen IS NULL) and
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