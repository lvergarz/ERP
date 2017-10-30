USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datalleordenmprima_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_insert](
@id_datelleorden INT,
@id_cabecera INT,
@cod_materiaprima VARCHAR(10),
@cantidad FLOAT,
@costounit FLOAT,
@porcentaje FLOAT,
@costototal FLOAT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_manufactura].[tb_datalleordenmprima] Where id_datelleorden=@id_datelleorden);IF @CONT=0 BEGIN
Insert Into  [db_manufactura].[tb_datalleordenmprima](id_datelleorden,id_cabecera,cod_materiaprima,cantidad,costounit,porcentaje,costototal) Values(@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
