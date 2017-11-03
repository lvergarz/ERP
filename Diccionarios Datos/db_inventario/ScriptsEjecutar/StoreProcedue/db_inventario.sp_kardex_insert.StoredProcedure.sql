USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_kardex_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_kardex_insert](
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_inventario].[tb_kardex] Where id_kardex=@id_kardex);IF @CONT=0 BEGIN
Insert Into  [db_inventario].[tb_kardex](id_kardex,id_materia,ingreso,egreso,fechakardex,horakardex) Values(@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
