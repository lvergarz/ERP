/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_gastosg]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_gastosg')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_gastosg];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg] 
   ( 
	@uid_gastosg VARCHAR(36),
	@descripciongastosg VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='04020' BEGIN  
		EXEC [db_manufactura].[sp_gastosg_select] 
			@uid_gastosg,
			@descripciongastosg,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='04021' BEGIN  
		EXEC [db_manufactura].[sp_gastosg_insert] 
			@uid_gastosg,
			@descripciongastosg,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='04022' BEGIN  
		EXEC [db_manufactura].[sp_gastosg_update] 
			@uid_gastosg,
			@descripciongastosg,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='04023' BEGIN  
		EXEC [db_manufactura].[sp_gastosg_delete] 
			@uid_gastosg,
			@descripciongastosg,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END