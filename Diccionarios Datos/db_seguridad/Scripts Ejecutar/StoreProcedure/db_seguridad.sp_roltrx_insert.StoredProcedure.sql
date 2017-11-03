USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_roltrx_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx_insert](
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_seguridad].[tb_roltrx] Where id_roltrx=@id_roltrx);IF @CONT=0 BEGIN
Insert Into  [db_seguridad].[tb_roltrx](id_roltrx,cod_rol,cod_trx,fechacreacionroltrx,fechamodificacion) Values(@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
