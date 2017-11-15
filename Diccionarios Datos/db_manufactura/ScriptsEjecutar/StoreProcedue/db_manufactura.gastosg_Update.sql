/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_gastosg_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_gastosg_Update')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_gastosg_Update];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_gastosg_Update] 
   ( @uid_gastosg VARCHAR(36),
	@descripciongastosg VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_gastosg] Where uid_gastosg = @uid_gastosg );
	IF @CONT>0 BEGIN
    Update  [db_manufactura].[tb_gastosg]	
	 Set  uid_gastosg=case when @uid_gastosg IS NULL then uid_gastosg else @uid_gastosg end,
			
descripciongastosg=case when @descripciongastosg IS NULL then descripciongastosg else @descripciongastosg end,
			
estado=case when @estado IS NULL then estado else @estado end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_gastosg = @uid_gastosg 

	 IF @@ROWCOUNT = 0
	 BEGIN
	   SET @resultado='00005';
	 END
	 ELSE
	  BEGIN 
	   SET @resultado='00002';
	 	 END
	END	 
    COMMIT  TRANSACTION transaccionSql	;			
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