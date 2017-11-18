/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_materiaprima]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_materiaprima')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_materiaprima];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima] 
   ( 
	@descripcionmateria VARCHAR(100),
	@unidad VARCHAR(5),
	@fechacreacionmateria DATE,
	@fechamodificacionmateria DATE,
	@estadoexistencia VARCHAR(1),
	@uid_materia VARCHAR(36),
	@cod_materia VARCHAR(10),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='03004' BEGIN  
		EXEC [db_inventario].[sp_materiaprima_select] 
			@descripcionmateria,
			@unidad,
			@fechacreacionmateria,
			@fechamodificacionmateria,
			@estadoexistencia,
			@uid_materia,
			@cod_materia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='03005' BEGIN  
		EXEC [db_inventario].[sp_materiaprima_insert] 
			@descripcionmateria,
			@unidad,
			@fechacreacionmateria,
			@fechamodificacionmateria,
			@estadoexistencia,
			@uid_materia,
			@cod_materia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='03006' BEGIN  
		EXEC [db_inventario].[sp_materiaprima_update] 
			@descripcionmateria,
			@unidad,
			@fechacreacionmateria,
			@fechamodificacionmateria,
			@estadoexistencia,
			@uid_materia,
			@cod_materia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='03007' BEGIN  
		EXEC [db_inventario].[sp_materiaprima_delete] 
			@descripcionmateria,
			@unidad,
			@fechacreacionmateria,
			@fechamodificacionmateria,
			@estadoexistencia,
			@uid_materia,
			@cod_materia,
			@trx,
			@resultado OUT;
	END	
END