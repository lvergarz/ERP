/***************************************************************************/
	--Nombre del Objeto:  [db_empresa].[sp_empresa]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empresa')
	BEGIN
		DROP PROCEDURE [db_empresa].[sp_empresa];
	END
	GO
CREATE PROCEDURE [db_empresa].[sp_empresa] 
   ( 
	@uid_empresa VARCHAR(36),
	@ruc INT,
	@nombre FLOAT,
	@descripcion VARCHAR(500),
	@direccion VARCHAR(200),
	@telefono VARCHAR(100),
	@representantelegal VARCHAR(200),
	@imagen VARCHAR(50),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='06064' BEGIN  
		EXEC [db_empresa].[sp_empresa_select] 
			@uid_empresa,
			@ruc,
			@nombre,
			@descripcion,
			@direccion,
			@telefono,
			@representantelegal,
			@imagen,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='06065' BEGIN  
		EXEC [db_empresa].[sp_empresa_insert] 
			@uid_empresa,
			@ruc,
			@nombre,
			@descripcion,
			@direccion,
			@telefono,
			@representantelegal,
			@imagen,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='06066' BEGIN  
		EXEC [db_empresa].[sp_empresa_update] 
			@uid_empresa,
			@ruc,
			@nombre,
			@descripcion,
			@direccion,
			@telefono,
			@representantelegal,
			@imagen,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='06067' BEGIN  
		EXEC [db_empresa].[sp_empresa_delete] 
			@uid_empresa,
			@ruc,
			@nombre,
			@descripcion,
			@direccion,
			@telefono,
			@representantelegal,
			@imagen,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END