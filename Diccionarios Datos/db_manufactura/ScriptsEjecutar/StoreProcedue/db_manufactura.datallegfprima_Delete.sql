
/***************************************************************************/
	--Nombre del Objeto:  [db_manufactura].[sp_datallegfprima_Delete]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_datallegfprima_Delete')
	BEGIN
		DROP PROCEDURE [db_manufactura].[sp_datallegfprima_Delete];
	END
GO

CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_Delete] 
   ( @id_datelleordengf INT,
	@id_cabecera INT,
	@id_gatosf INT,
	@horas INT,
	@costo FLOAT,
	@porcentaje FLOAT,
	@total FLOAT,
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
    DECLARE @ESDELETELOGICO NVARCHAR(2); SET @ESDELETELOGICO ='si';
	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_manufactura].[tb_datallegfprima] Where id_datelleordengf = @id_datelleordengf );
	IF @CONT>0 BEGIN
	IF(@ESDELETELOGICO='SI')
	BEGIN
	Update  [db_manufactura].[tb_datallegfprima] Set EstadoExistencia = 'E' Where id_datelleordengf = @id_datelleordengf ;
	END
	ELSE
	BEGIN
	Delete  [db_manufactura].[tb_datallegfprima] Where id_datelleordengf = @id_datelleordengf ;
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
