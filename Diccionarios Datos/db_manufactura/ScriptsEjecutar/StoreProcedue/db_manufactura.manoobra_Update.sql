/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_manoobra_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_manoobra_Update')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_manoobra_Update];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_manoobra_Update] 
   ( @uid_manoobra VARCHAR(36),
	@descripcionmanoobra VARCHAR(100),
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_manoobra] Where uid_manoobra = @uid_manoobra );
	IF @CONT>0 BEGIN
    Update  [db_manufactura].[tb_manoobra]	
	 Set  uid_manoobra=case when @uid_manoobra IS NULL then uid_manoobra else @uid_manoobra end,
			
descripcionmanoobra=case when @descripcionmanoobra IS NULL then descripcionmanoobra else @descripcionmanoobra end,
			
estado=case when @estado IS NULL then estado else @estado end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_manoobra = @uid_manoobra 

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