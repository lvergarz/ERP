/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_cabeceraorden]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_cabeceraorden')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_cabeceraorden];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden] 
   ( 
	@id_cabecera INT,
	@fechainiciocabecera DATETIME,
	@operador VARCHAR(200),
	@fechafin DATETIME,
	@fechaempaque DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='04008' BEGIN  
		EXEC [db_manufactura].[sp_cabeceraorden_select] 
			@id_cabecera,
			@fechainiciocabecera,
			@operador,
			@fechafin,
			@fechaempaque,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='04009' BEGIN  
		EXEC [db_manufactura].[sp_cabeceraorden_insert] 
			@id_cabecera,
			@fechainiciocabecera,
			@operador,
			@fechafin,
			@fechaempaque,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='04010' BEGIN  
		EXEC [db_manufactura].[sp_cabeceraorden_update] 
			@id_cabecera,
			@fechainiciocabecera,
			@operador,
			@fechafin,
			@fechaempaque,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='04011' BEGIN  
		EXEC [db_manufactura].[sp_cabeceraorden_delete] 
			@id_cabecera,
			@fechainiciocabecera,
			@operador,
			@fechafin,
			@fechaempaque,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END