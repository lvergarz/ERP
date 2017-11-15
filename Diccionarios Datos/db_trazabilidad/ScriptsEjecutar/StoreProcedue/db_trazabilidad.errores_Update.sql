/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_errores_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_errores_Update')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_errores_Update];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_errores_Update] 
   ( @id_error INT,
	@cod_error VARCHAR(20),
	@mensajeusuario VARCHAR(MAX),
	@mensajenativo VARCHAR(MAX),
	@tipoerror VARCHAR(15),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_trazabilidad].[tb_errores] Where id_error = @id_error );
	IF @CONT>0 BEGIN
    Update  [db_trazabilidad].[tb_errores]	
	 Set  id_error=case when @id_error IS NULL then id_error else @id_error end,
			
cod_error=case when @cod_error IS NULL then cod_error else @cod_error end,
			
mensajeusuario=case when @mensajeusuario IS NULL then mensajeusuario else @mensajeusuario end,
			
mensajenativo=case when @mensajenativo IS NULL then mensajenativo else @mensajenativo end,
			
tipoerror=case when @tipoerror IS NULL then tipoerror else @tipoerror end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where id_error = @id_error 

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