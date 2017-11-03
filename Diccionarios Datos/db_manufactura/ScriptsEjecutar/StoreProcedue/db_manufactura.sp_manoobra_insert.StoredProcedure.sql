USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_manoobra_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra_insert](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_manoobra] Where id_manoobra=@id_manoobra);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_manoobra](id_manoobra,descripcionmanoobra,estado) Values(@id_manoobra,
@descripcionmanoobra,
@estado);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
