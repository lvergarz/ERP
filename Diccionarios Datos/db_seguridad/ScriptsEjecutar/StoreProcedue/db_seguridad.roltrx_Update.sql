/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_roltrx_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_roltrx_Update')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_roltrx_Update];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_roltrx_Update] 
   ( @id_roltrx VARCHAR(8),
	@cod_rol VARCHAR(20),
	@cod_trx VARCHAR(20),
	@fechacreacionroltrx DATE,
	@fechamodificacion DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_roltrx] Where id_roltrx = @id_roltrx );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_roltrx]	
	 Set  id_roltrx=case when @id_roltrx IS NULL then id_roltrx else @id_roltrx end,
			
cod_rol=case when @cod_rol IS NULL then cod_rol else @cod_rol end,
			
cod_trx=case when @cod_trx IS NULL then cod_trx else @cod_trx end,
			
fechacreacionroltrx=case when @fechacreacionroltrx IS NULL then fechacreacionroltrx else @fechacreacionroltrx end,
			
fechamodificacion=case when @fechamodificacion IS NULL then fechamodificacion else @fechamodificacion end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where id_roltrx = @id_roltrx 

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