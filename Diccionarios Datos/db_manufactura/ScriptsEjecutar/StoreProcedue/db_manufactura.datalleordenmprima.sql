/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datalleordenmprima]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datalleordenmprima')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima] 
   ( 
	@uid_datelleorden VARCHAR(36),
	@uid_cabecera VARCHAR(36),
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
	IF @trx='04012' BEGIN  
		EXEC [db_manufactura].[sp_datalleordenmprima_select] 
			@uid_datelleorden,
			@uid_cabecera,
			@cod_materiaprima,
			@cantidad,
			@costounit,
			@porcentaje,
			@costototal,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='04013' BEGIN  
		EXEC [db_manufactura].[sp_datalleordenmprima_insert] 
			@uid_datelleorden,
			@uid_cabecera,
			@cod_materiaprima,
			@cantidad,
			@costounit,
			@porcentaje,
			@costototal,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='04014' BEGIN  
		EXEC [db_manufactura].[sp_datalleordenmprima_update] 
			@uid_datelleorden,
			@uid_cabecera,
			@cod_materiaprima,
			@cantidad,
			@costounit,
			@porcentaje,
			@costototal,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='04015' BEGIN  
		EXEC [db_manufactura].[sp_datalleordenmprima_delete] 
			@uid_datelleorden,
			@uid_cabecera,
			@cod_materiaprima,
			@cantidad,
			@costounit,
			@porcentaje,
			@costototal,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END