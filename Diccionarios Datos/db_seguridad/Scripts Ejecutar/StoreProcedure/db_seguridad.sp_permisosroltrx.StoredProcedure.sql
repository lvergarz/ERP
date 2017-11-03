USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_permisosroltrx]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx] (
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01025' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_select] 
 @id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01026' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_insert] 
@id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01027' BEGIN  
EXEC [db_seguridad].[sp_permisosroltrx_update] 
@id_permiso,
@id_roltrx,
@id_login,
@fechacreacionpermisosroltrx,
@fechamodificacionpermisosroltrx
,@trx,
@resultado OUT;
  END 
END

GO
