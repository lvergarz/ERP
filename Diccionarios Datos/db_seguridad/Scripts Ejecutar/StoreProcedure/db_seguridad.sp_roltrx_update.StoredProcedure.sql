USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_roltrx_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx_update](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_roltrx] set id_roltrx=(Case When  @id_roltrx IS NULL  then id_roltrx else id_roltrx end ),cod_rol=(Case When  @cod_rol IS NULL  then cod_rol else cod_rol end ),cod_trx=(Case When  @cod_trx IS NULL  then cod_trx else cod_trx end ),fechacreacionroltrx=(Case When  @fechacreacionroltrx IS NULL  then fechacreacionroltrx else fechacreacionroltrx end ),fechamodificacion=(Case When  @fechamodificacion IS NULL  then fechamodificacion else fechamodificacion end )
Where (id_roltrx= @id_roltrx or @id_roltrx = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(fechacreacionroltrx= @fechacreacionroltrx or @fechacreacionroltrx = NULL) and
(fechamodificacion= @fechamodificacion or @fechamodificacion = NULL)  
  END 


GO
