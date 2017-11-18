/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_trx_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_trx_Update')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_trx_Update];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_trx_Update] 
   ( @uid_trx VARCHAR(36),
	@cod_trx VARCHAR(20),
	@nombre_trx VARCHAR(20),
	@descripciontrx VARCHAR(500),
	@fechadecreaciontrx DATE,
	@estadotrx BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_trx] Where uid_trx = @uid_trx );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_trx]	
	 Set  uid_trx=case when @uid_trx IS NULL then uid_trx else @uid_trx end,
			
cod_trx=case when @cod_trx IS NULL then cod_trx else @cod_trx end,
			
nombre_trx=case when @nombre_trx IS NULL then nombre_trx else @nombre_trx end,
			
descripciontrx=case when @descripciontrx IS NULL then descripciontrx else @descripciontrx end,
			
fechadecreaciontrx=case when @fechadecreaciontrx IS NULL then fechadecreaciontrx else @fechadecreaciontrx end,
			
estadotrx=case when @estadotrx IS NULL then estadotrx else @estadotrx end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_trx = @uid_trx 

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