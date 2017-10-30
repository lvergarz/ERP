USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datallegfprima_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_insert](
@id_datelleordengf INT,
@id_cabecera INT,
@id_gatosf INT,
@horas INT,
@costo FLOAT,
@porcentaje FLOAT,
@total FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[datallegfprima] Where id_datelleordengf=@id_datelleordengf);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[datallegfprima](id_datelleordengf,id_cabecera,id_gatosf,horas,costo,porcentaje,total) Values(@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
