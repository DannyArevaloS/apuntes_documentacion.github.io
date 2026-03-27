# Power Apps

## Introducción a Power Apps

Power Apps es una plataforma de desarrollo de aplicaciones de bajo código (low-code) de Microsoft que permite crear aplicaciones empresariales personalizadas sin necesidad de ser un desarrollador experto.

## ¿Qué es Power Apps?

Power Apps forma parte de Microsoft Power Platform y permite:

- **Creación rápida**: Desarrollar aplicaciones en días u horas en lugar de semanas o meses
- **Low-code / No-code**: Diseñar aplicaciones con una interfaz visual de arrastrar y soltar
- **Integración**: Conectarse con cientos de fuentes de datos y servicios
- **Multiplataforma**: Ejecutar aplicaciones en web, iOS y Android

## Tipos de Aplicaciones en Power Apps

### Canvas Apps (Aplicaciones de Lienzo)

Aplicaciones completamente personalizables donde el desarrollador controla la interfaz:

- **Control total del diseño**: Posiciona cada elemento libremente en el lienzo
- **Múltiples fuentes de datos**: Conecta con SharePoint, Excel, SQL Server, y más
- **Fórmulas similares a Excel**: Usa expresiones familiares para definir la lógica

```text
// Ejemplo de fórmula en Power Apps
If(TextInput1.Text = "", "Por favor ingresa un valor", TextInput1.Text)

// Filtrar una colección
Filter(Clientes, Ciudad = "Madrid")

// Navegar entre pantallas
Navigate(Pantalla2, ScreenTransition.Fade)
```

### Model-Driven Apps (Aplicaciones Basadas en Modelo)

Aplicaciones basadas en el modelo de datos de Microsoft Dataverse:

- **Diseño basado en datos**: La interfaz se genera automáticamente desde el modelo de datos
- **Componentes estándar**: Formularios, vistas y paneles preconstruidos
- **Lógica de negocio**: Reglas de negocio, flujos de proceso y complementos

### Power Pages (antes Power Apps Portals)

Sitios web externos accesibles para usuarios sin licencia de Power Apps:

- **Portales públicos**: Accesibles para usuarios externos
- **Autenticación**: Soporte para múltiples proveedores de identidad
- **Integración con Dataverse**: Acceso seguro a datos empresariales

## Microsoft Dataverse

Base de datos en la nube diseñada específicamente para Power Apps:

- **Tablas estándar**: Contactos, Cuentas, Actividades y más
- **Tablas personalizadas**: Crea tus propias entidades de negocio
- **Seguridad basada en roles**: Control granular de acceso a datos
- **Lógica integrada**: Reglas de negocio y validaciones a nivel de datos

## Power Fx

Lenguaje de fórmulas de bajo código utilizado en Power Apps:

```text
// Concatenar texto
Concatenate("Hola, ", NombreUsuario, "!")

// Suma condicional
Sum(Filter(Ventas, Año = 2024), Importe)

// Crear una colección
ClearCollect(MiColeccion, {Nombre: "Ana", Edad: 30}, {Nombre: "Luis", Edad: 25})

// Actualizar un registro
Patch(Clientes, LookUp(Clientes, ID = 1), {Ciudad: "Sevilla"})
```

## Conectores

Power Apps incluye más de 900 conectores para integrarse con servicios externos:

### Conectores Estándar
- SharePoint
- Excel Online
- Microsoft Teams
- Outlook
- OneDrive

### Conectores Premium
- SQL Server
- Salesforce
- Dynamics 365
- Azure Blob Storage
- HTTP con Azure AD

### Conectores Personalizados
Crea tus propios conectores para APIs propias o de terceros mediante OpenAPI (Swagger).

## Componentes Principales de una Canvas App

### Pantallas (Screens)
Cada pantalla representa una vista dentro de la aplicación.

### Controles
Elementos de interfaz de usuario disponibles:

| Control | Descripción |
|---------|-------------|
| TextInput | Campo de entrada de texto |
| Button | Botón de acción |
| Gallery | Muestra una lista de elementos |
| Form | Formulario para ver/editar registros |
| DataTable | Tabla de datos |
| ComboBox | Lista desplegable con búsqueda |
| DatePicker | Selector de fecha |
| Toggle | Interruptor de activar/desactivar |

### Propiedades
Cada control tiene propiedades que puedes configurar con fórmulas:

```text
// Propiedad Items de una galería
Filter(Productos, Categoria = DropdownCategorias.Selected.Value)

// Propiedad Visible de un botón
!IsBlank(TextInputNombre.Text)

// Propiedad Color de un label
If(Puntuacion.Value >= 7, Color.Green, Color.Red)
```

## Integración con Power Platform

Power Apps se integra nativamente con el resto de Power Platform:

### Power Automate
Automatiza flujos de trabajo que se activan desde Power Apps:

```text
// Llamar a un flujo desde Power Apps
MiFlujo.Run(TextInput1.Text, DatePicker1.SelectedDate)
```

### Power BI
Incrusta informes de Power BI directamente en aplicaciones Power Apps.

### Power Virtual Agents
Integra chatbots inteligentes dentro de las aplicaciones.

## Publicación y Distribución

### Compartir una Aplicación
- Comparte con usuarios individuales o grupos de seguridad
- Define permisos: Solo usar o Coeditar

### Entornos
Organiza las aplicaciones por entornos (Desarrollo, Pruebas, Producción):

- **Entorno Predeterminado**: Para uso personal y pruebas
- **Entornos Sandbox**: Para desarrollo y testing
- **Entornos de Producción**: Para aplicaciones en producción

### Soluciones
Empaqueta aplicaciones, flujos y tablas para transportarlas entre entornos:

```text
Solución
├── Aplicaciones Canvas
├── Aplicaciones Basadas en Modelo
├── Tablas de Dataverse
├── Flujos de Power Automate
└── Conectores Personalizados
```

## Licenciamiento

| Plan | Descripción |
|------|-------------|
| Power Apps per App | Licencia por aplicación y usuario |
| Power Apps per User | Acceso ilimitado a todas las aplicaciones |
| Microsoft 365 | Incluye capacidades limitadas de Power Apps |
| Dynamics 365 | Incluye Power Apps para aplicaciones de modelo |

## Buenas Prácticas

### Nomenclatura
- Usa prefijos para los controles: `txt` para TextInput, `btn` para botones, `gal` para galerías
- Ejemplo: `txtNombreCliente`, `btnGuardar`, `galProductos`

### Rendimiento
- Habilita la **delegación** para filtrar datos en el servidor, no en el cliente
- Usa `Concurrent()` para cargar datos en paralelo
- Limita el uso de `OnStart` solo para datos críticos de la aplicación

### Mantenimiento
- Documenta las fórmulas complejas con comentarios (`//`)
- Usa variables globales con moderación; prefiere variables de contexto
- Organiza los controles en grupos lógicos

## Herramientas de Desarrollo

### Power Apps Studio
Editor visual principal disponible en:
- **Web**: [make.powerapps.com](https://make.powerapps.com)
- **Desktop**: Aplicación de escritorio para Windows

### Power Apps CLI (pac)
Herramienta de línea de comandos para administrar soluciones:

```bash
# Instalar Power Apps CLI
npm install -g @microsoft/powerapps-cli

# Autenticarse
pac auth create --url https://org.crm.dynamics.com

# Exportar una solución
pac solution export --path ./soluciones --name MiSolucion

# Importar una solución
pac solution import --path ./soluciones/MiSolucion.zip
```

### Monitor
Herramienta de diagnóstico integrada para depurar aplicaciones en tiempo real.

## Recursos de Aprendizaje

- [Documentación oficial de Power Apps](https://learn.microsoft.com/es-es/power-apps/)
- [Microsoft Learn - Power Apps](https://learn.microsoft.com/es-es/training/powerplatform/power-apps)
- [Power Apps Community](https://powerusers.microsoft.com/t5/Power-Apps-Community/ct-p/PowerApps1)
- [Power Apps YouTube Channel](https://www.youtube.com/c/mspowerapps)

---

!!! tip "Consejo"
    Comienza con una Canvas App conectada a una lista de SharePoint o una tabla de Excel para aprender los conceptos básicos de Power Apps de forma rápida y sin necesidad de configurar una base de datos.

!!! info "Información"
    Power Apps forma parte de **Microsoft Power Platform**, junto con Power Automate, Power BI y Power Virtual Agents. Integrar estas herramientas permite construir soluciones empresariales completas con bajo código.
