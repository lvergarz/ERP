/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_manoobra]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_manoobra')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_manoobra];
	END
	GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra] 
   ( 
	@id_manoobra INT,
	@descripcionmanoobra VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
	IF @trx='04024' BEGIN  
		EXEC [db_manufactura].[sp_manoobra_select] 
			@id_manoobra,
			@descripcionmanoobra,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
            
	END 
	ELSE  
	IF @trx='04025' BEGIN  
		EXEC [db_manufactura].[sp_manoobra_insert] 
			@id_manoobra,
			@descripcionmanoobra,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END 
	ELSE
	IF @trx='04026' BEGIN  
		EXEC [db_manufactura].[sp_manoobra_update] 
			@id_manoobra,
			@descripcionmanoobra,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
	ELSE
	IF @trx='04027' BEGIN  
		EXEC [db_manufactura].[sp_manoobra_delete] 
			@id_manoobra,
			@descripcionmanoobra,
			@estado,
			@estadoexistencia,
			@trx,
			@resultado OUT;
	END	
END