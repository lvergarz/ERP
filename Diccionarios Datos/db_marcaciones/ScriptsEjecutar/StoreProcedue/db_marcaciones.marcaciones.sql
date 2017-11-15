/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcaciones]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcaciones')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcaciones];
	END
	GO
CREATE PROCEDURE [db_marcaciones].[sp_marcaciones] 
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
	IF @trx='05056' BEGIN  
		EXEC [db_marcaciones].[sp_marcaciones_select] 
			@estadoexistencia,
			@uid_marcaciones,
			@cod_marcacion,
			@nombreemp,
			@fechamarc,
			@hentrada,
			@hsalida,
			@horariot,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='05057' BEGIN  
		EXEC [db_marcaciones].[sp_marcaciones_insert] 
			@estadoexistencia,
			@uid_marcaciones,
			@cod_marcacion,
			@nombreemp,
			@fechamarc,
			@hentrada,
			@hsalida,
			@horariot,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='05058' BEGIN  
		EXEC [db_marcaciones].[sp_marcaciones_update] 
			@estadoexistencia,
			@uid_marcaciones,
			@cod_marcacion,
			@nombreemp,
			@fechamarc,
			@hentrada,
			@hsalida,
			@horariot,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='05059' BEGIN  
		EXEC [db_marcaciones].[sp_marcaciones_delete] 
			@estadoexistencia,
			@uid_marcaciones,
			@cod_marcacion,
			@nombreemp,
			@fechamarc,
			@hentrada,
			@hsalida,
			@horariot,
			@trx,
			@resultado OUT;
	END	
END