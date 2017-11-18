/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_parametros_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_parametros_Insert')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_parametros_Insert];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_parametros_Insert] 
   ( @uid_parametro VARCHAR(36),
	@cod_parametro INT,
	@valor VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@fecharegistro DATE,
	@fechamodificacion DATE,
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_trazabilidad].[tb_parametros] Where uid_parametro = @uid_parametro );
	IF @CONT=0 BEGIN
    Insert Into  [db_trazabilidad].[tb_parametros](	
	        uid_parametro,
			cod_parametro,
			valor,
			estadoexistencia,
			fecharegistro,
			fechamodificacion
	) 
	Values(	
			@uid_parametro,
			@cod_parametro,
			@valor,
			@estadoexistencia,
			@fecharegistro,
			@fechamodificacion
	);

	SET @CONT=(Select count(1) From [db_trazabilidad].[tb_parametros] Where uid_parametro = @uid_parametro );
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