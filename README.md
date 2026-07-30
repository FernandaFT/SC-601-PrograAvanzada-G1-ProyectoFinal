# 🐾 Waggy — Tienda web para mascotas

![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8.1-512BD4)
![ASP.NET MVC](https://img.shields.io/badge/ASP.NET%20MVC-5.2.9-5C2D91)
![Entity Framework](https://img.shields.io/badge/Entity%20Framework-6.5.1-68217A)
![SQL Server](https://img.shields.io/badge/SQL%20Server-WaggyDB-CC2927)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3)
![Estado](https://img.shields.io/badge/Estado-Proyecto%20académico-success)

**Waggy** es una aplicación web de comercio electrónico orientada a la venta de productos para mascotas. La plataforma permite consultar productos, administrar existencias, gestionar usuarios, controlar inventarios y realizar compras mediante un carrito persistente.

El sistema fue desarrollado como proyecto final del curso **SC-601 Programación Avanzada**, utilizando una arquitectura **Modelo–Vista–Controlador (MVC)**, ASP.NET sobre .NET Framework y SQL Server.

---

## 📑 Contenido

* [Descripción](#-descripción)
* [Objetivo](#-objetivo)
* [Funcionalidades](#-funcionalidades)
* [Tecnologías utilizadas](#-tecnologías-utilizadas)
* [Arquitectura](#-arquitectura)
* [Base de datos](#-base-de-datos)
* [Requisitos](#-requisitos)
* [Instalación](#-instalación)
* [Configuración del correo](#-configuración-del-correo)
* [Credenciales de prueba](#-credenciales-de-prueba)
* [Estructura del proyecto](#-estructura-del-proyecto)
* [Flujo de compra](#-flujo-de-compra)
* [Seguridad](#-consideraciones-de-seguridad)
* [Mejoras futuras](#-mejoras-futuras)
* [Autores](#-autores)

---

## 📖 Descripción

Waggy ofrece una experiencia de compra digital para personas que buscan productos para perros y gatos.

El catálogo contiene diferentes tipos de productos, como:

* Alimentos.
* Ropa para mascotas.
* Accesorios.
* Productos para perros.
* Productos para gatos.
* Productos de uso general.

Además de la tienda para clientes, el sistema dispone de un módulo administrativo para gestionar usuarios, productos, inventarios, existencias y ventas.

---

## 🎯 Objetivo

Desarrollar una aplicación web que permita centralizar las operaciones principales de una tienda de productos para mascotas, facilitando:

* La consulta y compra de productos.
* El control de existencias.
* La realización de inventarios físicos.
* La administración de usuarios y roles.
* El registro y consulta de ventas.
* La emisión de comprobantes de compra.
* La recuperación y actualización de credenciales.

---

## ✨ Funcionalidades

### 👤 Funcionalidades para clientes

* Inicio y cierre de sesión.
* Validación de usuarios activos e inactivos.
* Consulta de productos por categoría.
* Consulta de productos para perros y gatos.
* Visualización de precio y disponibilidad.
* Identificación de productos nuevos.
* Alertas de productos agotados o con pocas unidades.
* Carrito de compras persistente.
* Agregar productos al carrito.
* Modificar cantidades.
* Eliminar productos.
* Validación de inventario antes de confirmar una compra.
* Cálculo automático del subtotal.
* Cálculo del impuesto del 13 %.
* Cálculo del total de la compra.
* Generación de factura.
* Envío de comprobante de compra por correo electrónico.
* Consulta y actualización del perfil.
* Cambio de contraseña.
* Recuperación de contraseña por correo electrónico.

### 🛡️ Funcionalidades para administradores

* Acceso restringido según el rol del usuario.
* Consulta paginada de usuarios.
* Creación de usuarios.
* Edición de usuarios.
* Asignación de roles.
* Activación e inactivación de usuarios.
* Consulta paginada de productos.
* Creación y edición de productos.
* Activación e inactivación de productos.
* Administración de categorías.
* Clasificación de productos por tipo de mascota.
* Configuración de existencias mínimas y máximas.
* Registro de tomas físicas de inventario.
* Aplicación de inventarios al stock actual.
* Consulta de productos por debajo del inventario mínimo.
* Consulta detallada de ventas.
* Filtrado de ventas por fecha, cliente y producto.

---

## 🧰 Tecnologías utilizadas

| Tecnología             | Uso                                   |
| ---------------------- | ------------------------------------- |
| C#                     | Lógica principal de la aplicación     |
| .NET Framework 4.8.1   | Plataforma de ejecución               |
| ASP.NET MVC 5.2.9      | Arquitectura y desarrollo web         |
| Razor                  | Construcción de vistas dinámicas      |
| Entity Framework 6.5.1 | Acceso y mapeo de la base de datos    |
| SQL Server             | Almacenamiento de información         |
| Stored Procedures      | Operaciones y reglas de base de datos |
| HTML5                  | Estructura de las páginas             |
| CSS3                   | Diseño visual                         |
| Bootstrap 5            | Diseño responsivo                     |
| JavaScript             | Interacciones del lado del cliente    |
| jQuery                 | Manipulación del DOM y validaciones   |
| IIS Express            | Ejecución local de la aplicación      |
| SMTP de Office 365     | Envío de correos electrónicos         |
| Iconify                | Iconos de la interfaz                 |
| Swiper                 | Carrusel de productos y promociones   |

---

## 🏗️ Arquitectura

El proyecto utiliza el patrón **Modelo–Vista–Controlador**.

### Modelos

Los modelos representan y validan la información que utiliza la aplicación.

Entre los principales modelos se encuentran:

* `UsuarioModel`
* `ProductoModel`
* `CarritoItemModel`
* `VentasModel`
* `ExistenciaModel`
* `InventarioEncViewModel`
* `InventarioDetViewModel`
* `FacturaViewModel`
* `PerfilModel`
* `SeguridadModel`
* `HomeModel`

### Vistas

Las vistas se encuentran desarrolladas con Razor, HTML, CSS, Bootstrap y JavaScript.

Existen vistas para:

* Inicio de sesión.
* Recuperación de contraseña.
* Página principal.
* Catálogo por categoría.
* Carrito de compras.
* Factura.
* Perfil y seguridad.
* Gestión de usuarios.
* Gestión de productos.
* Gestión de inventarios.
* Consulta de existencias.
* Consulta de ventas.
* Información de la empresa.
* Contacto.

### Controladores

Los controladores administran las solicitudes de la aplicación:

| Controlador             | Responsabilidad                                                          |
| ----------------------- | ------------------------------------------------------------------------ |
| `HomeController`        | Inicio, autenticación, recuperación de contraseña y páginas informativas |
| `UsuarioController`     | Administración de usuarios                                               |
| `ProductoController`    | Administración y consulta de productos                                   |
| `CarritoController`     | Carrito, compra, factura y comprobante                                   |
| `InventarioController`  | Tomas físicas y aplicación de inventarios                                |
| `ExistenciasController` | Consulta y filtrado de existencias                                       |
| `VentasController`      | Consulta detallada de ventas                                             |
| `SeguridadController`   | Perfil y cambio de contraseña                                            |

### Entity Framework

La aplicación utiliza Entity Framework con el enfoque **Database First**.

El modelo de datos se encuentra en:

```text
ProyectoFinalG1/EntityFramework/Model1.edmx
```

---

## 🗄️ Base de datos

La base de datos utilizada por el proyecto se llama:

```text
WaggyDB
```

El repositorio contiene el script:

```text
DB_Waggy.sql
```

Este archivo crea la base de datos, tablas, relaciones, restricciones, procedimientos almacenados y datos iniciales.

### Tablas principales

| Tabla                 | Descripción                                  |
| --------------------- | -------------------------------------------- |
| `rol`                 | Roles disponibles en el sistema              |
| `usuario`             | Información de clientes y administradores    |
| `categoria`           | Categorías de productos                      |
| `productos`           | Catálogo, precios y existencias              |
| `carrito_enc`         | Encabezados de carritos                      |
| `carrito_det`         | Productos almacenados en cada carrito        |
| `inventario_enc`      | Encabezados de tomas físicas                 |
| `inventario_det`      | Cantidades registradas durante un inventario |
| `ventas_clientes_enc` | Encabezados de las ventas                    |
| `ventas_clientes_det` | Detalle de productos vendidos                |

### Roles disponibles

| Código | Rol           |
| -----: | ------------- |
|      1 | Administrador |
|      2 | Cliente       |

### Categorías iniciales

| Código | Categoría  |
| -----: | ---------- |
|      1 | Alimentos  |
|      2 | Ropa       |
|      3 | Accesorios |

---

## 📋 Requisitos

Para ejecutar el proyecto se necesita:

* Windows 10 u 11.
* Visual Studio 2022.
* Carga de trabajo **Desarrollo de ASP.NET y web**.
* .NET Framework 4.8.1 Developer Pack.
* SQL Server LocalDB o SQL Server.
* SQL Server Management Studio, recomendado.
* NuGet Package Manager.
* IIS Express.
* Una cuenta compatible con SMTP de Office 365 para probar los correos.
* Conexión a Internet para cargar imágenes, fuentes, iconos y bibliotecas CDN.

---

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/FernandaFT/SC-601-PrograAvanzada-G1-ProyectoFinal.git
```

Ingresar al directorio:

```bash
cd SC-601-PrograAvanzada-G1-ProyectoFinal
```

### 2. Crear la base de datos

1. Abrir SQL Server Management Studio.
2. Conectarse a la instancia de SQL Server o LocalDB.
3. Abrir el archivo:

```text
DB_Waggy.sql
```

4. Ejecutar el script completo.

El script creará automáticamente la base de datos `WaggyDB`, sus tablas, relaciones, procedimientos almacenados y datos de ejemplo.

> Si ya existe una base de datos llamada `WaggyDB`, debe eliminarla, respaldarla o modificar el nombre dentro del script antes de ejecutarlo.

### 3. Abrir el proyecto

Abrir en Visual Studio el archivo:

```text
ProyectoFinalG1/ProyectoFinalG1.csproj
```

### 4. Restaurar paquetes NuGet

En Visual Studio:

1. Hacer clic derecho sobre el proyecto.
2. Seleccionar **Restore NuGet Packages**.

También puede utilizar la consola de NuGet:

```powershell
Update-Package -Reinstall
```

### 5. Configurar la conexión

La conexión se encuentra en:

```text
ProyectoFinalG1/Web.config
```

La configuración predeterminada utiliza:

```text
(localdb)\MSSQLLocalDB
```

Ejemplo simplificado:

```xml
<connectionStrings>
  <add
    name="WaggyDBEntities"
    connectionString="...data source=(localdb)\MSSQLLocalDB;initial catalog=WaggyDB;integrated security=True;..."
    providerName="System.Data.EntityClient" />
</connectionStrings>
```

Cuando se utilice otra instancia, debe sustituirse el servidor dentro de la cadena de conexión.

Ejemplos:

```text
.\SQLEXPRESS
```

```text
NOMBRE_SERVIDOR
```

### 6. Ejecutar la aplicación

En Visual Studio:

1. Seleccionar el proyecto como proyecto de inicio.
2. Ejecutar mediante **IIS Express**.
3. Presionar `F5` para depuración o `Ctrl + F5` para ejecutar sin depuración.

La aplicación mostrará inicialmente la pantalla de inicio de sesión.

---

## 📧 Configuración del correo

El sistema utiliza SMTP de Office 365 para:

* Recuperar contraseñas.
* Notificar cambios de contraseña.
* Enviar comprobantes de compra.

La configuración se realiza dentro de `Web.config`:

```xml
<appSettings>
  <add key="CuentaCorreo" value="correo@dominio.com" />
  <add key="contrasennaCorreo" value="contraseña-del-correo" />
</appSettings>
```

El servicio utiliza:

```text
Servidor: smtp.office365.com
Puerto: 587
SSL/TLS: habilitado
```

> No se deben publicar contraseñas reales en GitHub. Las credenciales deben mantenerse únicamente en el entorno local o administrarse mediante variables de entorno, archivos de configuración privados o un gestor de secretos.

La configuración SMTP debe completarse antes de probar la recuperación de contraseña o confirmar una compra.

---

## 🔐 Credenciales de prueba

El script de base de datos incluye usuarios de ejemplo.

### Administrador

```text
Correo: fer@waggy.com
Contraseña: ferwaggy
```

### Cliente

```text
Correo: carlos.rodriguez@correo.com
Contraseña: 123456
```

> Estas credenciales son exclusivamente para pruebas locales y no deben utilizarse en un ambiente productivo.

---

## 📂 Estructura del proyecto

```text
SC-601-PrograAvanzada-G1-ProyectoFinal/
│
├── DB_Waggy.sql
│
└── ProyectoFinalG1/
    ├── App_Start/
    │   ├── BundleConfig.cs
    │   ├── FilterConfig.cs
    │   └── RouteConfig.cs
    │
    ├── Controllers/
    │   ├── CarritoController.cs
    │   ├── ExistenciasController.cs
    │   ├── HomeController.cs
    │   ├── InventarioController.cs
    │   ├── ProductoController.cs
    │   ├── SeguridadController.cs
    │   ├── UsuarioController.cs
    │   └── VentasController.cs
    │
    ├── EntityFramework/
    │   ├── Model1.edmx
    │   └── Entidades generadas
    │
    ├── Filters/
    │   └── SesionActivaAttribute.cs
    │
    ├── Models/
    │   ├── CarritoItemModel.cs
    │   ├── ExistenciaModel.cs
    │   ├── FacturaViewModel.cs
    │   ├── HomeModel.cs
    │   ├── InventarioDetViewModel.cs
    │   ├── InventarioEncViewModel.cs
    │   ├── PerfilModel.cs
    │   ├── ProductoModel.cs
    │   ├── SeguridadModel.cs
    │   ├── UsuarioModel.cs
    │   └── VentasModel.cs
    │
    ├── Services/
    │   └── Generales.cs
    │
    ├── Template/
    │   ├── css/
    │   ├── images/
    │   ├── js/
    │   ├── ComprobanteCompra.html
    │   ├── NotificarContrasenna.html
    │   └── RecuperarContrasenna.html
    │
    ├── Views/
    │   ├── Carrito/
    │   ├── Existencias/
    │   ├── Home/
    │   ├── Inventario/
    │   ├── Producto/
    │   ├── Seguridad/
    │   ├── Shared/
    │   ├── Usuario/
    │   └── Ventas/
    │
    ├── Global.asax
    ├── packages.config
    ├── ProyectoFinalG1.csproj
    └── Web.config
```

---

## 🛒 Flujo de compra

1. El usuario inicia sesión.
2. El sistema recupera su carrito activo desde la base de datos.
3. El usuario consulta productos por categoría.
4. Agrega productos al carrito.
5. El sistema valida la existencia disponible.
6. El usuario puede modificar o eliminar productos.
7. Al confirmar la compra, el sistema vuelve a validar el inventario.
8. Se calcula el subtotal.
9. Se calcula el impuesto del 13 %.
10. Se registra el encabezado de la venta.
11. Se registran los detalles de la venta.
12. Se descuentan las cantidades vendidas del inventario.
13. Se genera una factura.
14. Se envía un comprobante por correo electrónico.
15. Se limpia el carrito activo.

---

## 🔒 Consideraciones de seguridad

Este proyecto fue desarrollado con fines académicos. Antes de utilizarlo en un ambiente productivo se recomienda:

* Aplicar hash seguro y salt a las contraseñas.
* No almacenar contraseñas en texto plano.
* No guardar credenciales SMTP directamente en `Web.config`.
* Utilizar variables de entorno o un gestor de secretos.
* Implementar protección CSRF en todas las operaciones de modificación.
* Evitar operaciones sensibles mediante solicitudes HTTP GET.
* Implementar políticas de contraseñas.
* Validar y sanear todos los datos ingresados.
* Registrar eventos de autenticación y administración.
* Implementar transacciones para el proceso de compra.
* Configurar manejo centralizado de excepciones.
* Utilizar HTTPS en todos los ambientes.

---

## 🧪 Pruebas recomendadas

Para validar el funcionamiento del proyecto se recomienda probar:

* Inicio de sesión con usuario válido.
* Inicio de sesión con usuario inactivo.
* Inicio de sesión con credenciales incorrectas.
* Restricción de módulos administrativos.
* Creación y edición de usuarios.
* Creación y edición de productos.
* Activación e inactivación de productos.
* Productos sin existencia.
* Productos debajo del mínimo.
* Creación y aplicación de inventarios.
* Agregar productos al carrito.
* Modificación de cantidades.
* Eliminación de productos.
* Validación de cantidades mayores al inventario.
* Confirmación de compra.
* Actualización del stock después de comprar.
* Generación de factura.
* Envío de comprobante.
* Recuperación de contraseña.
* Cambio de contraseña.
* Filtros de ventas.

---

## 🔮 Mejoras futuras

* Implementar almacenamiento seguro de contraseñas.
* Agregar registro público de clientes.
* Integrar una pasarela de pagos.
* Permitir carga local de imágenes.
* Agregar búsqueda de productos.
* Incorporar filtros por precio, categoría y mascota.
* Crear historial de compras para clientes.
* Generar reportes administrativos.
* Incorporar gráficos de ventas e inventario.
* Agregar pruebas unitarias y de integración.
* Implementar confirmación de correo electrónico.
* Agregar recuperación de contraseña mediante enlaces temporales.
* Implementar una API REST.
* Migrar el proyecto a ASP.NET Core.
* Preparar despliegue mediante contenedores.
* Mejorar accesibilidad y navegación mediante teclado.

---

## 👥 Autores

Proyecto desarrollado por el **Grupo 1** para el curso:

```text
SC-601 — Programación Avanzada
```

Repositorio mantenido por:

* **Fernanda Fajardo Torres** — [@FernandaFT](https://github.com/FernandaFT)
* **María Laura Brenes** — [@MariaLauraBrenes](https://github.com/MariaLauraBrenes)
* Integrantes y colaboradores del Grupo 1.

---

## 📄 Licencia

Este proyecto fue desarrollado con fines académicos.

Actualmente, el repositorio no contiene una licencia de software pública. Para reutilizar, distribuir o modificar el proyecto fuera del contexto académico, se recomienda consultar primero con sus autores.

---

<p align="center">
  Desarrollado con 🐾 por el equipo de Waggy
</p>

