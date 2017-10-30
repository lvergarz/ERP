USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_materiaprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima] (
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
  IF @trx='03004' BEGIN  
EXEC [db_inventario].[sp_materiaprima_select] 
 @id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03005' BEGIN  
EXEC [db_inventario].[sp_materiaprima_insert] 
@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03006' BEGIN  
EXEC [db_inventario].[sp_materiaprima_update] 
@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria
,@trx,
@resultado OUT;
  END 
END

GO
