USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_datalleordenmprima_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_datalleordenmprima_update](
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
update [db_manufactura].[tb_datalleordenmprima] set id_datelleorden=(Case When  @id_datelleorden IS NULL  then id_datelleorden else id_datelleorden end ),id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),cod_materiaprima=(Case When  @cod_materiaprima IS NULL  then cod_materiaprima else cod_materiaprima end ),cantidad=(Case When  @cantidad IS NULL  then cantidad else cantidad end ),costounit=(Case When  @costounit IS NULL  then costounit else costounit end ),porcentaje=(Case When  @porcentaje IS NULL  then porcentaje else porcentaje end ),costototal=(Case When  @costototal IS NULL  then costototal else costototal end )
Where (id_datelleorden= @id_datelleorden or @id_datelleorden = NULL) and
(id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(cod_materiaprima= @cod_materiaprima or @cod_materiaprima = NULL) and
(cantidad= @cantidad or @cantidad = NULL) and
(costounit= @costounit or @costounit = NULL) and
(porcentaje= @porcentaje or @porcentaje = NULL) and
(costototal= @costototal or @costototal = NULL)  
  END 

GO
