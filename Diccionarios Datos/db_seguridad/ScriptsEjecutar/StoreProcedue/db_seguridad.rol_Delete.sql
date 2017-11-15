
/***************************************************************************/
	--Nombre del Objeto:  [db_seguridad].[sp_rol_Delete]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_rol_Delete')
	BEGIN
		DROP PROCEDURE [db_seguridad].[sp_rol_Delete];
	END
GO

CREATE PROCEDURE [db_seguridad].[sp_rol_Delete] 
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
    DECLARE @ESDELETELOGICO NVARCHAR(2); SET @ESDELETELOGICO ='si';
	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_seguridad].[tb_rol] Where id_rol = @id_rol );
	IF @CONT>0 BEGIN
	IF(@ESDELETELOGICO='SI')
	BEGIN
	Update  [db_seguridad].[tb_rol] Set EstadoExistencia = 'E' Where id_rol = @id_rol ;
	END
	ELSE
	BEGIN
	Delete  [db_seguridad].[tb_rol] Where id_rol = @id_rol ;
	END
	 IF @@ROWCOUNT = 0
	 BEGIN
	   SET @resultado='00006';
	 END
	 ELSE
	  BEGIN 
	   SET @resultado='00003';
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
