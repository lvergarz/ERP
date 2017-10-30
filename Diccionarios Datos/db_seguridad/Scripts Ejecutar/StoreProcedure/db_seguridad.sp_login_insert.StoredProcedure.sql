USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_login_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_login_insert](
@id_login INT,
@usuario VARCHAR(8),
@clave VARCHAR(20),
@fechacreacionlogin DATE,
@fechamodificacion DATE,
@fechaexpiracion DATE,
@estado BIT,
@expira BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_login] Where id_login=@id_login);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_login](id_login,usuario,clave,fechacreacionlogin,fechamodificacion,fechaexpiracion,estado,expira) Values(@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END


GO
