/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_cabeceraorden_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_cabeceraorden_Update')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_cabeceraorden_Update];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_Update] 
   ( @uid_cabecera VARCHAR(36),
	@fechainiciocabecera DATETIME,
	@operador VARCHAR(200),
	@fechafin DATETIME,
	@fechaempaque DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_cabeceraorden] Where uid_cabecera = @uid_cabecera );
	IF @CONT>0 BEGIN
    Update  [db_manufactura].[tb_cabeceraorden]	
	 Set  uid_cabecera=case when @uid_cabecera IS NULL then uid_cabecera else @uid_cabecera end,
			
fechainiciocabecera=case when @fechainiciocabecera IS NULL then fechainiciocabecera else @fechainiciocabecera end,
			
operador=case when @operador IS NULL then operador else @operador end,
			
fechafin=case when @fechafin IS NULL then fechafin else @fechafin end,
			
fechaempaque=case when @fechaempaque IS NULL then fechaempaque else @fechaempaque end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_cabecera = @uid_cabecera 

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