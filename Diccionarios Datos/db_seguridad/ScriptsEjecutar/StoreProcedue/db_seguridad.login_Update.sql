/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_login_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_login_Update')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_login_Update];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_login_Update] 
   ( @id_login INT,
	@usuario VARCHAR(8),
	@clave VARCHAR(20),
	@fechacreacionlogin DATE,
	@fechamodificacion DATE,
	@fechaexpiracion DATE,
	@estado BIT,
	@expira BIT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_login] Where id_login = @id_login );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_login]	
	 Set  id_login=case when @id_login IS NULL then id_login else @id_login end,
			
usuario=case when @usuario IS NULL then usuario else @usuario end,
			
clave=case when @clave IS NULL then clave else @clave end,
			
fechacreacionlogin=case when @fechacreacionlogin IS NULL then fechacreacionlogin else @fechacreacionlogin end,
			
fechamodificacion=case when @fechamodificacion IS NULL then fechamodificacion else @fechamodificacion end,
			
fechaexpiracion=case when @fechaexpiracion IS NULL then fechaexpiracion else @fechaexpiracion end,
			
estado=case when @estado IS NULL then estado else @estado end,
			
expira=case when @expira IS NULL then expira else @expira end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where id_login = @id_login 

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