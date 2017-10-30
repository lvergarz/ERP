USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_traza].[sp_traza_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_traza].[sp_traza_update](
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
update [db_traza].[tb_traza] set id_traza=(Case When  @id_traza IS NULL  then id_traza else id_traza end ),id_trx=(Case When  @id_trx IS NULL  then id_trx else id_trx end ),id_login=(Case When  @id_login IS NULL  then id_login else id_login end ),accion=(Case When  @accion IS NULL  then accion else accion end ),log=(Case When  @log IS NULL  then log else log end ),fechalog=(Case When  @fechalog IS NULL  then fechalog else fechalog end )
Where (id_traza= @id_traza or @id_traza = NULL) and
(id_trx= @id_trx or @id_trx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(accion= @accion or @accion = NULL) and
(log= @log or @log = NULL) and
(fechalog= @fechalog or @fechalog = NULL)  
  END 

GO
