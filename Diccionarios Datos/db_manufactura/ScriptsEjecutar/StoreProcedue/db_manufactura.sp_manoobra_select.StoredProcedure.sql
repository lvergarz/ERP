USE [db_comsucre]
GO
/****** Object:  StoredProcedure [db_manufactura].[sp_manoobra_select]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [db_manufactura].[sp_manoobra_select](
@id_manoobra INT,
@descripcionmanoobra VARCHAR(100),
@estado BIT
,@trx VARCHAR(5) null,
@resultado VARCHAR(20) OUT)
as
BEGIN
Select id_manoobra,descripcionmanoobra,estado
From [db_manufactura].[tb_manoobra]
Where (id_manoobra= @id_manoobra or @id_manoobra = NULL) and
(descripcionmanoobra= @descripcionmanoobra or @descripcionmanoobra = NULL) and
(estado= @estado or @estado = NULL)  
  END 

GO
