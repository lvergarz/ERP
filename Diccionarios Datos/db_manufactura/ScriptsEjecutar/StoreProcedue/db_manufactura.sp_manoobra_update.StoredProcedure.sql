USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_manoobra_update]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra_update](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
update [db_manufactura].[tb_manoobra] set id_manoobra=(Case When  @id_manoobra IS NULL  then id_manoobra else id_manoobra end ),descripcionmanoobra=(Case When  @descripcionmanoobra IS NULL  then descripcionmanoobra else descripcionmanoobra end ),estado=(Case When  @estado IS NULL  then estado else estado end )
Where (id_manoobra= @id_manoobra or @id_manoobra = NULL) and
(descripcionmanoobra= @descripcionmanoobra or @descripcionmanoobra = NULL) and
(estado= @estado or @estado = NULL)  
  END 

GO
