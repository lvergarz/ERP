USE [db_comsucre]
GO
/****** Object:  Table [db_manufactura].[tb_gastosg]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_manufactura].[tb_gastosg](
	[id_gastosg] [int] NOT NULL,
	[descripciongastosg] [varchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [db_manufacturatb_gastosg_PK] PRIMARY KEY CLUSTERED 
(
	[id_gastosg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
