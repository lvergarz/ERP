USE [db_comsucre]
GO
/****** Object:  Table [db_traza].[tb_traza]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_traza].[tb_traza](
	[id_traza] [int] NOT NULL,
	[id_trx] [int] NOT NULL,
	[id_login] [int] NOT NULL,
	[accion] [varchar](20) NOT NULL,
	[log] [date] NOT NULL,
	[fechalog] [date] NOT NULL,
 CONSTRAINT [db_trazatb_traza_PK] PRIMARY KEY CLUSTERED 
(
	[id_traza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
