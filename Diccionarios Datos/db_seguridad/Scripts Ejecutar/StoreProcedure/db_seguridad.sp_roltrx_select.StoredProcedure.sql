USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_roltrx_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx_select](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_roltrx,cod_rol,cod_trx,fechacreacionroltrx,fechamodificacion
From [db_seguridad].[tb_roltrx]
Where (id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(fechacreacionroltrx= @fechacreacionroltrx or @fechacreacionroltrx = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL)  
  END 


GO
