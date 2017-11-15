/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datallegfprima]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datallegfprima')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datallegfprima];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima] 
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
	IF @trx='04016' BEGIN  
		EXEC [db_manufactura].[sp_datallegfprima_select] 
			@id_datelleordengf,
			@id_cabecera,
			@id_gatosf,
			@horas,
			@costo,
			@porcentaje,
			@total,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='04017' BEGIN  
		EXEC [db_manufactura].[sp_datallegfprima_insert] 
			@id_datelleordengf,
			@id_cabecera,
			@id_gatosf,
			@horas,
			@costo,
			@porcentaje,
			@total,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='04018' BEGIN  
		EXEC [db_manufactura].[sp_datallegfprima_update] 
			@id_datelleordengf,
			@id_cabecera,
			@id_gatosf,
			@horas,
			@costo,
			@porcentaje,
			@total,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='04019' BEGIN  
		EXEC [db_manufactura].[sp_datallegfprima_delete] 
			@id_datelleordengf,
			@id_cabecera,
			@id_gatosf,
			@horas,
			@costo,
			@porcentaje,
			@total,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END