/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_cargo_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_cargo_Update')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_cargo_Update];
	END
GO

CREATE PROCEDURE [db_nomina].[sp_cargo_Update] 
   ( @uid_cargos VARCHAR(36),
	@cod_cargos VARCHAR(5),
	@descripcion VARCHAR(100),
	@fechacreacion DATETIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_nomina].[tb_cargo] Where uid_cargos = @uid_cargos );
	IF @CONT>0 BEGIN
    Update  [db_nomina].[tb_cargo]	
	 Set  uid_cargos=case when @uid_cargos IS NULL then uid_cargos else @uid_cargos end,
			
cod_cargos=case when @cod_cargos IS NULL then cod_cargos else @cod_cargos end,
			
descripcion=case when @descripcion IS NULL then descripcion else @descripcion end,
			
fechacreacion=case when @fechacreacion IS NULL then fechacreacion else @fechacreacion end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_cargos = @uid_cargos 

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