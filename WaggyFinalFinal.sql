USE [master]
GO
/****** Object:  Database [WaggyDB]    Script Date: 22/3/2026 12:47:38 ******/
CREATE DATABASE [WaggyDB]
GO
USE [WaggyDB]
GO
/****** Object:  Table [dbo].[carrito_det]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrito_det](
	[cons_carrito_det] [int] IDENTITY(1,1) NOT NULL,
	[cons_carrito] [int] NOT NULL,
	[cons_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_carrito_det] PRIMARY KEY CLUSTERED 
(
	[cons_carrito_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carrito_enc]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrito_enc](
	[cons_carrito] [int] IDENTITY(1,1) NOT NULL,
	[consecutivo] [int] NOT NULL,
	[fec_registro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_carrito_enc] PRIMARY KEY CLUSTERED 
(
	[cons_carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[cons_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre_categoria] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[cons_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_det]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_det](
	[cons_inventario_det] [int] IDENTITY(1,1) NOT NULL,
	[consec_producto] [int] NOT NULL,
	[cons_inventario] [int] NOT NULL,
	[cantidad_inventario] [int] NOT NULL,
 CONSTRAINT [pk_inventario_det] PRIMARY KEY CLUSTERED 
(
	[cons_inventario_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario_enc]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario_enc](
	[cons_inventario] [int] IDENTITY(1,1) NOT NULL,
	[fec_inventario] [date] NOT NULL,
	[observaciones] [varchar](150) NULL,
	[estado_inv] [varchar](1) NOT NULL,
 CONSTRAINT [pk_inventario_enc] PRIMARY KEY CLUSTERED 
(
	[cons_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[cons_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
	[descripcion_producto] [varchar](150) NOT NULL,
	[imagen] [varchar](300) NOT NULL,
	[precio] [decimal](10, 2) NULL,
	[unidad_medida] [varchar](1) NOT NULL,
	[existencia] [int] NOT NULL,
	[existenciamin] [int] NOT NULL,
	[existenciamax] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[registro_prod] [date] NOT NULL,
	[cons_categoria] [int] NOT NULL,
	[tipo_mascota] [varchar](10) NULL,
 CONSTRAINT [pk_productos] PRIMARY KEY CLUSTERED 
(
	[cons_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[usuario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ventas_clientes_det]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_clientes_det](
	[cons_venta_det] [int] IDENTITY(1,1) NOT NULL,
	[cons_venta] [int] NOT NULL,
	[cons_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[monto_linea] [decimal](15, 2) NOT NULL,
	[impuesto_linea] [decimal](15, 2) NOT NULL,
	[monto_neto_linea] [decimal](15, 2) NOT NULL,
 CONSTRAINT [pk_ventas_clientes_det] PRIMARY KEY CLUSTERED 
(
	[cons_venta_det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas_clientes_enc]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_clientes_enc](
	[cons_venta] [int] IDENTITY(1,1) NOT NULL,
	[consecutivo] [int] NOT NULL,
	[fec_venta] [date] NOT NULL,
	[monto_venta_brut] [decimal](17, 2) NOT NULL,
	[impuesto_venta_tot] [decimal](17, 2) NOT NULL,
	[monto_venta_net] [decimal](17, 2) NOT NULL,
 CONSTRAINT [pk_ventas_clientes_enc] PRIMARY KEY CLUSTERED 
(
	[cons_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[carrito_enc] ON 
GO
INSERT [dbo].[carrito_enc] ([cons_carrito], [consecutivo], [fec_registro], [estado]) VALUES (1, 1, CAST(N'2026-03-22T12:38:54.480' AS DateTime), 0)
GO
INSERT [dbo].[carrito_enc] ([cons_carrito], [consecutivo], [fec_registro], [estado]) VALUES (2, 7, CAST(N'2026-03-22T12:45:32.423' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[carrito_enc] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 
GO
INSERT [dbo].[categoria] ([cons_categoria], [nombre_categoria], [estado]) VALUES (1, N'Alimentos', 1)
GO
INSERT [dbo].[categoria] ([cons_categoria], [nombre_categoria], [estado]) VALUES (2, N'Ropa', 1)
GO
INSERT [dbo].[categoria] ([cons_categoria], [nombre_categoria], [estado]) VALUES (3, N'Accesorios', 1)
GO
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[inventario_det] ON 
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (91, 18, 15, 13)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (92, 2, 15, 18)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (93, 10, 15, 20)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (94, 11, 15, 21)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (95, 12, 15, 10)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (96, 9, 15, 3)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (97, 7, 15, 5)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (98, 17, 15, 4)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (99, 14, 15, 16)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (100, 13, 15, 7)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (101, 5, 15, 5)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (102, 4, 15, 7)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (103, 1, 15, 20)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (104, 6, 15, 15)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (105, 15, 15, 3)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (106, 3, 15, 6)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (107, 16, 15, 20)
GO
INSERT [dbo].[inventario_det] ([cons_inventario_det], [consec_producto], [cons_inventario], [cantidad_inventario]) VALUES (108, 8, 15, 4)
GO
SET IDENTITY_INSERT [dbo].[inventario_det] OFF
GO
SET IDENTITY_INSERT [dbo].[inventario_enc] ON 
GO
INSERT [dbo].[inventario_enc] ([cons_inventario], [fec_inventario], [observaciones], [estado_inv]) VALUES (15, CAST(N'2026-03-31' AS Date), N'Inventario Marzo', N'a')
GO
SET IDENTITY_INSERT [dbo].[inventario_enc] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (1, N'ONC Care Alimento Húmedo para Perros', N'Hill''s Prescription Diet, Nutrición clínica diseñada para nutrir y ayudar a los perros diagnosticados con cáncer.
', N'https://pxmshare.colgatepalmolive.com/JPEG_1500/DJOqjfjItfTWLNfHgYwLG.jpg', CAST(3600.00 AS Decimal(10, 2)), N'u', 20, 5, 50, 1, CAST(N'2026-03-17' AS Date), 1, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (2, N'a/d Alimento Húmedo con Pollo para Gatos', N'Apoyo nutricional que fomenta la alimentación de las mascotas que se recuperan de una cirugía, enfermedad o lesión', N'https://pxmshare.colgatepalmolive.com/JPEG_1500/gMUpelM8a9RavqimuXR4x.jpg', CAST(3500.00 AS Decimal(10, 2)), N'u', 18, 5, 50, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (3, N'Suéter flores de bluey', N'Dale a tu mascota comodidad y estilo con este Suéter flores de bluey para perros inspirado en los divertidos personajes de Bluey. Confeccionado en tel', N'https://mascotasgo.com/wp-content/uploads/2025/08/Plantilla-productos-web-700x800-F.pptx-10-1.jpg', CAST(7600.00 AS Decimal(10, 2)), N'u', 6, 2, 20, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (4, N'Kit Pechera y Correa Ajustable', N'Una de las mejores formas de disfrutar con tu peludo es a través de paseos al aire libre. Para ello, es fundamental contar con una pechera para gatos.', N'https://mascotasgo.com/wp-content/uploads/2022/02/pechera-gato.jpg', CAST(4250.00 AS Decimal(10, 2)), N'u', 7, 2, 15, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (5, N'Cosplay de Abeja', N'Conjunto de Otoño e Invierno para Gatos - Sudadera de Cosplay de Abeja para Razas Pequeñas', N'https://img.kwcdn.com/product/fancy/296da145-36dd-41ad-a1af-f219d9d2db60.jpg?imageView2/2/w/800/q/70/format/avif', CAST(2500.00 AS Decimal(10, 2)), N'u', 4, 2, 15, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (6, N'PURINA® PRO PLAN® ADULTO RAZA MEDIANA', N'Provee nutrición de avanzada que ayuda a los perros de razas medianas a mantenerse fuertes y llenos de vitalidad.

Esta fórmula ofrece, a través de ', N'https://purina.co.cr/sites/default/files/styles/webp/public/2022-10/razas-medianas-1-proplan.png.webp?itok=qBjyvUMv', CAST(37000.00 AS Decimal(10, 2)), N'k', 15, 4, 30, 1, CAST(N'2026-03-17' AS Date), 1, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (7, N'Cama Darth Vader', N'Esta cama para mascota inspirada en STAR WARS© es especial para los amantes de la saga galáctica mide 50 cm de largo por 35 de ancho es ideal para gat', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/875499_1.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(10500.00 AS Decimal(10, 2)), N'u', 5, 2, 15, 1, CAST(N'2026-03-17' AS Date), 3, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (8, N'Transportadora Zoonee Eco 5', N'La transportadora ZOONEE es perfecta para transportar mascotas mide 60 cm ancho x 61.5 cm alto x 81 cm fondo. Con su diseño cómodo y seguro, tu mascot', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/889468.jpg?version=17/03/2026', CAST(114000.00 AS Decimal(10, 2)), N'u', 4, 2, 17, 1, CAST(N'2026-03-17' AS Date), 3, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (9, N'Bebedero Automático 108 Oz Para Gato Petmate', N'El bebedero automático de 108 oz para gato Petmate es la solución perfecta para mantener a tu gato hidratado. Este bebedero cuenta con un diseño innov', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/889741.jpg?version=17/03/2026', CAST(39000.00 AS Decimal(10, 2)), N'u', 3, 2, 20, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (10, N'Alimento Gato Humedo Adulto Salmon Esterilizados P', N'El alimento húmedo para gatos adultos esterilizados de Purina One con sabor a salmón es una opción deliciosa y nutritiva para tu mascota. Este aliment', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/876994.jpg?version=17/03/2026', CAST(775.00 AS Decimal(10, 2)), N'g', 20, 2, 40, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (11, N'Alimento Gato Seco Adulto Pescado Purina Cat Chow', N'El alimento para gatos adultos Purina Cat Chow es una excelente fuente de nutrientes para la salud de tu gato. Este alimento está hecho con pescado de', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/884152_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(23800.00 AS Decimal(10, 2)), N'k', 21, 2, 30, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (12, N'Alimento Gato Seco Adulto Salmón Esterilizado Pro ', N'Pro Plan gatos castrados es un alimento completo y balanceado para gatos adultos esterilizados. La esterilización conduce a cambios que pueden predisp', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/902371_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(18500.00 AS Decimal(10, 2)), N'k', 8, 2, 25, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (13, N'Comedero Doble Transparente Inclinado Para Gato Ph', N'Con este plato de estética única, ergonomía felina y de fácil limpieza, tus gatos disfrutarán aún más a la hora de comer. Es especial para gatos que p', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/893280_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(8000.00 AS Decimal(10, 2)), N'u', 5, 2, 25, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (14, N'Collar Gato Tribal Philozoo', N'Collar incluye broche especial felino abre-fácil. La campanita de adorno es removible. Collar elegante con tematica representativa del refugio naciona', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/893289_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(5500.00 AS Decimal(10, 2)), N'u', 16, 2, 24, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (15, N'Sueta con capucha para perros', N'Mantén a tu peludito abrigado y con estilo con este adorable Suéter para perros talla L. Fabricada en tela ligera y suave, es perfecta para paseos en ', N'https://mascotasgo.com/wp-content/uploads/2025/09/Plantilla-productos-web-700x800-F.pptx-1-5.jpg?x79530', CAST(10000.00 AS Decimal(10, 2)), N'u', 3, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (16, N'Traje de Dinosaurio', N'Atuendo abrigado para gatos, arnés con correa de dinosaurio.', N'https://img.kwcdn.com/product/fancy/721c134d-0823-435c-8bc3-5f33e23948be.jpg?imageView2/2/w/800/q/70/format/avif', CAST(3700.00 AS Decimal(10, 2)), N'u', 18, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (17, N'Chaleco multicolor', N'Chaleco multicolor diseñado para atitos recién nacidos, ropa adecuada para mascotas pequeñas, que ofrece un estilo suave y comodo.', N'https://img.kwcdn.com/product/open/d47d47e01cbe4befa3bbf0f70c4f76e7-goods.jpeg?imageView2/2/w/800/q/70/format/avif', CAST(2300.00 AS Decimal(10, 2)), N'u', 4, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (18, N' Botas para perro', N'Zapatos impermeables para perros, botines para perros con suela antideslizante reflectante resistente y antideslizante, zapatos para perros medianos a', N'https://m.media-amazon.com/images/I/81KeU1U+oHL._AC_SX679_PIbundle-4,TopRight,0,0_SH20_.jpg', CAST(8000.00 AS Decimal(10, 2)), N'u', 13, 2, 20, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (19, N'Alimento Perro Húmedo Toda Edad 6pack Vital Nutrit', N'Descubre el ALIMENTO PERRO VITAL NUTRITION 6PACK de GLEN GRANT, diseñado para satisfacer las necesidades nutricionales de tu mascota. Cada lata de 510', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/901548_3.jpg?version=22/03/tr:w-900,f-webp,q-80/2026?version=22/03/2026', CAST(3220.00 AS Decimal(10, 2)), N'u', 7, 2, 20, 1, CAST(N'2026-03-22' AS Date), 1, N'Perro')
GO
SET IDENTITY_INSERT [dbo].[productos] OFF
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
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (1, N'116700557', N'Fernanda Fajardo Torres', N'fer@waggy.com', N'ferwaggy', 1, N'88887777', N'San José, Costa Rica', 1)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (2, N'208990456', N'Juan Mora', N'juanm@gmial.com', N'123456', 1, N'88889999', N'Heredia, Costa Rica', 2)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (3, N'209880777', N'Elena Quesada', N'elena@gmail.com', N'123456', 0, N'88885678', N'Alajuela, Costa Rica', 2)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (4, N'112233445', N'Aaron Azofeifa Abarca', N'aaron@waggy.com', N'aaron123', 1, N'22336677', N'Heredia, Santa Cecilia', 1)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (5, N'11111111', N'test', N'test@gmail.com', N'test123', 1, N'12345678', N'San José, Desamparados', 2)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (6, N'23567899', N'test2', N'test2@gmail.com', N'12345', 1, N'2344555', N'San José, Merced Norte', 2)
GO
INSERT [dbo].[usuario] ([consecutivo], [identificacion], [nombre], [correoElectronico], [contrasenna], [estado], [telefono], [direccion], [consecutivoRol]) VALUES (7, N'112277003', N'Fernanda FT', N'nanda199784@gmail.com', N'WIWUGLTO', 1, N'22557799', N'San José, Desamparados', 2)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[ventas_clientes_det] ON 
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (1, 1, 19, 1, CAST(3220.00 AS Decimal(15, 2)), CAST(418.60 AS Decimal(15, 2)), CAST(3638.60 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (2, 1, 13, 1, CAST(8000.00 AS Decimal(15, 2)), CAST(1040.00 AS Decimal(15, 2)), CAST(9040.00 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (3, 1, 16, 1, CAST(3700.00 AS Decimal(15, 2)), CAST(481.00 AS Decimal(15, 2)), CAST(4181.00 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (4, 2, 12, 2, CAST(37000.00 AS Decimal(15, 2)), CAST(4810.00 AS Decimal(15, 2)), CAST(41810.00 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (5, 2, 16, 1, CAST(3700.00 AS Decimal(15, 2)), CAST(481.00 AS Decimal(15, 2)), CAST(4181.00 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (6, 2, 5, 1, CAST(2500.00 AS Decimal(15, 2)), CAST(325.00 AS Decimal(15, 2)), CAST(2825.00 AS Decimal(15, 2)))
GO
INSERT [dbo].[ventas_clientes_det] ([cons_venta_det], [cons_venta], [cons_producto], [cantidad], [monto_linea], [impuesto_linea], [monto_neto_linea]) VALUES (7, 2, 13, 1, CAST(8000.00 AS Decimal(15, 2)), CAST(1040.00 AS Decimal(15, 2)), CAST(9040.00 AS Decimal(15, 2)))
GO
SET IDENTITY_INSERT [dbo].[ventas_clientes_det] OFF
GO
SET IDENTITY_INSERT [dbo].[ventas_clientes_enc] ON 
GO
INSERT [dbo].[ventas_clientes_enc] ([cons_venta], [consecutivo], [fec_venta], [monto_venta_brut], [impuesto_venta_tot], [monto_venta_net]) VALUES (1, 1, CAST(N'2026-03-22' AS Date), CAST(14920.00 AS Decimal(17, 2)), CAST(1939.60 AS Decimal(17, 2)), CAST(16859.60 AS Decimal(17, 2)))
GO
INSERT [dbo].[ventas_clientes_enc] ([cons_venta], [consecutivo], [fec_venta], [monto_venta_brut], [impuesto_venta_tot], [monto_venta_net]) VALUES (2, 7, CAST(N'2026-03-22' AS Date), CAST(51200.00 AS Decimal(17, 2)), CAST(6656.00 AS Decimal(17, 2)), CAST(57856.00 AS Decimal(17, 2)))
GO
SET IDENTITY_INSERT [dbo].[ventas_clientes_enc] OFF
GO
/****** Object:  Index [UQ_carrito_det_carrito_producto]    Script Date: 22/3/2026 12:47:38 ******/
ALTER TABLE [dbo].[carrito_det] ADD  CONSTRAINT [UQ_carrito_det_carrito_producto] UNIQUE NONCLUSTERED 
(
	[cons_carrito] ASC,
	[cons_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CORREO]    Script Date: 22/3/2026 12:47:38 ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [UQ_CORREO] UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carrito_enc] ADD  DEFAULT (getdate()) FOR [fec_registro]
GO
ALTER TABLE [dbo].[carrito_enc] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[inventario_enc] ADD  DEFAULT ('r') FOR [estado_inv]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ('u') FOR [unidad_medida]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((0)) FOR [existencia]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((0)) FOR [existenciamin]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((0)) FOR [existenciamax]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[productos] ADD  DEFAULT ((1)) FOR [cons_categoria]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[carrito_det]  WITH CHECK ADD  CONSTRAINT [FK_carrito_det_carrito_enc] FOREIGN KEY([cons_carrito])
REFERENCES [dbo].[carrito_enc] ([cons_carrito])
GO
ALTER TABLE [dbo].[carrito_det] CHECK CONSTRAINT [FK_carrito_det_carrito_enc]
GO
ALTER TABLE [dbo].[carrito_det]  WITH CHECK ADD  CONSTRAINT [FK_carrito_det_productos] FOREIGN KEY([cons_producto])
REFERENCES [dbo].[productos] ([cons_producto])
GO
ALTER TABLE [dbo].[carrito_det] CHECK CONSTRAINT [FK_carrito_det_productos]
GO
ALTER TABLE [dbo].[carrito_enc]  WITH CHECK ADD  CONSTRAINT [FK_carrito_enc_usuario] FOREIGN KEY([consecutivo])
REFERENCES [dbo].[usuario] ([consecutivo])
GO
ALTER TABLE [dbo].[carrito_enc] CHECK CONSTRAINT [FK_carrito_enc_usuario]
GO
ALTER TABLE [dbo].[inventario_det]  WITH CHECK ADD  CONSTRAINT [fk_invdet_inventario] FOREIGN KEY([cons_inventario])
REFERENCES [dbo].[inventario_enc] ([cons_inventario])
GO
ALTER TABLE [dbo].[inventario_det] CHECK CONSTRAINT [fk_invdet_inventario]
GO
ALTER TABLE [dbo].[inventario_det]  WITH CHECK ADD  CONSTRAINT [fk_invdet_producto] FOREIGN KEY([consec_producto])
REFERENCES [dbo].[productos] ([cons_producto])
GO
ALTER TABLE [dbo].[inventario_det] CHECK CONSTRAINT [fk_invdet_producto]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_CATEGORIA] FOREIGN KEY([cons_categoria])
REFERENCES [dbo].[categoria] ([cons_categoria])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_PRODUCTOS_CATEGORIA]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_ROL] FOREIGN KEY([consecutivoRol])
REFERENCES [dbo].[rol] ([consecutivo])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_USUARIO_ROL]
GO
ALTER TABLE [dbo].[ventas_clientes_det]  WITH CHECK ADD  CONSTRAINT [fk_ventasdet_producto] FOREIGN KEY([cons_producto])
REFERENCES [dbo].[productos] ([cons_producto])
GO
ALTER TABLE [dbo].[ventas_clientes_det] CHECK CONSTRAINT [fk_ventasdet_producto]
GO
ALTER TABLE [dbo].[ventas_clientes_det]  WITH CHECK ADD  CONSTRAINT [fk_ventasdet_venta] FOREIGN KEY([cons_venta])
REFERENCES [dbo].[ventas_clientes_enc] ([cons_venta])
GO
ALTER TABLE [dbo].[ventas_clientes_det] CHECK CONSTRAINT [fk_ventasdet_venta]
GO
ALTER TABLE [dbo].[ventas_clientes_enc]  WITH CHECK ADD  CONSTRAINT [fk_ventas_enc_usuario] FOREIGN KEY([consecutivo])
REFERENCES [dbo].[usuario] ([consecutivo])
GO
ALTER TABLE [dbo].[ventas_clientes_enc] CHECK CONSTRAINT [fk_ventas_enc_usuario]
GO
ALTER TABLE [dbo].[inventario_enc]  WITH CHECK ADD  CONSTRAINT [chk_estado_inv] CHECK  (([estado_inv]='a' OR [estado_inv]='r'))
GO
ALTER TABLE [dbo].[inventario_enc] CHECK CONSTRAINT [chk_estado_inv]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [CHK_PRECIO_PRODUCTO] CHECK  (([precio]>(0)))
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [CHK_PRECIO_PRODUCTO]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [CHK_TIPO_MASCOTA] CHECK  (([tipo_mascota]='General' OR [tipo_mascota]='Gato' OR [tipo_mascota]='Perro'))
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [CHK_TIPO_MASCOTA]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [chk_unidad_medida] CHECK  (([unidad_medida]='g' OR [unidad_medida]='k' OR [unidad_medida]='l' OR [unidad_medida]='u'))
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [chk_unidad_medida]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarCantidadCarrito]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ActualizarCantidadCarrito]
    @ConsecutivoUsuario INT,
    @ConsProducto INT,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ConsCarrito INT;

    SELECT @ConsCarrito = cons_carrito
    FROM [dbo].[carrito_enc]
    WHERE consecutivo = @ConsecutivoUsuario
      AND estado = 1;

    IF @ConsCarrito IS NOT NULL
    BEGIN
        UPDATE [dbo].[carrito_det]
        SET cantidad = @Cantidad
        WHERE cons_carrito = @ConsCarrito
          AND cons_producto = @ConsProducto;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarContrasenna]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarContrasenna]
    @Contrasenna VARCHAR(15),
    @Consecutivo INT
AS
BEGIN
    UPDATE dbo.usuario
    SET contrasenna = @Contrasenna
    WHERE consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarExistenciaProducto]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ActualizarExistenciaProducto]
    @ConsProducto INT,
    @CantidadComprada INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[productos]
    SET existencia = existencia - @CantidadComprada
    WHERE cons_producto = @ConsProducto
      AND existencia >= @CantidadComprada;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarProductoCarrito]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_AgregarProductoCarrito]
    @ConsecutivoUsuario INT,
    @ConsProducto INT,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ConsCarrito INT;
    DECLARE @CantidadActual INT;

    SELECT @ConsCarrito = cons_carrito
    FROM [dbo].[carrito_enc]
    WHERE consecutivo = @ConsecutivoUsuario
      AND estado = 1;

    IF @ConsCarrito IS NULL
    BEGIN
        INSERT INTO [dbo].[carrito_enc]
        (consecutivo, fec_registro, estado)
        VALUES (@ConsecutivoUsuario, GETDATE(), 1);

        SET @ConsCarrito = SCOPE_IDENTITY();
    END

    SELECT @CantidadActual = cantidad
    FROM [dbo].[carrito_det]
    WHERE cons_carrito = @ConsCarrito
      AND cons_producto = @ConsProducto;

    IF @CantidadActual IS NULL
    BEGIN
        INSERT INTO [dbo].[carrito_det]
        (cons_carrito, cons_producto, cantidad)
        VALUES (@ConsCarrito, @ConsProducto, @Cantidad);
    END
    ELSE
    BEGIN
        UPDATE [dbo].[carrito_det]
        SET cantidad = cantidad + @Cantidad
        WHERE cons_carrito = @ConsCarrito
          AND cons_producto = @ConsProducto;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlternarEstadoProducto]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AlternarEstadoProducto]
    @CONS_PRODUCTO INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE productos
    SET estado = CASE WHEN estado = 1 THEN 0 ELSE 1 END
    WHERE cons_producto = @CONS_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AlternarEstadoUsuario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AlternarEstadoUsuario]
    @Consecutivo INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE usuario
    SET estado = CASE WHEN estado = 1 THEN 0 ELSE 1 END
    WHERE consecutivo = @Consecutivo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AplicarInventario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AplicarInventario]
    @ConsInventario INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET p.existencia = id.cantidad_inventario
    FROM productos p
    INNER JOIN inventario_det id
        ON p.cons_producto = id.consec_producto
    WHERE id.cons_inventario = @ConsInventario;

    UPDATE inventario_enc
    SET estado_inv = 'a'
    WHERE cons_inventario = @ConsInventario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarCarritoUsuario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ConsultarCarritoUsuario]
    @ConsecutivoUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.cons_producto,
        p.nombre_producto,
        p.imagen,
        p.precio,
        p.existencia,
        cd.cantidad
    FROM [dbo].[carrito_enc] ce
    INNER JOIN [dbo].[carrito_det] cd
        ON ce.cons_carrito = cd.cons_carrito
    INNER JOIN [dbo].[productos] p
        ON cd.cons_producto = p.cons_producto
    WHERE ce.consecutivo = @ConsecutivoUsuario
      AND ce.estado = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearInventarioEnc]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearInventarioEnc]
    @FecInventario DATE,
    @Observaciones VARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO inventario_enc (fec_inventario, observaciones, estado_inv)
    VALUES (@FecInventario, @Observaciones, 'r');

    SELECT SCOPE_IDENTITY() AS ConsInventario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearProducto]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearProducto]
(
    @NOMBRE_PRODUCTO       VARCHAR(50),
    @DESCRIPCION_PRODUCTO  VARCHAR(150),
    @IMAGEN                VARCHAR(300),
    @PRECIO                DECIMAL(10,2),
    @UNIDAD_MEDIDA         VARCHAR(1),
    @EXISTENCIA            INT,
    @EXISTENCIAMIN         INT,
    @EXISTENCIAMAX         INT,
    @CONS_CATEGORIA        INT,
    @TIPO_MASCOTA          VARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 
               FROM productos
               WHERE nombre_producto = @NOMBRE_PRODUCTO)
    BEGIN
        RAISERROR('Ya existe un producto con ese nombre.',16,1)
        RETURN
    END

    IF (@PRECIO <= 0)
    BEGIN
        RAISERROR('El precio debe ser mayor a cero.',16,1)
        RETURN
    END

    IF (@EXISTENCIAMIN > @EXISTENCIAMAX)
    BEGIN
        RAISERROR('La existencia mínima no puede ser mayor que la existencia máxima.',16,1)
        RETURN
    END

    INSERT INTO productos
    (
        nombre_producto,
        descripcion_producto,
        imagen,
        precio,
        unidad_medida,
        existencia,
        existenciamin,
        existenciamax,
        estado,
        registro_prod,
        cons_categoria,
        tipo_mascota
    )
    VALUES
    (
        @NOMBRE_PRODUCTO,
        @DESCRIPCION_PRODUCTO,
        @IMAGEN,
        @PRECIO,
        LOWER(@UNIDAD_MEDIDA),
        @EXISTENCIA,
        @EXISTENCIAMIN,
        @EXISTENCIAMAX,
        1,
        GETDATE(),
        @CONS_CATEGORIA,
        @TIPO_MASCOTA
    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearUsuario]
(
    @IDENTIFICACION   VARCHAR(20),
    @NOMBRE           VARCHAR(200),
    @CORREO           VARCHAR(150),
    @PASSWORD         VARCHAR(255),
    @TELEFONO         VARCHAR(20),
    @DIRECCION        VARCHAR(255),
    @CONSECUTIVO_ROL  INT 
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[usuario] WHERE [correoElectronico] = @CORREO)
    BEGIN
        RAISERROR('El correo electrónico ya se encuentra registrado.', 16, 1)
        RETURN
    END

    IF EXISTS (SELECT 1 FROM [dbo].[usuario] WHERE [identificacion] = @IDENTIFICACION)
    BEGIN
        RAISERROR('La identificación ya se encuentra registrada.', 16, 1)
        RETURN
    END

    INSERT INTO [dbo].[usuario] 
        ([identificacion], 
         [nombre], 
         [correoElectronico], 
         [contrasenna], 
         [estado], 
         [telefono], 
         [direccion], 
         [consecutivoRol])
    VALUES 
        (@IDENTIFICACION, 
         @NOMBRE, 
         @CORREO, 
         @PASSWORD, 
         1, 
         @TELEFONO, 
         @DIRECCION, 
         @CONSECUTIVO_ROL) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditarProducto]
(
    @CONS_PRODUCTO         INT,
    @NOMBRE_PRODUCTO       VARCHAR(50),
    @DESCRIPCION_PRODUCTO  VARCHAR(150),
    @IMAGEN                VARCHAR(300),
    @PRECIO                DECIMAL(10,2),
    @UNIDAD_MEDIDA         VARCHAR(1),
    @EXISTENCIA            INT,
    @EXISTENCIAMIN         INT,
    @EXISTENCIAMAX         INT,
    @CONS_CATEGORIA        INT,
    @TIPO_MASCOTA          VARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM productos
        WHERE nombre_producto = @NOMBRE_PRODUCTO
          AND cons_producto <> @CONS_PRODUCTO
    )
    BEGIN
        RAISERROR('Ya existe otro producto con ese nombre.',16,1)
        RETURN
    END

    IF (@PRECIO <= 0)
    BEGIN
        RAISERROR('El precio debe ser mayor a cero.',16,1)
        RETURN
    END

    IF (@EXISTENCIAMIN > @EXISTENCIAMAX)
    BEGIN
        RAISERROR('La existencia mínima no puede ser mayor que la existencia máxima.',16,1)
        RETURN
    END

    UPDATE productos
    SET
        nombre_producto = @NOMBRE_PRODUCTO,
        descripcion_producto = @DESCRIPCION_PRODUCTO,
        imagen = @IMAGEN,
        precio = @PRECIO,
        unidad_medida = LOWER(@UNIDAD_MEDIDA),
        existencia = @EXISTENCIA,
        existenciamin = @EXISTENCIAMIN,
        existenciamax = @EXISTENCIAMAX,
        cons_categoria = @CONS_CATEGORIA,
        tipo_mascota = @TIPO_MASCOTA
    WHERE cons_producto = @CONS_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditarUsuario]
(
    @Consecutivo INT,
    @Nombre VARCHAR(200),
    @Telefono VARCHAR(20),
    @Direccion VARCHAR(255),
    @ConsecutivoRol INT
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[usuario]
    SET 
        nombre = @Nombre,
        telefono = @Telefono,
        direccion = @Direccion,
        consecutivoRol = @ConsecutivoRol
    WHERE consecutivo = @Consecutivo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarInventario]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarInventario]
    @ConsInventario INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM inventario_det
    WHERE cons_inventario = @ConsInventario;

    DELETE FROM inventario_enc
    WHERE cons_inventario = @ConsInventario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProductoCarrito]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_EliminarProductoCarrito]
    @ConsecutivoUsuario INT,
    @ConsProducto INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ConsCarrito INT;

    SELECT @ConsCarrito = cons_carrito
    FROM [dbo].[carrito_enc]
    WHERE consecutivo = @ConsecutivoUsuario
      AND estado = 1;

    IF @ConsCarrito IS NOT NULL
    BEGIN
        DELETE FROM [dbo].[carrito_det]
        WHERE cons_carrito = @ConsCarrito
          AND cons_producto = @ConsProducto;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardarInventarioDet]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GuardarInventarioDet]
    @ConsInventario INT,
    @ConsProducto INT,
    @CantidadInventario INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inventario_det
        WHERE cons_inventario = @ConsInventario
          AND consec_producto = @ConsProducto
    )
    BEGIN
        UPDATE inventario_det
        SET cantidad_inventario = @CantidadInventario
        WHERE cons_inventario = @ConsInventario
          AND consec_producto = @ConsProducto;
    END
    ELSE
    BEGIN
        INSERT INTO inventario_det
        (
            consec_producto,
            cons_inventario,
            cantidad_inventario
        )
        VALUES
        (
            @ConsProducto,
            @ConsInventario,
            @CantidadInventario
        );
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IniciarSesion]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[sp_LimpiarCarrito]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_LimpiarCarrito]
    @ConsecutivoUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ConsCarrito INT;

    SELECT @ConsCarrito = cons_carrito
    FROM [dbo].[carrito_enc]
    WHERE consecutivo = @ConsecutivoUsuario
      AND estado = 1;

    IF @ConsCarrito IS NOT NULL
    BEGIN
        DELETE FROM [dbo].[carrito_det]
        WHERE cons_carrito = @ConsCarrito;

        UPDATE [dbo].[carrito_enc]
        SET estado = 0
        WHERE cons_carrito = @ConsCarrito;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProductos]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarProductos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.cons_producto,
        p.nombre_producto,
        p.descripcion_producto,
        p.imagen,
        p.precio,
        p.unidad_medida,
        p.existencia,
        p.existenciamin,
        p.existenciamax,
        p.estado,
        p.registro_prod,
        p.cons_categoria,
        c.nombre_categoria,
        p.tipo_mascota
    FROM productos p
    INNER JOIN categoria c
        ON p.cons_categoria = c.cons_categoria
    ORDER BY p.cons_producto DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerInventarioDet]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerInventarioDet]
    @ConsInventario INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CAST(ISNULL(id.cons_inventario_det, 0) AS INT) AS cons_inventario_det,
        CAST(@ConsInventario AS INT) AS cons_inventario,
        CAST(p.cons_producto AS INT) AS cons_producto,
        p.nombre_producto,
        p.imagen,
        CAST(ISNULL(id.cantidad_inventario, 0) AS INT) AS cantidad_inventario,
        CAST(p.existencia AS INT) AS stock_actual
    FROM productos p
    LEFT JOIN inventario_det id
        ON p.cons_producto = id.consec_producto
       AND id.cons_inventario = @ConsInventario
    WHERE p.estado = 1
    ORDER BY p.nombre_producto;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerInventarios]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerInventarios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        cons_inventario,
        fec_inventario,
        observaciones,
        estado_inv
    FROM inventario_enc
    ORDER BY cons_inventario DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerOCrearCarrito]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_ObtenerOCrearCarrito]
    @ConsecutivoUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ConsCarrito INT;

    SELECT @ConsCarrito = cons_carrito
    FROM [dbo].[carrito_enc]
    WHERE consecutivo = @ConsecutivoUsuario
      AND estado = 1;

    IF @ConsCarrito IS NULL
    BEGIN
        INSERT INTO [dbo].[carrito_enc]
        (consecutivo, fec_registro, estado)
        VALUES (@ConsecutivoUsuario, GETDATE(), 1);

        SET @ConsCarrito = SCOPE_IDENTITY();
    END

    SELECT @ConsCarrito AS cons_carrito;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProductoPorId]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerProductoPorId]
    @CONS_PRODUCTO INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.cons_producto,
        p.nombre_producto,
        p.descripcion_producto,
        p.imagen,
        p.precio,
        p.unidad_medida,
        p.existencia,
        p.existenciamin,
        p.existenciamax,
        p.estado,
        p.registro_prod,
        p.cons_categoria,
        p.tipo_mascota
    FROM productos p
    WHERE p.cons_producto = @CONS_PRODUCTO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProductosHomePorCategoria]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerProductosHomePorCategoria]
(
    @CONS_CATEGORIA INT,
    @CANTIDAD INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@CANTIDAD)
        p.cons_producto,
        p.nombre_producto,
        p.descripcion_producto,
        p.imagen,
        p.precio,
        p.unidad_medida,
        p.existencia,
        p.existenciamin,
        p.existenciamax,
        p.estado,
        p.registro_prod,
        p.cons_categoria,
        p.tipo_mascota
    FROM productos p
    WHERE p.estado = 1
      AND p.cons_categoria = @CONS_CATEGORIA
    ORDER BY p.cons_producto DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerUsuarioPorId]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerUsuarioPorId]
    @Consecutivo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        consecutivo, 
        identificacion, 
        nombre, 
        correoElectronico, 
        telefono, 
        direccion, 
        consecutivoRol
    FROM [dbo].[usuario]
    WHERE consecutivo = @Consecutivo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarVentaDet]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_RegistrarVentaDet]
    @ConsVenta INT,
    @ConsProducto INT,
    @Cantidad INT,
    @MontoLinea DECIMAL(15,2),
    @ImpuestoLinea DECIMAL(15,2),
    @MontoNetoLinea DECIMAL(15,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[ventas_clientes_det]
    (cons_venta, cons_producto, cantidad, monto_linea, impuesto_linea, monto_neto_linea)
    VALUES
    (@ConsVenta, @ConsProducto, @Cantidad, @MontoLinea, @ImpuestoLinea, @MontoNetoLinea);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarVentaEnc]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[sp_RegistrarVentaEnc]
    @ConsecutivoUsuario INT,
    @MontoVentaBrut DECIMAL(17,2),
    @ImpuestoVentaTot DECIMAL(17,2),
    @MontoVentaNet DECIMAL(17,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[ventas_clientes_enc]
    (consecutivo, fec_venta, monto_venta_brut, impuesto_venta_tot, monto_venta_net)
    VALUES
    (@ConsecutivoUsuario, GETDATE(), @MontoVentaBrut, @ImpuestoVentaTot, @MontoVentaNet);

    SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarCorreo]    Script Date: 22/3/2026 12:47:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarCorreo]
    @CorreoElectronico varchar(100)
AS
BEGIN
    SELECT  consecutivo,
            identificacion,
            nombre
    FROM    usuario
    WHERE   correoElectronico = @CorreoElectronico
            AND estado = 1
END;
GO
USE [master]
GO
ALTER DATABASE [WaggyDB] SET  READ_WRITE 
GO
