USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_login]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_login] (
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
  IF @trx='01022' BEGIN  
EXEC [db_seguridad].[sp_login_select] 
 @id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01023' BEGIN  
EXEC [db_seguridad].[sp_login_insert] 
@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01024' BEGIN  
EXEC [db_seguridad].[sp_login_update] 
@id_login,
@usuario,
@clave,
@fechacreacionlogin,
@fechamodificacion,
@fechaexpiracion,
@estado,
@expira
,@trx,
@resultado OUT;
  END 
END

GO
