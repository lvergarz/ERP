USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_trx_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_trx_select](
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
Select id_trx,cod_trx,nombre_trx,descripciontrx,fechadecreaciontrx,estadotrx
From [db_seguridad].[tb_trx]
Where (id_trx= @id_trx or @id_trx = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(nombre_trx= @nombre_trx or @nombre_trx = NULL) and
(descripciontrx= @descripciontrx or @descripciontrx = NULL) and
(fechadecreaciontrx= @fechadecreaciontrx or @fechadecreaciontrx = NULL) and
(estadotrx= @estadotrx or @estadotrx = NULL)  
  END 

GO
