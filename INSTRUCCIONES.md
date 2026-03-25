# 📖 Instrucciones de Uso - MkDocs

## ⚡ Inicio Rápido

### 1. Instalar Dependencias

Abre una terminal en la carpeta del proyecto y ejecuta:

```bash
pip install -r requirements.txt
```

### 2. Iniciar el Servidor Local

```bash
mkdocs serve
```

Abre tu navegador en: **http://127.0.0.1:8000**

El servidor se recargará automáticamente cuando hagas cambios en los archivos.

### 3. Construir el Sitio para Producción

```bash
mkdocs build
```

Esto generará el sitio estático en la carpeta `site/`

## 📝 Cómo Editar la Documentación

### Editar Páginas Existentes

1. Ve a la carpeta `docs/`
2. Abre el archivo `.md` que quieras editar
3. Haz tus cambios usando Markdown
4. Guarda el archivo
5. El navegador se actualizará automáticamente (si tienes `mkdocs serve` corriendo)

### Agregar Nueva Página

1. Crea un nuevo archivo `.md` en la carpeta correspondiente dentro de `docs/`
2. Escribe tu contenido en Markdown
3. Abre el archivo `mkdocs.yml`
4. Agrega tu nueva página en la sección `nav`:

```yaml
nav:
  - Inicio: index.md
  - Mi Nueva Sección:
      - Mi Página: mi-seccion/mi-pagina.md
```

### Agregar Imágenes

1. Coloca la imagen en `docs/images/`
2. Referencia la imagen en tu archivo Markdown:

```markdown
![Descripción](../images/nombre-imagen.png)
```

## 🎨 Personalizar el Sitio

Edita el archivo `mkdocs.yml` para cambiar:

- **Nombre del sitio**: `site_name`
- **Colores del tema**: `theme.palette`
- **Navegación**: `nav`
- **Características**: `theme.features`

## 📚 Sintaxis Markdown Útil

### Títulos
```markdown
# Título 1
## Título 2
### Título 3
```

### Listas
```markdown
- Item 1
- Item 2
  - Sub-item
```

### Enlaces
```markdown
[Texto del enlace](https://ejemplo.com)
```

### Código
````markdown
```python
def hola():
    print("Hola Mundo")
```
````

### Tablas
```markdown
| Columna 1 | Columna 2 |
|-----------|-----------|
| Dato 1    | Dato 2    |
```

### Notas y Advertencias
```markdown
!!! note "Nota"
    Este es un mensaje informativo

!!! warning "Advertencia"
    Este es un mensaje de advertencia

!!! tip "Consejo"
    Este es un consejo útil
```

## 🚀 Desplegar en GitHub Pages

1. Asegúrate de tener un repositorio Git inicializado
2. Ejecuta:

```bash
mkdocs gh-deploy
```

Esto construirá el sitio y lo publicará en la rama `gh-pages`

## 🔧 Comandos Útiles

| Comando | Descripción |
|---------|-------------|
| `mkdocs serve` | Inicia servidor de desarrollo |
| `mkdocs build` | Construye el sitio estático |
| `mkdocs gh-deploy` | Despliega en GitHub Pages |
| `mkdocs --version` | Muestra la versión de MkDocs |

## 📁 Estructura de Carpetas

```
proyecto/
├── docs/                    # Todo el contenido va aquí
│   ├── index.md            # Página principal
│   ├── salesforce/         # Sección Salesforce
│   │   ├── index.md
│   │   └── api.md
│   ├── java/               # Sección Java
│   │   ├── index.md
│   │   └── hibernate.md
│   ├── dotnet/             # Sección .NET
│   │   └── index.md
│   └── images/             # Imágenes
│       └── ApiSF.png
├── mkdocs.yml              # Configuración principal
├── requirements.txt        # Dependencias Python
└── README.md              # Documentación del proyecto
```

## ❓ Solución de Problemas

### Error: "mkdocs: command not found"
Instala MkDocs:
```bash
pip install mkdocs mkdocs-material
```

### El servidor no se actualiza automáticamente
Detén el servidor (Ctrl+C) y vuelve a iniciarlo:
```bash
mkdocs serve
```

### Las imágenes no se muestran
Verifica que la ruta sea correcta y relativa a la ubicación del archivo `.md`

## 📖 Recursos Adicionales

- [Documentación oficial de MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
- [Guía de Markdown](https://www.markdownguide.org/basic-syntax/)
- [Emojis en Markdown](https://gist.github.com/rxaviers/7360908)

---

**¡Listo para empezar! 🎉**

Ejecuta `mkdocs serve` y comienza a editar tu documentación.
