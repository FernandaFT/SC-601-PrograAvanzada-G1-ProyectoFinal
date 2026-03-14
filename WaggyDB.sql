USE [master]
GO

CREATE DATABASE [WaggyDB]
GO
USE [WaggyDB]

GO
CREATE TABLE [dbo].[rol](
	[consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ROL] PRIMARY KEY CLUSTERED 
(
	[consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[usuario](
	[consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[identificacion] [varchar](20) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[correoElectronico] [varchar](150) NOT NULL,
	[contrasenna] [varchar](255) NOT NULL,
	[estado] [bit] NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[consecutivoRol] [int] NOT NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[rol] ON 
GO
INSERT [dbo].[rol] ([consecutivo], [descripcion]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[rol] ([consecutivo], [descripcion]) VALUES (2, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (1, N'116700557', N'Fernanda Fajardo', N'fer@waggy.com', N'ferwaggy', 1, N'88887777', N'San José, Costa Rica', 1)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (2, N'208990456', N'Juan Mora', N'juanm@gmial.com', N'123456', 1, N'88889999', N'Heredia, Costa Rica', 2)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (3, N'209880777', N'Elena Quesada', N'elena@gmail.com', N'123456', 0, N'88885678', N'Alajuela, Costa Rica', 2)

GO
/****** Object:  Index [UQ_CORREO]    Script Date: 14/3/2026 03:32:22 ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [UQ_CORREO] UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROL] FOREIGN KEY([consecutivoRol])
REFERENCES [dbo].[rol] ([consecutivo])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_USUARIO_ROL]

GO
CREATE   PROCEDURE [dbo].[sp_IniciarSesion]
    @Correo VARCHAR(150),
    @Password VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        u.consecutivo,
        u.identificacion,
        u.nombre,
        u.correoElectronico,
        r.descripcion AS rol
    FROM usuario u
    INNER JOIN rol r
        ON u.consecutivoRol = r.consecutivo
    WHERE u.correoElectronico = @Correo
      AND u.contrasenna = @Password
      AND u.estado = 1;
END
GO
USE [master]
GO
ALTER DATABASE [WaggyDB] SET  READ_WRITE 
GO
