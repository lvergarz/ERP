
/***************************************************************************/
	--Nombre del Objeto:  [db_trazabilidad].[sp_parametros_Delete]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_parametros_Delete')
	BEGIN
		DROP PROCEDURE [db_trazabilidad].[sp_parametros_Delete];
	END
GO

CREATE PROCEDURE [db_trazabilidad].[sp_parametros_Delete] 
   ( @uid_parametro VARCHAR(36),
	@cod_parametro INT,
	@valor VARCHAR(2000),
	@estadoexistencia VARCHAR(1),
	@fecharegistro DATE,
	@fechamodificacion DATE,
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
    DECLARE @ESDELETELOGICO NVARCHAR(2); SET @ESDELETELOGICO ='si';
	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_trazabilidad].[tb_parametros] Where uid_parametro = @uid_parametro );
	IF @CONT>0 BEGIN
	IF(@ESDELETELOGICO='SI')
	BEGIN
	Update  [db_trazabilidad].[tb_parametros] Set EstadoExistencia = 'E' Where uid_parametro = @uid_parametro ;
	END
	ELSE
	BEGIN
	Delete  [db_trazabilidad].[tb_parametros] Where uid_parametro = @uid_parametro ;
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
