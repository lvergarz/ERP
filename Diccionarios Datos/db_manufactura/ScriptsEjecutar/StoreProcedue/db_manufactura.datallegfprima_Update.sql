/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datallegfprima_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datallegfprima_Update')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datallegfprima_Update];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_Update] 
   ( @uid_datelleordengf VARCHAR(36),
	@uid_cabecera VARCHAR(36),
	@uid_gatosf VARCHAR(36),
	@horas INT,
	@costo FLOAT,
	@porcentaje FLOAT,
	@total FLOAT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_datallegfprima] Where uid_datelleordengf = @uid_datelleordengf );
	IF @CONT>0 BEGIN
    Update  [db_manufactura].[tb_datallegfprima]	
	 Set  uid_datelleordengf=case when @uid_datelleordengf IS NULL then uid_datelleordengf else @uid_datelleordengf end,
			
uid_cabecera=case when @uid_cabecera IS NULL then uid_cabecera else @uid_cabecera end,
			
uid_gatosf=case when @uid_gatosf IS NULL then uid_gatosf else @uid_gatosf end,
			
horas=case when @horas IS NULL then horas else @horas end,
			
costo=case when @costo IS NULL then costo else @costo end,
			
porcentaje=case when @porcentaje IS NULL then porcentaje else @porcentaje end,
			
total=case when @total IS NULL then total else @total end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_datelleordengf = @uid_datelleordengf 

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