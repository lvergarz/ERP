/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_traza_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_traza_Update')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_traza_Update];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_traza_Update] 
   ( @uid_traza VARCHAR(36),
	@uid_trx VARCHAR(36),
	@uid_login VARCHAR(36),
	@accion VARCHAR(200),
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
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_trazabilidad].[tb_traza] Where uid_traza = @uid_traza );
	IF @CONT>0 BEGIN
    Update  [db_trazabilidad].[tb_traza]	
	 Set  uid_traza=case when @uid_traza IS NULL then uid_traza else @uid_traza end,
			
uid_trx=case when @uid_trx IS NULL then uid_trx else @uid_trx end,
			
uid_login=case when @uid_login IS NULL then uid_login else @uid_login end,
			
accion=case when @accion IS NULL then accion else @accion end,
			
log=case when @log IS NULL then log else @log end,
			
fechalog=case when @fechalog IS NULL then fechalog else @fechalog end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_traza = @uid_traza 

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