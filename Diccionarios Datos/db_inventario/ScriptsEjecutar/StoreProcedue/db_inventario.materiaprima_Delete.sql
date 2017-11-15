
/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_materiaprima_Delete]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_materiaprima_Delete')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_materiaprima_Delete];
	END
GO

CREATE PROCEDURE [db_inventario].[sp_materiaprima_Delete] 
   ( @descripcionmateria VARCHAR(100),
	@unidad VARCHAR(5),
	@fechacreacionmateria DATE,
	@fechamodificacionmateria DATE,
	@estadoexistencia VARCHAR(1),
	@uid_materia VARCHAR(36),
	@cod_materia VARCHAR(10),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
    DECLARE @ESDELETELOGICO NVARCHAR(2); SET @ESDELETELOGICO ='si';
	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_inventario].[tb_materiaprima] Where uid_materia = @uid_materia );
	IF @CONT>0 BEGIN
	IF(@ESDELETELOGICO='SI')
	BEGIN
	Update  [db_inventario].[tb_materiaprima] Set EstadoExistencia = 'E' Where uid_materia = @uid_materia ;
	END
	ELSE
	BEGIN
	Delete  [db_inventario].[tb_materiaprima] Where uid_materia = @uid_materia ;
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
