USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_trx]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_trx] (
@id_trx VARCHAR(8),
@cod_trx VARCHAR(20),
@nombre_trx VARCHAR(20),
@descripciontrx VARCHAR(500),
@fechadecreaciontrx DATE,
@estadotrx BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='01034' BEGIN  
EXEC [db_seguridad].[sp_trx_select] 
 @id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01035' BEGIN  
EXEC [db_seguridad].[sp_trx_insert] 
@id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='01036' BEGIN  
EXEC [db_seguridad].[sp_trx_update] 
@id_trx,
@cod_trx,
@nombre_trx,
@descripciontrx,
@fechadecreaciontrx,
@estadotrx
,@trx,
@resultado OUT;
  END 
END

GO
