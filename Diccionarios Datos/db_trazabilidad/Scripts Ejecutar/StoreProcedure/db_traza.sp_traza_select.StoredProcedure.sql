USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_traza].[sp_traza_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_traza].[sp_traza_select](
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
Select id_traza,id_trx,id_login,accion,log,fechalog
From [db_traza].[tb_traza]
Where (id_traza= @id_traza or @id_traza = NULL) and
(id_trx= @id_trx or @id_trx = NULL) and
(id_login= @id_login or @id_login = NULL) and
(accion= @accion or @accion = NULL) and
(log= @log or @log = NULL) and
(fechalog= @fechalog or @fechalog = NULL)  
  END 

GO
