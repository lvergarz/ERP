USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_kardex_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_kardex_update](
@id_kardex INT,
@id_materia INT,
@ingreso FLOAT,
@egreso FLOAT,
@fechakardex DATE,
@horakardex TIME
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_inventario].[tb_kardex] set id_kardex=(Case When  @id_kardex IS NULL  then id_kardex else id_kardex end ),id_materia=(Case When  @id_materia IS NULL  then id_materia else id_materia end ),ingreso=(Case When  @ingreso IS NULL  then ingreso else ingreso end ),egreso=(Case When  @egreso IS NULL  then egreso else egreso end ),fechakardex=(Case When  @fechakardex IS NULL  then fechakardex else fechakardex end ),horakardex=(Case When  @horakardex IS NULL  then horakardex else horakardex end )
Where (id_kardex= @id_kardex or @id_kardex = NULL) and
(id_materia= @id_materia or @id_materia = NULL) and
(ingreso= @ingreso or @ingreso = NULL) and
(egreso= @egreso or @egreso = NULL) and
(fechakardex= @fechakardex or @fechakardex = NULL) and
(horakardex= @horakardex or @horakardex = NULL)  
  END 

GO
