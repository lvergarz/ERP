USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_rol_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_rol_select](
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
Select id_rol,cod_rol,nombrerol,descripcionrol,fechacreacionrol,estado
From [db_seguridad].[tb_rol]
Where (id_rol= @id_rol or @id_rol = NULL) and
(cod_rol= @cod_rol or @cod_rol = NULL) and
(nombrerol= @nombrerol or @nombrerol = NULL) and
(descripcionrol= @descripcionrol or @descripcionrol = NULL) and
(fechacreacionrol= @fechacreacionrol or @fechacreacionrol = NULL) and
(estado= @estado or @estado = NULL)  
  END 

GO
