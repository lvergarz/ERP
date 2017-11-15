/***************************************************************************/
	--Nombre del Objeto:  [db_empresa].[sp_empresa_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_empresa_Update')
	BEGIN
		DROP PROCEDURE [db_empresa].[sp_empresa_Update];
	END
GO

CREATE PROCEDURE [db_empresa].[sp_empresa_Update] 
   ( @uid_empresa VARCHAR(36),
	@ruc INT,
	@nombre FLOAT,
	@descripcion VARCHAR(500),
	@direccion VARCHAR(200),
	@telefono VARCHAR(100),
	@representantelegal VARCHAR(200),
	@estado ,
	@imagen VARCHAR(50),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_empresa].[tb_empresa] Where uid_empresa = @uid_empresa );
	IF @CONT>0 BEGIN
    Update  [db_empresa].[tb_empresa]	
	 Set  uid_empresa=case when @uid_empresa IS NULL then uid_empresa else @uid_empresa end,
			
ruc=case when @ruc IS NULL then ruc else @ruc end,
			
nombre=case when @nombre IS NULL then nombre else @nombre end,
			
descripcion=case when @descripcion IS NULL then descripcion else @descripcion end,
			
direccion=case when @direccion IS NULL then direccion else @direccion end,
			
telefono=case when @telefono IS NULL then telefono else @telefono end,
			
representantelegal=case when @representantelegal IS NULL then representantelegal else @representantelegal end,
			
estado=case when @estado IS NULL then estado else @estado end,
			
imagen=case when @imagen IS NULL then imagen else @imagen end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where uid_empresa = @uid_empresa 

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