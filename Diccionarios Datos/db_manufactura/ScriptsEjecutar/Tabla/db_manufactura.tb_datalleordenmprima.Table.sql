USE [db_comsucre]
GO
/****** Object:  Table [db_manufactura].[tb_datalleordenmprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_manufactura].[tb_datalleordenmprima](
	[id_datelleorden] [int] NOT NULL,
	[id_cabecera] [int] NOT NULL,
	[cod_materiaprima] [varchar](10) NOT NULL,
	[cantidad] [float] NOT NULL,
	[costounit] [float] NOT NULL,
	[porcentaje] [float] NOT NULL,
	[costototal] [float] NOT NULL,
 CONSTRAINT [db_manufacturatb_datalleordenmprima_PK] PRIMARY KEY CLUSTERED 
(
	[id_datelleorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
