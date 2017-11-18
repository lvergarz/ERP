/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_departamento]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_departamento')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_departamento];
	END
	GO
CREATE PROCEDURE [db_nomina].[sp_departamento] 
   ( 
	@uid_departamento VARCHAR(36),
	@cod_departamento VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='07076' BEGIN  
		EXEC [db_nomina].[sp_departamento_select] 
			@uid_departamento,
			@cod_departamento,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='07077' BEGIN  
		EXEC [db_nomina].[sp_departamento_insert] 
			@uid_departamento,
			@cod_departamento,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='07078' BEGIN  
		EXEC [db_nomina].[sp_departamento_update] 
			@uid_departamento,
			@cod_departamento,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='07079' BEGIN  
		EXEC [db_nomina].[sp_departamento_delete] 
			@uid_departamento,
			@cod_departamento,
			@descripcion,
			@fechacreacion,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END