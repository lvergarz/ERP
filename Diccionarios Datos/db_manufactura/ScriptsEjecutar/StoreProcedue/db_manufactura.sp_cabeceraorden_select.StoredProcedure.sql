USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_cabeceraorden_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_select](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_cabecera,fechainiciocabecera,operador,fechafin,fechaempaque
From [db_manufactura].[tb_cabeceraorden]
Where (id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(fechainiciocabecera= @fechainiciocabecera or @fechainiciocabecera = NULL) and
(operador= @operador or @operador = NULL) and
(fechafin= @fechafin or @fechafin = NULL) and
(fechaempaque= @fechaempaque or @fechaempaque = NULL)  
  END 


GO
