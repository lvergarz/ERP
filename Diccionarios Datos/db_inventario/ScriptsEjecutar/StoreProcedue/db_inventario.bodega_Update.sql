/***************************************************************************/
	--Nombre del Objeto:  [db_inventario].[sp_bodega_Update]                                      
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

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_bodega_Update')
	BEGIN
		DROP PROCEDURE [db_inventario].[sp_bodega_Update];
	END
GO

CREATE PROCEDURE [db_inventario].[sp_bodega_Update] 
   ( @uid_bodega VARCHAR(36),
	@cod_bodega VARCHAR(10),
	@descripcionbodega VARCHAR(100),
	@capacidad VARCHAR(5),
	@fechacreacionbodega DATE,
	@direccionbodega VARCHAR(200),
	@cod_empresa VARCHAR(36),
	@estadoexistencia VARCHAR(1),
	@trx VARCHAR(5) null,
	@resultado VARCHAR(20) OUT
	)
as
BEGIN

	BEGIN TRANSACTION transaccionSql
	BEGIN TRY
    
	DECLARE @CONT INT SET @CONT=(Select count(1) From [db_inventario].[tb_bodega] Where );
	IF @CONT>0 BEGIN
    Update  [db_inventario].[tb_bodega]	
	 Set  uid_bodega=case when @uid_bodega IS NULL then uid_bodega else @uid_bodega end,
			
cod_bodega=case when @cod_bodega IS NULL then cod_bodega else @cod_bodega end,
			
descripcionbodega=case when @descripcionbodega IS NULL then descripcionbodega else @descripcionbodega end,
			
capacidad=case when @capacidad IS NULL then capacidad else @capacidad end,
			
fechacreacionbodega=case when @fechacreacionbodega IS NULL then fechacreacionbodega else @fechacreacionbodega end,
			
direccionbodega=case when @direccionbodega IS NULL then direccionbodega else @direccionbodega end,
			
cod_empresa=case when @cod_empresa IS NULL then cod_empresa else @cod_empresa end,
			
estadoexistencia=case when @estadoexistencia IS NULL then estadoexistencia else @estadoexistencia end
	 Where 

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