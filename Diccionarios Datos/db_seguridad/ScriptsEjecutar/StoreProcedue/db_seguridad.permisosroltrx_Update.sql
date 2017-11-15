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
   ( @id_permiso VARCHAR(8),
	@id_roltrx VARCHAR(8),
	@id_login VARCHAR(8),
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
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_permisosroltrx] Where id_permiso = @id_permiso );
	IF @CONT>0 BEGIN
    Update  [db_seguridad].[tb_permisosroltrx]	
	 Set  id_permiso=case when @id_permiso IS NULL then id_permiso else @id_permiso end,
			
id_roltrx=case when @id_roltrx IS NULL then id_roltrx else @id_roltrx end,
			
id_login=case when @id_login IS NULL then id_login else @id_login end,
			
fechacreacionpermisosroltrx=case when @fechacreacionpermisosroltrx IS NULL then fechacreacionpermisosroltrx else @fechacreacionpermisosroltrx end,
			
fechamodificacionpermisosroltrx=case when @fechamodificacionpermisosroltrx IS NULL then fechamodificacionpermisosroltrx else @fechamodificacionpermisosroltrx end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where id_permiso = @id_permiso 

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