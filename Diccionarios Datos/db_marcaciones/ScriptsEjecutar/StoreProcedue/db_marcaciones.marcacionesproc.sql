/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcacionesproc]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcacionesproc')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcacionesproc];
	END
	GO
CREATE PROCEDURE [db_marcaciones].[sp_marcacionesproc] 
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
	IF @trx='05060' BEGIN  
		EXEC [db_marcaciones].[sp_marcacionesproc_select] 
			@uid_marcacionesproc,
			@cod_marcacion,
			@cedula,
			@fechamarc,
			@hentrada,
			@hsalida,
			@atraso,
			@extra,
			@justificado,
			@motivojust,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='05061' BEGIN  
		EXEC [db_marcaciones].[sp_marcacionesproc_insert] 
			@uid_marcacionesproc,
			@cod_marcacion,
			@cedula,
			@fechamarc,
			@hentrada,
			@hsalida,
			@atraso,
			@extra,
			@justificado,
			@motivojust,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='05062' BEGIN  
		EXEC [db_marcaciones].[sp_marcacionesproc_update] 
			@uid_marcacionesproc,
			@cod_marcacion,
			@cedula,
			@fechamarc,
			@hentrada,
			@hsalida,
			@atraso,
			@extra,
			@justificado,
			@motivojust,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='05063' BEGIN  
		EXEC [db_marcaciones].[sp_marcacionesproc_delete] 
			@uid_marcacionesproc,
			@cod_marcacion,
			@cedula,
			@fechamarc,
			@hentrada,
			@hsalida,
			@atraso,
			@extra,
			@justificado,
			@motivojust,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END