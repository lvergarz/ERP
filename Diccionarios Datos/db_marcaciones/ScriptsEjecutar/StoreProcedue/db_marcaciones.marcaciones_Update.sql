/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcaciones_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcaciones_Update')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcaciones_Update];
	END
GO

CREATE PROCEDURE [db_marcaciones].[sp_marcaciones_Update] 
   ( @estadoexistencia VARCHAR(1),
	@uid_marcaciones VARCHAR(36),
	@cod_marcacion VARCHAR(5),
	@nombreemp VARCHAR(100),
	@fechamarc VARCHAR(15),
	@hentrada TIME,
	@hsalida TIME,
	@horariot VARCHAR(30),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_marcaciones].[tb_marcaciones] Where uid_marcaciones = @uid_marcaciones );
	IF @CONT>0 BEGIN
    Update  [db_marcaciones].[tb_marcaciones]	
	 Set  estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end,
			
uid_marcaciones=case when @uid_marcaciones IS NULL then uid_marcaciones else @uid_marcaciones end,
			
cod_marcacion=case when @cod_marcacion IS NULL then cod_marcacion else @cod_marcacion end,
			
nombreemp=case when @nombreemp IS NULL then nombreemp else @nombreemp end,
			
fechamarc=case when @fechamarc IS NULL then fechamarc else @fechamarc end,
			
hentrada=case when @hentrada IS NULL then hentrada else @hentrada end,
			
hsalida=case when @hsalida IS NULL then hsalida else @hsalida end,
			
horariot=case when @horariot IS NULL then horariot else @horariot end
	 Where uid_marcaciones = @uid_marcaciones 

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