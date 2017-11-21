/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_empleados]                                      
	--Fecha de creación:  2017/11/10 9:51 AM                                                 
	--Responsable:        mlopez                                                         
	--Funcionalidad:                                                        
/***************************************************************************/
/*                        Cambios Efectuados                               */
	-- Responsable:                                                            
	-- Fecha:                                                                  
	-- descripcion del Cambio:                                                 
/***************************************************************************/

USE[db_comsucre]

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empleados')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_empleados];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_empleados] 
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
	IF @trx='07092' BEGIN  
		EXEC [db_nomina].[sp_empleados_select] 
			@uid_codigo,
			@cod_empleado,
			@nombres,
			@apellidos,
			@nacionalidad,
			@lnacimiento,
			@fechanacimiento,
			@estadocivil,
			@edad,
			@genero,
			@celularcontacto,
			@telefonocontacto,
			@emailcontacto,
			@emailempresa,
			@tidentificacion,
			@identificación,
			@nafiliacioniess,
			@nlibretamilitar,
			@observaciones,
			@cod_marcacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07093' BEGIN  
		EXEC [db_nomina].[sp_empleados_insert] 
			@uid_codigo,
			@cod_empleado,
			@nombres,
			@apellidos,
			@nacionalidad,
			@lnacimiento,
			@fechanacimiento,
			@estadocivil,
			@edad,
			@genero,
			@celularcontacto,
			@telefonocontacto,
			@emailcontacto,
			@emailempresa,
			@tidentificacion,
			@identificación,
			@nafiliacioniess,
			@nlibretamilitar,
			@observaciones,
			@cod_marcacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07094' BEGIN  
		EXEC [db_nomina].[sp_empleados_update] 
			@uid_codigo,
			@cod_empleado,
			@nombres,
			@apellidos,
			@nacionalidad,
			@lnacimiento,
			@fechanacimiento,
			@estadocivil,
			@edad,
			@genero,
			@celularcontacto,
			@telefonocontacto,
			@emailcontacto,
			@emailempresa,
			@tidentificacion,
			@identificación,
			@nafiliacioniess,
			@nlibretamilitar,
			@observaciones,
			@cod_marcacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07095' BEGIN  
		EXEC [db_nomina].[sp_empleados_delete] 
			@uid_codigo,
			@cod_empleado,
			@nombres,
			@apellidos,
			@nacionalidad,
			@lnacimiento,
			@fechanacimiento,
			@estadocivil,
			@edad,
			@genero,
			@celularcontacto,
			@telefonocontacto,
			@emailcontacto,
			@emailempresa,
			@tidentificacion,
			@identificación,
			@nafiliacioniess,
			@nlibretamilitar,
			@observaciones,
			@cod_marcacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END