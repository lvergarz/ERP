USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datallegfprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima] (
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
  IF @trx='04007' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_select] 
 @id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04008' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_insert] 
@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04009' BEGIN  
EXEC [db_manufactura].[sp_datallegfprima_update] 
@id_datelleordengf,
@id_cabecera,
@id_gatosf,
@horas,
@costo,
@porcentaje,
@total
,@trx,
@resultado OUT;
  END 
END

GO
