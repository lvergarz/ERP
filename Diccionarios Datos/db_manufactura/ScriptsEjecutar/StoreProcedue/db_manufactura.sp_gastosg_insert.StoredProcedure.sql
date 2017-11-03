USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_gastosg_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg_insert](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_gastosg] Where id_gastosg=@id_gastosg);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_gastosg](id_gastosg,descripciongastosg,estado) Values(@id_gastosg,
@descripciongastosg,
@estado);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
