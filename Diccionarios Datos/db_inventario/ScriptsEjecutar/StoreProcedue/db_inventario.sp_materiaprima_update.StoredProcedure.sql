USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_materiaprima_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima_update](
@id_materia INT,
@cod_materia VARCHAR(10),
@descripcionmateria VARCHAR(100),
@unidad VARCHAR(5),
@fechacreacionmateria DATE,
@fechamodificacionmateria DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_inventario].[tb_materiaprima] set id_materia=(Case When  @id_materia IS NULL  then id_materia else id_materia end ),cod_materia=(Case When  @cod_materia IS NULL  then cod_materia else cod_materia end ),descripcionmateria=(Case When  @descripcionmateria IS NULL  then descripcionmateria else descripcionmateria end ),unidad=(Case When  @unidad IS NULL  then unidad else unidad end ),fechacreacionmateria=(Case When  @fechacreacionmateria IS NULL  then fechacreacionmateria else fechacreacionmateria end ),fechamodificacionmateria=(Case When  @fechamodificacionmateria IS NULL  then fechamodificacionmateria else fechamodificacionmateria end )
Where (id_materia= @id_materia or @id_materia = NULL) and
(cod_materia= @cod_materia or @cod_materia = NULL) and
(descripcionmateria= @descripcionmateria or @descripcionmateria = NULL) and
(unidad= @unidad or @unidad = NULL) and
(fechacreacionmateria= @fechacreacionmateria or @fechacreacionmateria = NULL) and
(fechamodificacionmateria= @fechamodificacionmateria or @fechamodificacionmateria = NULL)  
  END 

GO
