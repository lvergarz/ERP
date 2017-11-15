/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datalleordenmprima_Insert]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datalleordenmprima_Insert')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datalleordenmprima_Insert];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_Insert] 
   ( @id_datelleorden INT,
	@id_cabecera INT,
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
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_datalleordenmprima] Where id_datelleorden = @id_datelleorden );
	IF @CONT=0 BEGIN
    Insert Into  [db_manufactura].[tb_datalleordenmprima](	
	        id_datelleorden,
			id_cabecera,
			cod_materiaprima,
			cantidad,
			costounit,
			porcentaje,
			costototal,
			estadoexistencia
	) 
	Values(	
			@id_datelleorden,
			@id_cabecera,
			@cod_materiaprima,
			@cantidad,
			@costounit,
			@porcentaje,
			@costototal,
			@estadoexistencia
	);

	SET @CONT=(Select count(1) From [db_manufactura].[tb_datalleordenmprima] Where id_datelleorden = @id_datelleorden );
	IF(@CONT>0)
	BEGIN
	 SET @resultado='00001';
	END
	ELSE
	BEGIN
	  SET @resultado='00004';
	  END
	
	END	 
	ELSE
	BEGIN 
	  SET @resultado='00020';
	END
    COMMIT  TRANSACTION transaccionSql;			
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