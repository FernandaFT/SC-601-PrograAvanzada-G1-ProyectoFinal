USE [master]
GO

CREATE DATABASE [WaggyDB]

GO

USE [WaggyDB]
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
SET IDENTITY_INSERT [dbo].[productos] ON 
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (1, N'ONC Care Alimento Húmedo para Perros', N'Hill''s Prescription Diet, Nutrición clínica diseñada para nutrir y ayudar a los perros diagnosticados con cáncer.
', N'https://pxmshare.colgatepalmolive.com/JPEG_1500/DJOqjfjItfTWLNfHgYwLG.jpg', CAST(3500.00 AS Decimal(10, 2)), N'u', 10, 5, 50, 1, CAST(N'2026-03-17' AS Date), 1, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (2, N'a/d Alimento Húmedo con Pollo para Gatos', N'Apoyo nutricional que fomenta la alimentación de las mascotas que se recuperan de una cirugía, enfermedad o lesión', N'https://pxmshare.colgatepalmolive.com/JPEG_1500/gMUpelM8a9RavqimuXR4x.jpg', CAST(3500.00 AS Decimal(10, 2)), N'u', 15, 5, 50, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (3, N'Suéter flores de bluey', N'Dale a tu mascota comodidad y estilo con este Suéter flores de bluey para perros inspirado en los divertidos personajes de Bluey. Confeccionado en tel', N'https://mascotasgo.com/wp-content/uploads/2025/08/Plantilla-productos-web-700x800-F.pptx-10-1.jpg', CAST(7950.00 AS Decimal(10, 2)), N'u', 20, 2, 20, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (4, N'Kit Pechera y Correa Ajustable', N'Una de las mejores formas de disfrutar con tu peludo es a través de paseos al aire libre. Para ello, es fundamental contar con una pechera para gatos.', N'https://mascotasgo.com/wp-content/uploads/2022/02/pechera-gato.jpg', CAST(4250.00 AS Decimal(10, 2)), N'u', 7, 2, 15, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (5, N'Cosplay de Abeja', N'Conjunto de Otoño e Invierno para Gatos - Sudadera de Cosplay de Abeja para Razas Pequeñas', N'https://img.kwcdn.com/product/fancy/296da145-36dd-41ad-a1af-f219d9d2db60.jpg?imageView2/2/w/800/q/70/format/avif', CAST(2500.00 AS Decimal(10, 2)), N'u', 8, 2, 15, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (6, N'PURINA® PRO PLAN® ADULTO RAZA MEDIANA', N'Provee nutrición de avanzada que ayuda a los perros de razas medianas a mantenerse fuertes y llenos de vitalidad.

Esta fórmula ofrece, a través de ', N'https://purina.co.cr/sites/default/files/styles/webp/public/2022-10/razas-medianas-1-proplan.png.webp?itok=qBjyvUMv', CAST(37000.00 AS Decimal(10, 2)), N'k', 25, 4, 30, 1, CAST(N'2026-03-17' AS Date), 1, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (7, N'Cama Darth Vader', N'Esta cama para mascota inspirada en STAR WARS© es especial para los amantes de la saga galáctica mide 50 cm de largo por 35 de ancho es ideal para gat', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/875499_1.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(10450.00 AS Decimal(10, 2)), N'u', 6, 2, 15, 1, CAST(N'2026-03-17' AS Date), 3, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (8, N'Transportadora Zoonee Eco 5', N'La transportadora ZOONEE es perfecta para transportar mascotas mide 60 cm ancho x 61.5 cm alto x 81 cm fondo. Con su diseño cómodo y seguro, tu mascot', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/889468.jpg?version=17/03/2026', CAST(114000.00 AS Decimal(10, 2)), N'u', 3, 2, 17, 1, CAST(N'2026-03-17' AS Date), 3, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (9, N'Bebedero Automático 108 Oz Para Gato Petmate', N'El bebedero automático de 108 oz para gato Petmate es la solución perfecta para mantener a tu gato hidratado. Este bebedero cuenta con un diseño innov', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/889741.jpg?version=17/03/2026', CAST(49000.00 AS Decimal(10, 2)), N'u', 8, 2, 20, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (10, N'Alimento Gato Humedo Adulto Salmon Esterilizados P', N'El alimento húmedo para gatos adultos esterilizados de Purina One con sabor a salmón es una opción deliciosa y nutritiva para tu mascota. Este aliment', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:w-900,f-webp,q-80/876994.jpg?version=17/03/2026', CAST(775.00 AS Decimal(10, 2)), N'g', 20, 2, 40, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (11, N'Alimento Gato Seco Adulto Pescado Purina Cat Chow', N'El alimento para gatos adultos Purina Cat Chow es una excelente fuente de nutrientes para la salud de tu gato. Este alimento está hecho con pescado de', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/884152_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(23800.00 AS Decimal(10, 2)), N'k', 10, 2, 30, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (12, N'Alimento Gato Seco Adulto Salmón Esterilizado Pro ', N'Pro Plan gatos castrados es un alimento completo y balanceado para gatos adultos esterilizados. La esterilización conduce a cambios que pueden predisp', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/902371_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(18505.00 AS Decimal(10, 2)), N'k', 14, 2, 25, 1, CAST(N'2026-03-17' AS Date), 1, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (13, N'Comedero Doble Transparente Inclinado Para Gato Ph', N'Con este plato de estética única, ergonomía felina y de fácil limpieza, tus gatos disfrutarán aún más a la hora de comer. Es especial para gatos que p', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/893280_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(8000.00 AS Decimal(10, 2)), N'u', 9, 2, 25, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (14, N'Collar Gato Tribal Philozoo', N'Collar incluye broche especial felino abre-fácil. La campanita de adorno es removible. Collar elegante con tematica representativa del refugio naciona', N'https://ik.imagekit.io/autoenlinea/imgjpg/tr:f-webp/893289_2.jpg?version=17/03/tr:w-900,f-webp,q-80/2026?version=17/03/2026', CAST(5500.00 AS Decimal(10, 2)), N'u', 10, 2, 24, 1, CAST(N'2026-03-17' AS Date), 3, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (15, N'Sueta con capucha para perros', N'Mantén a tu peludito abrigado y con estilo con este adorable Suéter para perros talla L. Fabricada en tela ligera y suave, es perfecta para paseos en ', N'https://mascotasgo.com/wp-content/uploads/2025/09/Plantilla-productos-web-700x800-F.pptx-1-5.jpg?x79530', CAST(10000.00 AS Decimal(10, 2)), N'u', 3, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (16, N'Traje de Dinosaurio', N'Atuendo abrigado para gatos, arnés con correa de dinosaurio.', N'https://img.kwcdn.com/product/fancy/721c134d-0823-435c-8bc3-5f33e23948be.jpg?imageView2/2/w/800/q/70/format/avif', CAST(4000.00 AS Decimal(10, 2)), N'u', 5, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (17, N'Chaleco multicolor', N'Chaleco multicolor diseñado para atitos recién nacidos, ropa adecuada para mascotas pequeñas, que ofrece un estilo suave y comodo.', N'https://img.kwcdn.com/product/open/d47d47e01cbe4befa3bbf0f70c4f76e7-goods.jpeg?imageView2/2/w/800/q/70/format/avif', CAST(2300.00 AS Decimal(10, 2)), N'u', 4, 2, 10, 1, CAST(N'2026-03-17' AS Date), 2, N'Gato')
GO
INSERT [dbo].[productos] ([cons_producto], [nombre_producto], [descripcion_producto], [imagen], [precio], [unidad_medida], [existencia], [existenciamin], [existenciamax], [estado], [registro_prod], [cons_categoria], [tipo_mascota]) VALUES (18, N' Botas para perro', N'Zapatos impermeables para perros, botines para perros con suela antideslizante reflectante resistente y antideslizante, zapatos para perros medianos a', N'https://m.media-amazon.com/images/I/81KeU1U+oHL._AC_SX679_PIbundle-4,TopRight,0,0_SH20_.jpg', CAST(8000.00 AS Decimal(10, 2)), N'u', 13, 2, 20, 1, CAST(N'2026-03-17' AS Date), 2, N'Perro')
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
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CORREO]    Script Date: 17/3/2026 04:26:11 ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [UQ_CORREO] UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [WaggyDB] SET  READ_WRITE 
GO
