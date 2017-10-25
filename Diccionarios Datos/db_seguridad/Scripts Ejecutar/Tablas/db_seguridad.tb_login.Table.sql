USE [db_comsucre]
GO
/****** Object:  Table [db_seguridad].[tb_login]    Script Date: 25/10/2017 11:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_seguridad].[tb_login](
	[Id_login] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](8) NULL,
	[Clave] [varchar](22) NULL,
	[FechaCreacionLogin] [date] NULL,
	[FechaModificacion] [date] NULL,
	[FechaExpiracion] [date] NULL,
	[Estado] [bit] NULL,
	[Expira] [bit] NULL,
 CONSTRAINT [PK_tb_login] PRIMARY KEY CLUSTERED 
(
	[Id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
