USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_roltrx]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_roltrx] (
@id_roltrx VARCHAR(8),
@cod_rol VARCHAR(20),
@cod_trx VARCHAR(20),
@fechacreacionroltrx DATE,
@fechamodificacion DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01031' BEGIN  
EXEC [db_seguridad].[sp_roltrx_select] 
 @id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01032' BEGIN  
EXEC [db_seguridad].[sp_roltrx_insert] 
@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01033' BEGIN  
EXEC [db_seguridad].[sp_roltrx_update] 
@id_roltrx,
@cod_rol,
@cod_trx,
@fechacreacionroltrx,
@fechamodificacion
,@trx,
@resultado OUT;
  END 
END

GO
