/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_bodega]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_bodega')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_bodega];
	END
	GO
CREATE PROCEDURE [db_inventario].[sp_bodega] 
   ( 
	@uid_bodega VARCHAR(36),
	@cod_bodega VARCHAR(10),
	@descripcionbodega VARCHAR(100),
	@capacidad VARCHAR(5),
	@fechacreacionbodega DATE,
	@direccionbodega VARCHAR(200),
	@cod_empresa VARCHAR(36),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='03096' BEGIN  
		EXEC [db_inventario].[sp_bodega_select] 
			@uid_bodega,
			@cod_bodega,
			@descripcionbodega,
			@capacidad,
			@fechacreacionbodega,
			@direccionbodega,
			@cod_empresa,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='03097' BEGIN  
		EXEC [db_inventario].[sp_bodega_insert] 
			@uid_bodega,
			@cod_bodega,
			@descripcionbodega,
			@capacidad,
			@fechacreacionbodega,
			@direccionbodega,
			@cod_empresa,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='03098' BEGIN  
		EXEC [db_inventario].[sp_bodega_update] 
			@uid_bodega,
			@cod_bodega,
			@descripcionbodega,
			@capacidad,
			@fechacreacionbodega,
			@direccionbodega,
			@cod_empresa,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='03099' BEGIN  
		EXEC [db_inventario].[sp_bodega_delete] 
			@uid_bodega,
			@cod_bodega,
			@descripcionbodega,
			@capacidad,
			@fechacreacionbodega,
			@direccionbodega,
			@cod_empresa,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END