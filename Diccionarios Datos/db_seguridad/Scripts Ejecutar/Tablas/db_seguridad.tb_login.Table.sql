USE [db_comsucre]
GO
/****** Object:  Table [db_seguridad].[tb_login]    Script Date: 29/10/2017 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [db_seguridad].[tb_login](
	[id_login] [int] NOT NULL,
	[usuario] [varchar](8) NOT NULL,
	[clave] [varchar](20) NOT NULL,
	[fechacreacionlogin] [date] NOT NULL,
	[fechamodificacion] [date] NOT NULL,
	[fechaexpiracion] [date] NOT NULL,
	[estado] [bit] NOT NULL,
	[expira] [bit] NOT NULL,
 CONSTRAINT [db_seguridadtb_login_PK] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
