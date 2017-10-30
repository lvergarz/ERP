USE [db_comsucre]
GO
/****** Object:  Table [db_inventario].[tb_kardex]    Script Date: 29/10/2017 20:09:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_inventario].[tb_kardex](
	[id_kardex] [int] NOT NULL,
	[id_materia] [int] NOT NULL,
	[ingreso] [float] NOT NULL,
	[egreso] [float] NOT NULL,
	[fechakardex] [date] NOT NULL,
	[horakardex] [time](7) NOT NULL,
 CONSTRAINT [db_inventariotb_kardex_PK] PRIMARY KEY CLUSTERED 
(
	[id_kardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
