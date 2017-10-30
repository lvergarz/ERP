USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_permisosroltrx_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_permisosroltrx_update](
@id_permiso VARCHAR(8),
@id_roltrx VARCHAR(8),
@id_login VARCHAR(8),
@fechacreacionpermisosroltrx DATE,
@fechamodificacionpermisosroltrx DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_permisosroltrx] set id_permiso=(Case When  @id_permiso IS NULL  then id_permiso else id_permiso end ),id_roltrx=(Case When  @id_roltrx IS NULL  then id_roltrx else id_roltrx end ),id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),fechacreacionpermisosroltrx=(Case When  @fechacreacionpermisosroltrx IS NULL  then fechacreacionpermisosroltrx else fechacreacionpermisosroltrx end ),fechamodificacionpermisosroltrx=(Case When  @fechamodificacionpermisosroltrx IS NULL  then fechamodificacionpermisosroltrx else fechamodificacionpermisosroltrx end )
Where (id_permiso= @id_permiso or @id_permiso = NULL) and
(id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(fechacreacionpermisosroltrx= @fechacreacionpermisosroltrx or @fechacreacionpermisosroltrx = NULL) and
(fechamodificacionpermisosroltrx= @fechamodificacionpermisosroltrx or @fechamodificacionpermisosroltrx = NULL)  
  END 

GO
