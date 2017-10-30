USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_manoobra]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra] (
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04019' BEGIN  
EXEC [db_manufactura].[sp_manoobra_select] 
 @id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04020' BEGIN  
EXEC [db_manufactura].[sp_manoobra_insert] 
@id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04021' BEGIN  
EXEC [db_manufactura].[sp_manoobra_update] 
@id_manoobra,
@descripcionmanoobra,
@estado
,@trx,
@resultado OUT;
  END 
END

GO
