@echo off
echo ========================================
echo   Desplegando Documentacion a GitHub
echo ========================================
echo.

echo [1/3] Commiteando cambios...
git add .
git commit -m "Update documentation"
git push origin main

echo.
echo [2/3] Construyendo sitio con MkDocs...
mkdocs build

echo.
echo [3/3] Desplegando a GitHub Pages...
mkdocs gh-deploy

echo.
echo ========================================
echo   Despliegue Completado!
echo ========================================
echo.
echo Tu sitio estara disponible en unos minutos en:
echo https://TU_USUARIO.github.io/TU_REPOSITORIO/
echo.
pause
