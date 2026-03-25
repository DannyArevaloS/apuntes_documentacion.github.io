# 🚀 Desplegar en GitHub Pages

## Opción 1: Despliegue Automático con MkDocs (Recomendado)

### Paso 1: Crear Repositorio en GitHub

1. Ve a [GitHub](https://github.com) e inicia sesión
2. Haz clic en el botón **"New"** o **"+"** → **"New repository"**
3. Nombra tu repositorio (ejemplo: `mi-documentacion`)
4. Marca como **Public** (necesario para GitHub Pages gratuito)
5. **NO** inicialices con README (ya tienes uno)
6. Haz clic en **"Create repository"**

### Paso 2: Inicializar Git Local (si no lo has hecho)

Abre una terminal en la carpeta del proyecto y ejecuta:

```bash
git init
git add .
git commit -m "Initial commit - MkDocs documentation"
```

### Paso 3: Conectar con GitHub

Reemplaza `TU_USUARIO` y `TU_REPOSITORIO` con tus datos:

```bash
git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
git branch -M main
git push -u origin main
```

### Paso 4: Desplegar con MkDocs

Ejecuta este comando mágico:

```bash
mkdocs gh-deploy
```

¡Eso es todo! MkDocs automáticamente:
- Construye tu sitio
- Crea una rama `gh-pages`
- Sube los archivos a GitHub

### Paso 5: Configurar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Haz clic en **"Settings"** (Configuración)
3. En el menú lateral, haz clic en **"Pages"**
4. En **"Source"**, debería estar seleccionado:
   - Branch: `gh-pages`
   - Folder: `/ (root)`
5. Haz clic en **"Save"**

### Paso 6: Acceder a tu Sitio

Tu sitio estará disponible en:
```
https://TU_USUARIO.github.io/TU_REPOSITORIO/
```

⏱️ **Nota:** Puede tardar 1-5 minutos en estar disponible la primera vez.

---

## Opción 2: Despliegue Manual

Si prefieres más control:

### Paso 1: Construir el Sitio

```bash
mkdocs build
```

Esto crea la carpeta `site/` con todos los archivos HTML.

### Paso 2: Subir Manualmente

```bash
# Crear rama gh-pages
git checkout -b gh-pages

# Copiar contenido de site/ a la raíz
cp -r site/* .

# Agregar y commitear
git add .
git commit -m "Deploy documentation"

# Subir a GitHub
git push origin gh-pages

# Volver a main
git checkout main
```

---

## 🔄 Actualizar la Documentación

Cada vez que hagas cambios:

### Método Rápido (Recomendado)

```bash
# 1. Hacer cambios en tus archivos .md
# 2. Commitear cambios
git add .
git commit -m "Actualizar documentación"
git push origin main

# 3. Redesplegar
mkdocs gh-deploy
```

### Método con Script

Crea un archivo `deploy.sh`:

```bash
#!/bin/bash
echo "📝 Commiteando cambios..."
git add .
git commit -m "Update documentation"
git push origin main

echo "🚀 Desplegando a GitHub Pages..."
mkdocs gh-deploy

echo "✅ ¡Listo! Tu sitio se actualizará en unos minutos."
```

Hazlo ejecutable y úsalo:

```bash
chmod +x deploy.sh
./deploy.sh
```

---

## 🎯 Configuración Avanzada

### Dominio Personalizado

Si tienes un dominio propio:

1. En GitHub Settings → Pages → Custom domain
2. Ingresa tu dominio (ejemplo: `docs.midominio.com`)
3. Configura un registro CNAME en tu proveedor DNS apuntando a:
   ```
   TU_USUARIO.github.io
   ```

### Actualizar URL Base en mkdocs.yml

Si tu repositorio no es `TU_USUARIO.github.io`, agrega esto a `mkdocs.yml`:

```yaml
site_url: https://TU_USUARIO.github.io/TU_REPOSITORIO/
```

---

## ❓ Solución de Problemas

### Error: "remote origin already exists"

```bash
git remote remove origin
git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
```

### Error: "gh-pages branch not found"

```bash
mkdocs gh-deploy --force
```

### El sitio muestra 404

1. Verifica que la rama `gh-pages` existe
2. Espera 5 minutos
3. Verifica la configuración en Settings → Pages
4. Asegúrate de que el repositorio es público

### Los estilos no cargan

Agrega `site_url` en `mkdocs.yml`:

```yaml
site_url: https://TU_USUARIO.github.io/TU_REPOSITORIO/
```

---

## 📋 Checklist Completo

- [ ] Crear repositorio en GitHub
- [ ] Inicializar Git local (`git init`)
- [ ] Conectar con GitHub (`git remote add origin ...`)
- [ ] Hacer commit inicial (`git add . && git commit`)
- [ ] Subir a GitHub (`git push -u origin main`)
- [ ] Desplegar con MkDocs (`mkdocs gh-deploy`)
- [ ] Configurar GitHub Pages (Settings → Pages)
- [ ] Esperar 1-5 minutos
- [ ] Visitar tu sitio
- [ ] ¡Celebrar! 🎉

---

## 🔗 Enlaces Útiles

- [Documentación de GitHub Pages](https://docs.github.com/pages)
- [MkDocs Deployment](https://www.mkdocs.org/user-guide/deploying-your-docs/)
- [Material for MkDocs Publishing](https://squidfunk.github.io/mkdocs-material/publishing-your-site/)

---

**¿Necesitas ayuda?** Revisa los logs con:
```bash
mkdocs gh-deploy --verbose
```
