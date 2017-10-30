USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_rol_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_rol_update](
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_seguridad].[tb_rol] set id_rol=(Case When  @id_rol IS NULL  then id_rol else id_rol end ),cod_rol=(Case When  @cod_rol IS NULL  then cod_rol else cod_rol end ),nombrerol=(Case When  @nombrerol IS NULL  then nombrerol else nombrerol end ),descripcionrol=(Case When  @descripcionrol IS NULL  then descripcionrol else descripcionrol end ),fechacreacionrol=(Case When  @fechacreacionrol IS NULL  then fechacreacionrol else fechacreacionrol end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_rol= @id_rol or @id_rol = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(nombrerol= @nombrerol or @nombrerol = NULL) and
(descripcionrol= @descripcionrol or @descripcionrol = NULL) and
(fechacreacionrol= @fechacreacionrol or @fechacreacionrol = NULL) and
(estado= @estado or @estado = NULL)  
  END 


GO
