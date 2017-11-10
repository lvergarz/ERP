/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_traza_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_traza_Insert')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_traza_Insert];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_traza_Insert] 
   ( @id_traza INT,
	@id_trx INT,
	@id_login INT,
	@accion VARCHAR(20),
	@log DATE,
	@fechalog DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_trazabilidad].[tb_traza] Where id_traza = @id_traza );
	IF @CONT=0 BEGIN
    Insert Into  [db_trazabilidad].[tb_traza](	
	        id_traza,
			id_trx,
			id_login,
			accion,
			log,
			fechalog,
			estadoexistencia
	) 
	Values(	
			@id_traza,
			@id_trx,
			@id_login,
			@accion,
			@log,
			@fechalog,
			@estadoexistencia
	);

	SET @CONT=(Select count(1) From [db_trazabilidad].[tb_traza] Where id_traza = @id_traza );
	IF(@CONT>0)
	BEGIN
	 SET @resultado='00001';
	END
	ELSE
	BEGIN
	  SET @resultado='00004';
	  END
	
	END	 
	ELSE
	BEGIN 
	  SET @resultado='00020';
	END
    COMMIT  TRANSACTION transaccionSql;			
    END TRY
    BEGIN CATCH 
	  SET @resultado='90000';
        PRINT
		     'ERROR_NUMBER: '+ERROR_NUMBER()+' '+
             'ERROR_SEVERITY: '+ERROR_SEVERITY() +' '+
             'ERROR_STATE: '+ERROR_STATE()+' '+
             'ERROR_PROCEDURE: '+ERROR_PROCEDURE()+' '+
             'ERROR_LINE: '+ERROR_LINE() +' '+
             'ERROR_MESSAGE: '+ERROR_MESSAGE()
			  
            ROLLBACK TRANSACTION transaccionSql			
    END CATCH
END