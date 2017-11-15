/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_centrocostos_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_centrocostos_Update')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_centrocostos_Update];
	END
GO

CREATE PROCEDURE [db_nomina].[sp_centrocostos_Update] 
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
	IF @CONT>0 BEGIN
    Update  [db_nomina].[tb_centrocostos]	
	 Set  uid_centro=case when @uid_centro IS NULL then uid_centro else @uid_centro end,
			
codigo_centro=case when @codigo_centro IS NULL then codigo_centro else @codigo_centro end,
			
descripcion=case when @descripcion IS NULL then descripcion else @descripcion end,
			
fechacreacion=case when @fechacreacion IS NULL then fechacreacion else @fechacreacion end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_centro = @uid_centro 

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