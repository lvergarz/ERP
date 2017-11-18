/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_permisosroltrx_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_permisosroltrx_Update')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_permisosroltrx_Update];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_Update] 
   ( @uid_permiso VARCHAR(36),
	@uid_roltrx VARCHAR(36),
	@uid_login VARCHAR(36),
	@fechacreacionpermisosroltrx DATE,
	@fechamodificacionpermisosroltrx DATE,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_permisosroltrx] Where uid_permiso = @uid_permiso );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_permisosroltrx]	
	 Set  uid_permiso=case when @uid_permiso IS NULL then uid_permiso else @uid_permiso end,
			
uid_roltrx=case when @uid_roltrx IS NULL then uid_roltrx else @uid_roltrx end,
			
uid_login=case when @uid_login IS NULL then uid_login else @uid_login end,
			
fechacreacionpermisosroltrx=case when @fechacreacionpermisosroltrx IS NULL then fechacreacionpermisosroltrx else @fechacreacionpermisosroltrx end,
			
fechamodificacionpermisosroltrx=case when @fechamodificacionpermisosroltrx IS NULL then fechamodificacionpermisosroltrx else @fechamodificacionpermisosroltrx end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_permiso = @uid_permiso 

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