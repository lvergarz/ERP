USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datalleordenmprima_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_select](
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
Select id_datelleorden,id_cabecera,cod_materiaprima,cantidad,costounit,porcentaje,costototal
From [db_manufactura].[tb_datalleordenmprima]
Where (id_datelleorden= @id_datelleorden or @id_datelleorden = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(cod_materiaprima= @cod_materiaprima or @cod_materiaprima = NULL) and
(cantidad= @cantidad or @cantidad = NULL) and
(costounit= @costounit or @costounit = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(costototal= @costototal or @costototal = NULL)  
  END 

GO
