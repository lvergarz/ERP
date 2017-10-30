USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_materiaprima_insert]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_materiaprima_insert](
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
DECLARE @CONT INT SET @CONT=(Select count(*) From [db_inventario].[tb_materiaprima] Where id_materia=@id_materia);IF @CONT=0 BEGIN
Insert Into  [db_inventario].[tb_materiaprima](id_materia,cod_materia,descripcionmateria,unidad,fechacreacionmateria,fechamodificacionmateria) Values(@id_materia,
@cod_materia,
@descripcionmateria,
@unidad,
@fechacreacionmateria,
@fechamodificacionmateria);
  END ELSE BEGIN   set @resultado='Ya existe un registro en el Sistema!';    END END

GO
