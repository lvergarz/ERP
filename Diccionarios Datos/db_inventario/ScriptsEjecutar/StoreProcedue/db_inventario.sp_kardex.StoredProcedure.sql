USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_inventario].[sp_kardex]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_inventario].[sp_kardex] (
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
  IF @trx='03001' BEGIN  
EXEC [db_inventario].[sp_kardex_select] 
 @id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03002' BEGIN  
EXEC [db_inventario].[sp_kardex_insert] 
@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='03003' BEGIN  
EXEC [db_inventario].[sp_kardex_update] 
@id_kardex,
@id_materia,
@ingreso,
@egreso,
@fechakardex,
@horakardex
,@trx,
@resultado OUT;
  END 
END

GO
