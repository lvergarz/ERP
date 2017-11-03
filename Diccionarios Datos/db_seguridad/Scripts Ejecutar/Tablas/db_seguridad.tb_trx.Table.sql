USE [db_comsucre]
GO
/****** Object:  Table [db_seguridad].[tb_trx]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_seguridad].[tb_trx](
	[id_trx] [varchar](8) NOT NULL,
	[cod_trx] [varchar](20) NOT NULL,
	[nombre_trx] [varchar](20) NOT NULL,
	[descripciontrx] [varchar](500) NOT NULL,
	[fechadecreaciontrx] [date] NOT NULL,
	[estadotrx] [bit] NOT NULL,
 CONSTRAINT [db_seguridadtb_trx_PK] PRIMARY KEY CLUSTERED 
(
	[id_trx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
