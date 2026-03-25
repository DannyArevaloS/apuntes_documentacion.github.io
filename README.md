# Documentación del Proyecto

Este es un proyecto de documentación técnica construido con MkDocs y Material Theme.

## 📚 Contenido

- **Salesforce**: Documentación sobre Salesforce y sus APIs
- **Java**: Recursos sobre Java y frameworks como Hibernate
- **.NET**: Guías y referencias sobre el ecosistema .NET

## 🚀 Inicio Rápido

### Requisitos Previos

- Python 3.8 o superior
- pip (gestor de paquetes de Python)

### Instalación

1. Instala las dependencias:

```bash
pip install -r requirements.txt
```

### Uso

#### Servidor de Desarrollo

Para iniciar el servidor de desarrollo local:

```bash
mkdocs serve
```

Luego abre tu navegador en `http://127.0.0.1:8000`

#### Construir el Sitio

Para generar el sitio estático:

```bash
mkdocs build
```

Los archivos generados estarán en la carpeta `site/`

#### Desplegar en GitHub Pages

```bash
mkdocs gh-deploy
```

## 📁 Estructura del Proyecto

```
.
├── docs/                  # Archivos de documentación
│   ├── index.md          # Página principal
│   ├── salesforce/       # Documentación de Salesforce
│   ├── java/             # Documentación de Java
│   ├── dotnet/           # Documentación de .NET
│   └── images/           # Imágenes
├── mkdocs.yml            # Configuración de MkDocs
├── requirements.txt      # Dependencias de Python
└── README.md            # Este archivo
```

## 🎨 Personalización

Edita el archivo [`mkdocs.yml`](mkdocs.yml:0) para personalizar:

- Nombre del sitio
- Tema y colores
- Navegación
- Plugins y extensiones

## 📝 Agregar Contenido

1. Crea archivos `.md` en la carpeta `docs/`
2. Actualiza la sección `nav` en [`mkdocs.yml`](mkdocs.yml:0)
3. Guarda y el servidor se recargará automáticamente

## 🔗 Enlaces Útiles

- [Documentación de MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Markdown Guide](https://www.markdownguide.org/)

## 🌐 Desplegar en GitHub Pages

### Método Rápido (3 pasos)

1. **Crear repositorio en GitHub** (público)

2. **Conectar y subir:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
   git push -u origin main
   ```

3. **Desplegar:**
   ```bash
   mkdocs gh-deploy
   ```

Tu sitio estará en: `https://TU_USUARIO.github.io/TU_REPOSITORIO/`

📖 **Guía completa:** Ver [`DEPLOY_GITHUB_PAGES.md`](DEPLOY_GITHUB_PAGES.md:0)

### Actualizar después de cambios

```bash
git add .
git commit -m "Update docs"
git push origin main
mkdocs gh-deploy
```

O simplemente ejecuta: `deploy.bat` (Windows)

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.
