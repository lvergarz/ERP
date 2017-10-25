USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_login]    Script Date: 25/10/2017 11:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<DSYS,Luis Vergara>
-- Create date: <25/Oct/2017>
-- Description:	<Objeto para el manejo de la tabla de login, esquema db_seguridad>
-- =============================================
CREATE PROCEDURE [db_seguridad].[sp_login] 
	-- Definicion de parametros
	@Usuario             varchar(8)null,
    @Clave               varchar(22) null,
    @FechaCreacionLogin  date null,
    @FechaModificacion   date null,
    @FechaExpiracion     date null,
    @Estado              bit null,
    @Expira              bit null,
	@trx                 varchar(5) null,
	@resultado           varchar(20) out

AS
BEGIN
	SET NOCOUNT ON;

if @trx='01001'
	BEGIN
	set @FechaCreacionLogin=GETDATE()
	set @FechaModificacion=GETDATE()
	set @FechaExpiracion=GETDATE()
	   INSERT INTO [db_seguridad].[tb_login]
			   ([Usuario]
			   ,[Clave]
			   ,[FechaCreacionLogin]
			   ,[FechaModificacion]
			   ,[FechaExpiracion]
			   ,[Estado]
			   ,[Expira])
		 VALUES
			   (@Usuario
			   ,@Clave
			   ,@FechaCreacionLogin
			   ,@FechaModificacion
			   ,@FechaExpiracion
			   ,@Estado
			   ,@Expira)
			   set @resultado=1
	     
	END
	
END
return @resultado

GO
