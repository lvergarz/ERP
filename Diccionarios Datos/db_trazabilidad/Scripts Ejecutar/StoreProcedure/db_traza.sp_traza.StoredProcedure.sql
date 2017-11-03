USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_traza].[sp_traza]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_traza].[sp_traza] (
@id_traza INT,
@id_trx INT,
@id_login INT,
@accion VARCHAR(20),
@log DATE,
@fechalog DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='02037' BEGIN  
EXEC [db_traza].[sp_traza_select] 
 @id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='02038' BEGIN  
EXEC [db_traza].[sp_traza_insert] 
@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='02039' BEGIN  
EXEC [db_traza].[sp_traza_update] 
@id_traza,
@id_trx,
@id_login,
@accion,
@log,
@fechalog
,@trx,
@resultado OUT;
  END 
END


GO
