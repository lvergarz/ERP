USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datalleordenmprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima] (
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
  IF @trx='04013' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_select] 
 @id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04014' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_insert] 
@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04015' BEGIN  
EXEC [db_manufactura].[sp_datalleordenmprima_update] 
@id_datelleorden,
@id_cabecera,
@cod_materiaprima,
@cantidad,
@costounit,
@porcentaje,
@costototal
,@trx,
@resultado OUT;
  END 
END

GO
