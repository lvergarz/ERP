/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_materiaprima_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_materiaprima_Update')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_materiaprima_Update];
	END
GO

CREATE PROCEDURE [db_inventario].[sp_materiaprima_Update] 
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

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_inventario].[tb_materiaprima] Where uid_materia = @uid_materia );
	IF @CONT>0 BEGIN
    Update  [db_inventario].[tb_materiaprima]	
	 Set  descripcionmateria=case when @descripcionmateria IS NULL then descripcionmateria else @descripcionmateria end,
			
unidad=case when @unidad IS NULL then unidad else @unidad end,
			
fechacreacionmateria=case when @fechacreacionmateria IS NULL then fechacreacionmateria else @fechacreacionmateria end,
			
fechamodificacionmateria=case when @fechamodificacionmateria IS NULL then fechamodificacionmateria else @fechamodificacionmateria end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end,
			
uid_materia=case when @uid_materia IS NULL then uid_materia else @uid_materia end,
			
cod_materia=case when @cod_materia IS NULL then cod_materia else @cod_materia end
	 Where uid_materia = @uid_materia 

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