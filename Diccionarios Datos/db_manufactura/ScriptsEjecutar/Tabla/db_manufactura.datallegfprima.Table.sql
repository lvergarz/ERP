USE [db_comsucre]
GO
/****** Object:  Table [db_manufactura].[datallegfprima]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_manufactura].[datallegfprima](
	[id_datelleordengf] [int] NOT NULL,
	[id_cabecera] [int] NOT NULL,
	[id_gatosf] [int] NOT NULL,
	[horas] [int] NOT NULL,
	[costo] [float] NOT NULL,
	[porcentaje] [float] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [db_manufacturadatallegfprima_PK] PRIMARY KEY CLUSTERED 
(
	[id_datelleordengf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
