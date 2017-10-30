USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_login_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_login_select](
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
Select id_login,usuario,clave,fechacreacionlogin,fechamodificacion,fechaexpiracion,estado,expira
From [db_seguridad].[tb_login]
Where (id_login= @id_login or @id_login = NULL) and
(usuario= @usuario or @usuario = NULL) and
(clave= @clave or @clave = NULL) and
(fechacreacionlogin= @fechacreacionlogin or @fechacreacionlogin = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL) and
(fechaexpiracion= @fechaexpiracion or @fechaexpiracion = NULL) and
(estado= @estado or @estado = NULL) and
(expira= @expira or @expira = NULL)  
  END 

GO
