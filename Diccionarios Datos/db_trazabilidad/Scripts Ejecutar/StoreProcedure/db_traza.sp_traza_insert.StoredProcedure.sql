USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_traza].[sp_traza_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_traza].[sp_traza_insert](
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_traza].[tb_traza] Where id_traza=@id_traza);IF @CONT=0 BEGIN
Insert Into  [db_traza].[tb_traza](id_traza,id_trx,id_login,accion,log,fechalog) Values(@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
