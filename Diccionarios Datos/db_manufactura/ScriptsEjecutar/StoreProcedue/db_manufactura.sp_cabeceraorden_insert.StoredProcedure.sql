USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_cabeceraorden_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_insert](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_cabeceraorden] Where id_cabecera=@id_cabecera);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_cabeceraorden](id_cabecera,fechainiciocabecera,operador,fechafin,fechaempaque) Values(@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
