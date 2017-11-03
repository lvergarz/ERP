USE [db_comsucre]
GO
/****** Object:  Table [db_seguridad].[tb_roltrx]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_seguridad].[tb_roltrx](
	[id_roltrx] [varchar](8) NOT NULL,
	[cod_rol] [varchar](20) NOT NULL,
	[cod_trx] [varchar](20) NOT NULL,
	[fechacreacionroltrx] [date] NOT NULL,
	[fechamodificacion] [date] NOT NULL,
 CONSTRAINT [db_seguridadtb_roltrx_PK] PRIMARY KEY CLUSTERED 
(
	[id_roltrx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
