USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datallegfprima_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datallegfprima_update](
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
update [db_manufactura].[datallegfprima] set id_datelleordengf=(Case When  @id_datelleordengf IS NULL  then id_datelleordengf else id_datelleordengf end ),id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),id_gatosf=(Case When  @id_gatosf IS NULL  then id_gatosf else id_gatosf end ),horas=(Case When  @horas IS NULL  then horas else horas end ),costo=(Case When  @costo IS NULL  then costo else costo end ),porcentaje=(Case When  @porcentaje IS NULL  then porcentaje else porcentaje end ),total=(Case When  @total IS NULL  then total else total end )
Where (id_datelleordengf= @id_datelleordengf or @id_datelleordengf = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(id_gatosf= @id_gatosf or @id_gatosf = NULL) and
(horas= @horas or @horas = NULL) and
(costo= @costo or @costo = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(total= @total or @total = NULL)  
  END 

GO
