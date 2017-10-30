USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_gastosg_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg_select](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_gastosg,descripciongastosg,estado
From [db_manufactura].[tb_gastosg]
Where (id_gastosg= @id_gastosg or @id_gastosg = NULL) and
(descripciongastosg= @descripciongastosg or @descripciongastosg = NULL) and
(estado= @estado or @estado = NULL)  
  END 

GO
