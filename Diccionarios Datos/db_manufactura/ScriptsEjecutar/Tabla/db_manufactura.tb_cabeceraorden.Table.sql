USE [db_comsucre]
GO
/****** Object:  Table [db_manufactura].[tb_cabeceraorden]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_manufactura].[tb_cabeceraorden](
	[id_cabecera] [int] NOT NULL,
	[fechainiciocabecera] [datetime] NOT NULL,
	[operador] [varchar](200) NOT NULL,
	[fechafin] [datetime] NOT NULL,
	[fechaempaque] [date] NOT NULL,
 CONSTRAINT [db_manufacturatb_cabeceraorden_PK] PRIMARY KEY CLUSTERED 
(
	[id_cabecera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
