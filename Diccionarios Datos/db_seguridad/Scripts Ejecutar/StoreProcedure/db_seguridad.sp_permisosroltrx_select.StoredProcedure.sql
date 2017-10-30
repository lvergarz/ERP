USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_permisosroltrx_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_select](
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_permiso,id_roltrx,id_login,fechacreacionpermisosroltrx,fechamodificacionpermisosroltrx
From [db_seguridad].[tb_permisosroltrx]
Where (id_permiso= @id_permiso or @id_permiso = NULL) and
(id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(fechacreacionpermisosroltrx= @fechacreacionpermisosroltrx or @fechacreacionpermisosroltrx = NULL) and
(fechamodificacionpermisosroltrx= @fechamodificacionpermisosroltrx or @fechamodificacionpermisosroltrx = NULL)  
  END 

GO
