/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_kardex]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_kardex')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_kardex];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_kardex] 
   ( 
	@uid_kardex VARCHAR(36),
	@uid_materia VARCHAR(36),
	@ingreso FLOAT,
	@egreso FLOAT,
	@fechakardex DATE,
	@horakardex TIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='03000' BEGIN  
		EXEC [db_inventario].[sp_kardex_select] 
			@uid_kardex,
			@uid_materia,
			@ingreso,
			@egreso,
			@fechakardex,
			@horakardex,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='03001' BEGIN  
		EXEC [db_inventario].[sp_kardex_insert] 
			@uid_kardex,
			@uid_materia,
			@ingreso,
			@egreso,
			@fechakardex,
			@horakardex,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='03002' BEGIN  
		EXEC [db_inventario].[sp_kardex_update] 
			@uid_kardex,
			@uid_materia,
			@ingreso,
			@egreso,
			@fechakardex,
			@horakardex,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='03003' BEGIN  
		EXEC [db_inventario].[sp_kardex_delete] 
			@uid_kardex,
			@uid_materia,
			@ingreso,
			@egreso,
			@fechakardex,
			@horakardex,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END