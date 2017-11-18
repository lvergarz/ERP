/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_centrocostos_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_centrocostos_Insert')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_centrocostos_Insert];
	END
GO

CREATE PROCEDURE [db_nomina].[sp_centrocostos_Insert] 
   ( @uid_centro VARCHAR(36),
	@codigo_centro VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_nomina].[tb_centrocostos] Where uid_centro = @uid_centro );
	IF @CONT=0 BEGIN
    Insert Into  [db_nomina].[tb_centrocostos](	
	        uid_centro,
			codigo_centro,
			descripcion,
			fechacreacion,
			estadoexistencia
	) 
	Values(	
			@uid_centro,
			@codigo_centro,
			@descripcion,
			@fechacreacion,
			@estadoexistencia
	);

	SET @CONT=(Select count(1) From [db_nomina].[tb_centrocostos] Where uid_centro = @uid_centro );
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