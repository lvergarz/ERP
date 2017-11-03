USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_seguridad].[sp_trx_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_seguridad].[sp_trx_update](
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
update [db_seguridad].[tb_trx] set id_trx=(Case When  @id_trx IS NULL  then id_trx else id_trx end ),cod_trx=(Case When  @cod_trx IS NULL  then cod_trx else cod_trx end ),nombre_trx=(Case When  @nombre_trx IS NULL  then nombre_trx else nombre_trx end ),descripciontrx=(Case When  @descripciontrx IS NULL  then descripciontrx else descripciontrx end ),fechadecreaciontrx=(Case When  @fechadecreaciontrx IS NULL  then fechadecreaciontrx else fechadecreaciontrx end ),estadotrx=(Case When  @estadotrx IS NULL  then estadotrx else estadotrx end )
Where (id_trx= @id_trx or @id_trx = NULL) and
(cod_trx= @cod_trx or @cod_trx = NULL) and
(nombre_trx= @nombre_trx or @nombre_trx = NULL) and
(descripciontrx= @descripciontrx or @descripciontrx = NULL) and
(fechadecreaciontrx= @fechadecreaciontrx or @fechadecreaciontrx = NULL) and
(estadotrx= @estadotrx or @estadotrx = NULL)  
  END 


GO
