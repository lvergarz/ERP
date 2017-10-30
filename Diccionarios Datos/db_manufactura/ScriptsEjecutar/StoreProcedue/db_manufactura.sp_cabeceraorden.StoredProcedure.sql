USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_cabeceraorden]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden] (
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
  IF @trx='04010' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_select] 
 @id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04011' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_insert] 
@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
ELSE  IF @trx='04012' BEGIN  
EXEC [db_manufactura].[sp_cabeceraorden_update] 
@id_cabecera,
@fechainiciocabecera,
@operador,
@fechafin,
@fechaempaque
,@trx,
@resultado OUT;
  END 
END

GO
