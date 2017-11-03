USE [db_comsucre]
GO
/****** Object:  Table [db_inventario].[tb_materiaprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_inventario].[tb_materiaprima](
	[id_materia] [int] NOT NULL,
	[cod_materia] [varchar](10) NOT NULL,
	[descripcionmateria] [varchar](100) NOT NULL,
	[unidad] [varchar](5) NOT NULL,
	[fechacreacionmateria] [date] NOT NULL,
	[fechamodificacionmateria] [date] NOT NULL,
 CONSTRAINT [db_inventariotb_materiaprima_PK] PRIMARY KEY CLUSTERED 
(
	[id_materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
