/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcacionesproc_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcacionesproc_Update')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcacionesproc_Update];
	END
GO

CREATE PROCEDURE [db_marcaciones].[sp_marcacionesproc_Update] 
   ( @uid_marcacionesproc VARCHAR(36),
	@cod_marcacion VARCHAR(5),
	@cedula VARCHAR(13),
	@fechamarc DATE,
	@hentrada TIME,
	@hsalida TIME,
	@atraso TIME,
	@extra TIME,
	@justificado BIT,
	@motivojust VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_marcaciones].[tb_marcacionesproc] Where uid_marcacionesproc = @uid_marcacionesproc );
	IF @CONT>0 BEGIN
    Update  [db_marcaciones].[tb_marcacionesproc]	
	 Set  uid_marcacionesproc=case when @uid_marcacionesproc IS NULL then uid_marcacionesproc else @uid_marcacionesproc end,
			
cod_marcacion=case when @cod_marcacion IS NULL then cod_marcacion else @cod_marcacion end,
			
cedula=case when @cedula IS NULL then cedula else @cedula end,
			
fechamarc=case when @fechamarc IS NULL then fechamarc else @fechamarc end,
			
hentrada=case when @hentrada IS NULL then hentrada else @hentrada end,
			
hsalida=case when @hsalida IS NULL then hsalida else @hsalida end,
			
atraso=case when @atraso IS NULL then atraso else @atraso end,
			
extra=case when @extra IS NULL then extra else @extra end,
			
justificado=case when @justificado IS NULL then justificado else @justificado end,
			
motivojust=case when @motivojust IS NULL then motivojust else @motivojust end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_marcacionesproc = @uid_marcacionesproc 

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