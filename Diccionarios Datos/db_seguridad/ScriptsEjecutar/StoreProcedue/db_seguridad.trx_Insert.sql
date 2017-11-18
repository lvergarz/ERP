/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_trx_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_trx_Insert')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_trx_Insert];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_trx_Insert] 
   ( @uid_trx VARCHAR(36),
	@cod_trx VARCHAR(20),
	@nombre_trx VARCHAR(20),
	@descripciontrx VARCHAR(500),
	@fechadecreaciontrx DATE,
	@estadotrx BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_trx] Where uid_trx = @uid_trx );
	IF @CONT=0 BEGIN
    Insert Into  [db_seguridad].[tb_trx](	
	        uid_trx,
			cod_trx,
			nombre_trx,
			descripciontrx,
			fechadecreaciontrx,
			estadotrx,
			estadoexistencia
	) 
	Values(	
			@uid_trx,
			@cod_trx,
			@nombre_trx,
			@descripciontrx,
			@fechadecreaciontrx,
			@estadotrx,
			@estadoexistencia
	);

	SET @CONT=(Select count(1) From [db_seguridad].[tb_trx] Where uid_trx = @uid_trx );
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