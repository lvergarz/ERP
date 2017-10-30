USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datallegfprima_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_select](
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
Select id_datelleordengf,id_cabecera,id_gatosf,horas,costo,porcentaje,total
From [db_manufactura].[datallegfprima]
Where (id_datelleordengf= @id_datelleordengf or @id_datelleordengf = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(id_gatosf= @id_gatosf or @id_gatosf = NULL) and
(horas= @horas or @horas = NULL) and
(costo= @costo or @costo = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(total= @total or @total = NULL)  
  END 

GO
