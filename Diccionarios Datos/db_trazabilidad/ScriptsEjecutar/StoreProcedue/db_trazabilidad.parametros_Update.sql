/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_parametros_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_parametros_Update')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_parametros_Update];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_parametros_Update] 
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
	IF @CONT>0 BEGIN
    Update  [db_trazabilidad].[tb_parametros]	
	 Set  uid_parametro=case when @uid_parametro IS NULL then uid_parametro else @uid_parametro end,
			
cod_parametro=case when @cod_parametro IS NULL then cod_parametro else @cod_parametro end,
			
valor=case when @valor IS NULL then valor else @valor end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end,
			
fecharegistro=case when @fecharegistro IS NULL then fecharegistro else @fecharegistro end,
			
fechamodificacion=case when @fechamodificacion IS NULL then fechamodificacion else @fechamodificacion end
	 Where uid_parametro = @uid_parametro 

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