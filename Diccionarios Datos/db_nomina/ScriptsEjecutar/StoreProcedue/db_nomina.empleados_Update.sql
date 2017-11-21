/***************************************************************************/
	--Nombre del Objeto:  [db_nomina].[sp_empleados_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empleados_Update')
	BEGIN
		DROP PROCEDURE [db_nomina].[sp_empleados_Update];
	END
GO

CREATE PROCEDURE [db_nomina].[sp_empleados_Update] 
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

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_nomina].[tb_empleados] Where uid_codigo = @uid_codigo );
	IF @CONT>0 BEGIN
    Update  [db_nomina].[tb_empleados]	
	 Set  uid_codigo=case when @uid_codigo IS NULL then uid_codigo else @uid_codigo end,
			
cod_empleado=case when @cod_empleado IS NULL then cod_empleado else @cod_empleado end,
			
nombres=case when @nombres IS NULL then nombres else @nombres end,
			
apellidos=case when @apellidos IS NULL then apellidos else @apellidos end,
			
nacionalidad=case when @nacionalidad IS NULL then nacionalidad else @nacionalidad end,
			
lnacimiento=case when @lnacimiento IS NULL then lnacimiento else @lnacimiento end,
			
fechanacimiento=case when @fechanacimiento IS NULL then fechanacimiento else @fechanacimiento end,
			
estadocivil=case when @estadocivil IS NULL then estadocivil else @estadocivil end,
			
edad=case when @edad IS NULL then edad else @edad end,
			
genero=case when @genero IS NULL then genero else @genero end,
			
celularcontacto=case when @celularcontacto IS NULL then celularcontacto else @celularcontacto end,
			
telefonocontacto=case when @telefonocontacto IS NULL then telefonocontacto else @telefonocontacto end,
			
emailcontacto=case when @emailcontacto IS NULL then emailcontacto else @emailcontacto end,
			
emailempresa=case when @emailempresa IS NULL then emailempresa else @emailempresa end,
			
tidentificacion=case when @tidentificacion IS NULL then tidentificacion else @tidentificacion end,
			
identificación=case when @identificación IS NULL then identificación else @identificación end,
			
nafiliacioniess=case when @nafiliacioniess IS NULL then nafiliacioniess else @nafiliacioniess end,
			
nlibretamilitar=case when @nlibretamilitar IS NULL then nlibretamilitar else @nlibretamilitar end,
			
observaciones=case when @observaciones IS NULL then observaciones else @observaciones end,
			
cod_marcacion=case when @cod_marcacion IS NULL then cod_marcacion else @cod_marcacion end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_codigo = @uid_codigo 

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