/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_kardex_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_kardex_Update')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_kardex_Update];
	END
GO

CREATE PROCEDURE [db_inventario].[sp_kardex_Update] 
   ( @uid_kardex VARCHAR(36),
	@uid_materia VARCHAR(36),
	@ingreso FLOAT,
	@egreso FLOAT,
	@fechakardex DATE,
	@horakardex TIME,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_inventario].[tb_kardex] Where uid_kardex = @uid_kardex );
	IF @CONT>0 BEGIN
    Update  [db_inventario].[tb_kardex]	
	 Set  uid_kardex=case when @uid_kardex IS NULL then uid_kardex else @uid_kardex end,
			
uid_materia=case when @uid_materia IS NULL then uid_materia else @uid_materia end,
			
ingreso=case when @ingreso IS NULL then ingreso else @ingreso end,
			
egreso=case when @egreso IS NULL then egreso else @egreso end,
			
fechakardex=case when @fechakardex IS NULL then fechakardex else @fechakardex end,
			
horakardex=case when @horakardex IS NULL then horakardex else @horakardex end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_kardex = @uid_kardex 

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