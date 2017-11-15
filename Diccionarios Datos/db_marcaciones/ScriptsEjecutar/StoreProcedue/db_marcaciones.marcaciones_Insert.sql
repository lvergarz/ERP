/***************************************************************************/
	--Nombre del Objeto:  [db_marcaciones].[sp_marcaciones_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_marcaciones_Insert')
	BEGIN
		DROP PROCEDURE [db_marcaciones].[sp_marcaciones_Insert];
	END
GO

CREATE PROCEDURE [db_marcaciones].[sp_marcaciones_Insert] 
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
	IF @CONT=0 BEGIN
    Insert Into  [db_marcaciones].[tb_marcaciones](	
	        estadoexistencia,
			uid_marcaciones,
			cod_marcacion,
			nombreemp,
			fechamarc,
			hentrada,
			hsalida,
			horariot
	) 
	Values(	
			@estadoexistencia,
			@uid_marcaciones,
			@cod_marcacion,
			@nombreemp,
			@fechamarc,
			@hentrada,
			@hsalida,
			@horariot
	);

	SET @CONT=(Select count(1) From [db_marcaciones].[tb_marcaciones] Where uid_marcaciones = @uid_marcaciones );
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