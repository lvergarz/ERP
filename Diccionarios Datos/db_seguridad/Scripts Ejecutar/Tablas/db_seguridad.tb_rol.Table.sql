USE [db_comsucre]
GO
/****** Object:  Table [db_seguridad].[tb_rol]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_seguridad].[tb_rol](
	[id_rol] [varchar](8) NOT NULL,
	[cod_rol] [varchar](20) NOT NULL,
	[nombrerol] [varchar](20) NOT NULL,
	[descripcionrol] [varchar](500) NOT NULL,
	[fechacreacionrol] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [db_seguridadtb_rol_PK] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
