USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_cabeceraorden_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_cabeceraorden_update](
@id_cabecera INT,
@fechainiciocabecera DATETIME,
@operador VARCHAR(200),
@fechafin DATETIME,
@fechaempaque DATE
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_cabeceraorden] set id_cabecera=(Case When  @id_cabecera IS NULL  then id_cabecera else id_cabecera end ),fechainiciocabecera=(Case When  @fechainiciocabecera IS NULL  then fechainiciocabecera else fechainiciocabecera end ),operador=(Case When  @operador IS NULL  then operador else operador end ),fechafin=(Case When  @fechafin IS NULL  then fechafin else fechafin end ),fechaempaque=(Case When  @fechaempaque IS NULL  then fechaempaque else fechaempaque end )
Where (id_cabecera= @id_cabecera or @id_cabecera = NULL) and
(fechainiciocabecera= @fechainiciocabecera or @fechainiciocabecera = NULL) and
(operador= @operador or @operador = NULL) and
(fechafin= @fechafin or @fechafin = NULL) and
(fechaempaque= @fechaempaque or @fechaempaque = NULL)  
  END 

GO
