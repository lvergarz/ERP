USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_kardex_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_kardex_select](
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
Select id_kardex,id_materia,ingreso,egreso,fechakardex,horakardex
From [db_inventario].[tb_kardex]
Where (id_kardex= @id_kardex or @id_kardex = NULL) and
(id_materia= @id_materia or @id_materia = NULL) and
(ingreso= @ingreso or @ingreso = NULL) and
(egreso= @egreso or @egreso = NULL) and
(fechakardex= @fechakardex or @fechakardex = NULL) and
(horakardex= @horakardex or @horakardex = NULL)  
  END 

GO
