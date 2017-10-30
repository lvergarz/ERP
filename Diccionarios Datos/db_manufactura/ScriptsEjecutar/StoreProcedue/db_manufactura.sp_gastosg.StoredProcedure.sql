USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_gastosg]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg] (
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04016' BEGIN  
EXEC [db_manufactura].[sp_gastosg_select] 
 @id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04017' BEGIN  
EXEC [db_manufactura].[sp_gastosg_insert] 
@id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04018' BEGIN  
EXEC [db_manufactura].[sp_gastosg_update] 
@id_gastosg,
@descripciongastosg,
@estado
,@trx,
@resultado OUT;
  END 
END

GO
