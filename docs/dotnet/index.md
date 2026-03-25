# .NET

## Introducción a .NET

.NET es una plataforma de desarrollo gratuita, de código abierto y multiplataforma creada por Microsoft para construir diferentes tipos de aplicaciones.

## ¿Qué es .NET?

.NET es un ecosistema completo de desarrollo que incluye:

- **Runtime**: Entorno de ejecución para aplicaciones .NET
- **Bibliotecas**: Amplia colección de APIs y librerías
- **Lenguajes**: Soporte para C#, F#, Visual Basic
- **Herramientas**: SDK, CLI, y herramientas de desarrollo

## Evolución de .NET

### .NET Framework (Legacy)
- Solo Windows
- Versión clásica de .NET
- Última versión: 4.8

### .NET Core
- Multiplataforma (Windows, Linux, macOS)
- Open source
- Alto rendimiento
- Versiones: 1.0 - 3.1

### .NET 5+ (Actual)
- Unificación de .NET Framework y .NET Core
- Multiplataforma
- Versión actual: .NET 8 (LTS)

## Características Principales

### Multiplataforma
Desarrolla y ejecuta aplicaciones en Windows, Linux y macOS.

### Alto Rendimiento
Uno de los frameworks web más rápidos según TechEmpower Benchmarks.

### Lenguaje C#
Lenguaje moderno, orientado a objetos y con características avanzadas.

### Open Source
Código abierto y desarrollo transparente en GitHub.

## Tipos de Aplicaciones

### Aplicaciones Web

#### ASP.NET Core MVC
Framework para construir aplicaciones web siguiendo el patrón MVC.

```csharp
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
```

#### ASP.NET Core Web API
Para crear APIs RESTful.

```csharp
[ApiController]
[Route("api/[controller]")]
public class ProductosController : ControllerBase
{
    [HttpGet]
    public ActionResult<IEnumerable<Producto>> Get()
    {
        return Ok(productos);
    }
}
```

#### Blazor
Framework para construir aplicaciones web interactivas usando C# en lugar de JavaScript.

**Blazor Server**: Renderizado en el servidor
**Blazor WebAssembly**: Ejecución en el navegador

### Aplicaciones de Escritorio

#### WPF (Windows Presentation Foundation)
Para aplicaciones de escritorio Windows con interfaces ricas.

#### Windows Forms
Framework clásico para aplicaciones de escritorio Windows.

#### MAUI (Multi-platform App UI)
Desarrollo de aplicaciones multiplataforma (Windows, macOS, iOS, Android).

### Aplicaciones Móviles

#### .NET MAUI
Desarrollo de aplicaciones móviles nativas para iOS y Android.

### Microservicios y Cloud

#### Azure Functions
Computación serverless en Azure.

#### Docker Support
Soporte nativo para contenedores Docker.

## Entity Framework Core

ORM oficial de .NET para acceso a datos.

```csharp
public class ApplicationDbContext : DbContext
{
    public DbSet<Usuario> Usuarios { get; set; }
    
    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseSqlServer(connectionString);
    }
}

// Uso
using (var context = new ApplicationDbContext())
{
    var usuarios = context.Usuarios
        .Where(u => u.Activo)
        .ToList();
}
```

## Características del Lenguaje C#

### LINQ (Language Integrated Query)

```csharp
var usuariosActivos = usuarios
    .Where(u => u.Activo)
    .OrderBy(u => u.Nombre)
    .Select(u => new { u.Id, u.Nombre })
    .ToList();
```

### Async/Await

```csharp
public async Task<List<Usuario>> ObtenerUsuariosAsync()
{
    using var client = new HttpClient();
    var response = await client.GetAsync("https://api.example.com/usuarios");
    return await response.Content.ReadFromJsonAsync<List<Usuario>>();
}
```

### Pattern Matching

```csharp
public string ObtenerDescripcion(object obj) => obj switch
{
    int i => $"Número entero: {i}",
    string s => $"Cadena: {s}",
    Usuario u => $"Usuario: {u.Nombre}",
    _ => "Tipo desconocido"
};
```

### Records (C# 9+)

```csharp
public record Usuario(int Id, string Nombre, string Email);

// Uso
var usuario = new Usuario(1, "Juan", "juan@example.com");
```

## NuGet Package Manager

Gestor de paquetes oficial de .NET.

```bash
# Instalar un paquete
dotnet add package Newtonsoft.Json

# Restaurar paquetes
dotnet restore

# Listar paquetes
dotnet list package
```

## CLI de .NET

### Comandos Básicos

```bash
# Crear nuevo proyecto
dotnet new console -n MiAplicacion
dotnet new webapi -n MiAPI
dotnet new mvc -n MiWebApp

# Compilar
dotnet build

# Ejecutar
dotnet run

# Publicar
dotnet publish -c Release

# Ejecutar tests
dotnet test
```

## Estructura de un Proyecto

```
MiProyecto/
├── Controllers/
├── Models/
├── Views/
├── wwwroot/
│   ├── css/
│   ├── js/
│   └── images/
├── appsettings.json
├── Program.cs
└── MiProyecto.csproj
```

## Inyección de Dependencias

.NET Core tiene inyección de dependencias integrada.

```csharp
// Registro de servicios
builder.Services.AddScoped<IUsuarioService, UsuarioService>();
builder.Services.AddSingleton<IConfiguration>(configuration);
builder.Services.AddTransient<IEmailService, EmailService>();

// Uso en un controlador
public class UsuariosController : ControllerBase
{
    private readonly IUsuarioService _usuarioService;
    
    public UsuariosController(IUsuarioService usuarioService)
    {
        _usuarioService = usuarioService;
    }
}
```

## Middleware Pipeline

```csharp
var app = builder.Build();

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.Run();
```

## Versiones de .NET

| Versión | Año | Tipo | Soporte hasta |
|---------|-----|------|---------------|
| .NET 6 | 2021 | LTS | Nov 2024 |
| .NET 7 | 2022 | STS | Mayo 2024 |
| .NET 8 | 2023 | LTS | Nov 2026 |
| .NET 9 | 2024 | STS | Mayo 2026 |

!!! info "Tipos de Soporte"
    - **LTS** (Long Term Support): 3 años de soporte
    - **STS** (Standard Term Support): 18 meses de soporte

## Herramientas de Desarrollo

### IDEs
- **Visual Studio**: IDE completo para Windows y macOS
- **Visual Studio Code**: Editor ligero multiplataforma
- **JetBrains Rider**: IDE multiplataforma de pago

### Extensiones Útiles
- C# Dev Kit (VS Code)
- ReSharper (Visual Studio)
- .NET Core Test Explorer

## Testing

### xUnit

```csharp
public class CalculadoraTests
{
    [Fact]
    public void Sumar_DosNumeros_RetornaResultadoCorrecto()
    {
        // Arrange
        var calculadora = new Calculadora();
        
        // Act
        var resultado = calculadora.Sumar(2, 3);
        
        // Assert
        Assert.Equal(5, resultado);
    }
}
```

### NUnit y MSTest
Alternativas populares a xUnit.

## Recursos de Aprendizaje

- [Documentación oficial de .NET](https://docs.microsoft.com/dotnet/)
- [Microsoft Learn](https://learn.microsoft.com/training/dotnet/)
- [.NET Blog](https://devblogs.microsoft.com/dotnet/)
- [C# Corner](https://www.c-sharpcorner.com/)
- [Stack Overflow - .NET Tag](https://stackoverflow.com/questions/tagged/.net)

## Comunidad

- [.NET Foundation](https://dotnetfoundation.org/)
- [GitHub - dotnet](https://github.com/dotnet)
- [Reddit - r/dotnet](https://reddit.com/r/dotnet)

---

!!! tip "Consejo"
    Mantente actualizado con las versiones LTS de .NET para proyectos de producción que requieren soporte a largo plazo.

!!! note "Nota"
    .NET 8 es la versión LTS más reciente y se recomienda para nuevos proyectos.
