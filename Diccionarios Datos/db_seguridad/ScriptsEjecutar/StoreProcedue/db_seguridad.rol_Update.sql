/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_rol_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_rol_Update')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_rol_Update];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_rol_Update] 
   ( @id_rol VARCHAR(8),
	@cod_rol VARCHAR(20),
	@nombrerol VARCHAR(20),
	@descripcionrol VARCHAR(500),
	@fechacreacionrol DATE,
	@estado BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_rol] Where id_rol = @id_rol );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_rol]	
	 Set  id_rol=case when @id_rol IS NULL then id_rol else @id_rol end,
			
cod_rol=case when @cod_rol IS NULL then cod_rol else @cod_rol end,
			
nombrerol=case when @nombrerol IS NULL then nombrerol else @nombrerol end,
			
descripcionrol=case when @descripcionrol IS NULL then descripcionrol else @descripcionrol end,
			
fechacreacionrol=case when @fechacreacionrol IS NULL then fechacreacionrol else @fechacreacionrol end,
			
estado=case when @estado IS NULL then estado else @estado end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where id_rol = @id_rol 

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