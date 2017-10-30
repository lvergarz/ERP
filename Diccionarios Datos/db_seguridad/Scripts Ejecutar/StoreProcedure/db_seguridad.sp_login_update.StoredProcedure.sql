USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_login_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_login_update](
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
update [db_seguridad].[tb_login] set id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),usuario=(Case When  @usuario IS NULL  then usuario else usuario end ),clave=(Case When  @clave IS NULL  then clave else clave end ),fechacreacionlogin=(Case When  @fechacreacionlogin IS NULL  then fechacreacionlogin else fechacreacionlogin end ),fechamodificacion=(Case When  @fechamodificacion IS NULL  then fechamodificacion else fechamodificacion end ),fechaexpiracion=(Case When  @fechaexpiracion IS NULL  then fechaexpiracion else fechaexpiracion end ),estado=(Case When  @estado IS NULL  then estado else estado end ),expira=(Case When  @expira IS NULL  then expira else expira end )
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
