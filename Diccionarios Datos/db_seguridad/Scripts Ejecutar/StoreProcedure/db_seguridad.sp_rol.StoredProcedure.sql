USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_rol]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_rol] (
@id_rol VARCHAR(8),
@cod_rol VARCHAR(20),
@nombrerol VARCHAR(20),
@descripcionrol VARCHAR(500),
@fechacreacionrol DATE,
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01028' BEGIN  
EXEC [db_seguridad].[sp_rol_select] 
 @id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01029' BEGIN  
EXEC [db_seguridad].[sp_rol_insert] 
@id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01030' BEGIN  
EXEC [db_seguridad].[sp_rol_update] 
@id_rol,
@cod_rol,
@nombrerol,
@descripcionrol,
@fechacreacionrol,
@estado
,@trx,
@resultado OUT;
  END 
END

GO
