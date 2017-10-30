USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_gastosg_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_gastosg_update](
@id_gastosg INT,
@descripciongastosg VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_gastosg] set id_gastosg=(Case When  @id_gastosg IS NULL  then id_gastosg else id_gastosg end ),descripciongastosg=(Case When  @descripciongastosg IS NULL  then descripciongastosg else descripciongastosg end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_gastosg= @id_gastosg or @id_gastosg = NULL) and
(descripciongastosg= @descripciongastosg or @descripciongastosg = NULL) and
(estado= @estado or @estado = NULL)  
  END 

GO
