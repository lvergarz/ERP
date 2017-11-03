USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_materiaprima_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima_select](
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
Select id_materia,cod_materia,descripcionmateria,unidad,fechacreacionmateria,fechamodificacionmateria
From [db_inventario].[tb_materiaprima]
Where (id_materia= @id_materia or @id_materia = NULL) and
(cod_materia= @cod_materia or @cod_materia = NULL) and
(descripcionmateria= @descripcionmateria or @descripcionmateria = NULL) and
(unidad= @unidad or @unidad = NULL) and
(fechacreacionmateria= @fechacreacionmateria or @fechacreacionmateria = NULL) and
(fechamodificacionmateria= @fechamodificacionmateria or @fechamodificacionmateria = NULL)  
  END 

GO
