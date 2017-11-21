
/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_empleados_Delete]                                     
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empleados_Delete')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_empleados_Delete];
	END
GO

CREATE PROCEDURE [db_nomina].[sp_empleados_Delete] 
   ( @uid_codigo VARCHAR(36),
	@cod_empleado VARCHAR(13),
	@nombres VARCHAR(100),
	@apellidos VARCHAR(100),
	@nacionalidad VARCHAR(50),
	@lnacimiento VARCHAR(50),
	@fechanacimiento DATE,
	@estadocivil VARCHAR(20),
	@edad ,
	@genero VARCHAR(20),
	@celularcontacto VARCHAR(20),
	@telefonocontacto VARCHAR(20),
	@emailcontacto VARCHAR(80),
	@emailempresa VARCHAR(80),
	@tidentificacion VARCHAR(2),
	@identificación VARCHAR(20),
	@nafiliacioniess VARCHAR(20),
	@nlibretamilitar VARCHAR(20),
	@observaciones VARCHAR(MAX),
	@cod_marcacion VARCHAR(36),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN
    DECLARE @ESDELETELOGICO NVARCHAR(2); SET @ESDELETELOGICO ='si';
	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_nomina].[tb_empleados] Where uid_codigo = @uid_codigo );
	IF @CONT>0 BEGIN
	IF(@ESDELETELOGICO='SI')
	BEGIN
	Update  [db_nomina].[tb_empleados] Set EstadoExistencia = 'E' Where uid_codigo = @uid_codigo ;
	END
	ELSE
	BEGIN
	Delete  [db_nomina].[tb_empleados] Where uid_codigo = @uid_codigo ;
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
