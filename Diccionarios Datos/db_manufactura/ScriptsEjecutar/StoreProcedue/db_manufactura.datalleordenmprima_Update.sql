/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datalleordenmprima_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datalleordenmprima_Update')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_Update];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_Update] 
   ( @uid_datelleorden VARCHAR(36),
	@uid_cabecera VARCHAR(36),
	@cod_materiaprima VARCHAR(10),
	@cantidad FLOAT,
	@costounit FLOAT,
	@porcentaje FLOAT,
	@costototal FLOAT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_datalleordenmprima] Where uid_datelleorden = @uid_datelleorden );
	IF @CONT>0 BEGIN
    Update  [db_manufactura].[tb_datalleordenmprima]	
	 Set  uid_datelleorden=case when @uid_datelleorden IS NULL then uid_datelleorden else @uid_datelleorden end,
			
uid_cabecera=case when @uid_cabecera IS NULL then uid_cabecera else @uid_cabecera end,
			
cod_materiaprima=case when @cod_materiaprima IS NULL then cod_materiaprima else @cod_materiaprima end,
			
cantidad=case when @cantidad IS NULL then cantidad else @cantidad end,
			
costounit=case when @costounit IS NULL then costounit else @costounit end,
			
porcentaje=case when @porcentaje IS NULL then porcentaje else @porcentaje end,
			
costototal=case when @costototal IS NULL then costototal else @costototal end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_datelleorden = @uid_datelleorden 

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