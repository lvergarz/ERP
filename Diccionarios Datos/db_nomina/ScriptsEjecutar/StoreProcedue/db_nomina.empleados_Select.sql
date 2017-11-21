

/***************************************************************************/
/*Nombre del Objeto:      [db_nomina].[sp_empleados_Select]      */
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


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empleados_Select')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_empleados_Select];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_empleados_Select] 
   ( 
	@uid_codigo VARCHAR(36),
	@cod_empleado VARCHAR(13),
	@nombres VARCHAR(100),
	@apellidos VARCHAR(100),
	@nacionalidad VARCHAR(50),
	@lnacimiento VARCHAR(50),
	@fechanacimiento DATE,
	@estadocivil VARCHAR(20),
	@edad ,
	@genero VARCHAR(20),
	@celularcontacto VARCHAR(20),
	@telefonocontacto VARCHAR(20),
	@emailcontacto VARCHAR(80),
	@emailempresa VARCHAR(80),
	@tidentificacion VARCHAR(2),
	@identificación VARCHAR(20),
	@nafiliacioniess VARCHAR(20),
	@nlibretamilitar VARCHAR(20),
	@observaciones VARCHAR(MAX),
	@cod_marcacion VARCHAR(36),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

BEGIN TRANSACTION transaccionSql
    BEGIN TRY
       
	Select uid_codigo,cod_empleado,nombres,apellidos,nacionalidad,lnacimiento,fechanacimiento,estadocivil,edad,genero,celularcontacto,telefonocontacto,emailcontacto,emailempresa,tidentificacion,identificación,nafiliacioniess,nlibretamilitar,observaciones,cod_marcacion,estadoexistencia
	From [db_nomina].[tb_empleados]
	Where (uid_codigo=@uid_codigo or @uid_codigo IS NULL) and
(cod_empleado=@cod_empleado or @cod_empleado IS NULL) and
(nombres=@nombres or @nombres IS NULL) and
(apellidos=@apellidos or @apellidos IS NULL) and
(nacionalidad=@nacionalidad or @nacionalidad IS NULL) and
(lnacimiento=@lnacimiento or @lnacimiento IS NULL) and
(fechanacimiento=@fechanacimiento or @fechanacimiento IS NULL) and
(estadocivil=@estadocivil or @estadocivil IS NULL) and
(edad=@edad or @edad IS NULL) and
(genero=@genero or @genero IS NULL) and
(celularcontacto=@celularcontacto or @celularcontacto IS NULL) and
(telefonocontacto=@telefonocontacto or @telefonocontacto IS NULL) and
(emailcontacto=@emailcontacto or @emailcontacto IS NULL) and
(emailempresa=@emailempresa or @emailempresa IS NULL) and
(tidentificacion=@tidentificacion or @tidentificacion IS NULL) and
(identificación=@identificación or @identificación IS NULL) and
(nafiliacioniess=@nafiliacioniess or @nafiliacioniess IS NULL) and
(nlibretamilitar=@nlibretamilitar or @nlibretamilitar IS NULL) and
(observaciones=@observaciones or @observaciones IS NULL) and
(cod_marcacion=@cod_marcacion or @cod_marcacion IS NULL) and
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