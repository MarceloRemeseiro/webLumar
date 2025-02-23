#!/bin/bash

# Nombres fijos
REPOSITORIO="weblumar"
SCRIPT_DIR="/Developer/$REPOSITORIO"

# Asegurarse de que estamos en el directorio correcto
cd $SCRIPT_DIR || exit 1

# Inicializar git si no existe
if [ ! -d .git ]; then
    echo "Inicializando repositorio git..."
    git init
    git remote add origin https://github.com/MarceloRemeseiro/${REPOSITORIO}.git
fi

# Actualizar el código fuente
echo "Actualizando el código fuente desde Git..."
if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "Error: El token de GitHub no está configurado."
    exit 1
fi

# Configurar git y hacer pull
git config --global credential.username marceloremeseiro
git pull https://marceloremeseiro:${GITHUB_TOKEN}@github.com/MarceloRemeseiro/${REPOSITORIO}.git main

# Detener y reconstruir los contenedores con docker-compose
echo "Reconstruyendo y reiniciando los contenedores..."
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# Limpiar imágenes sin usar
echo "Limpiando imágenes sin usar..."
docker image prune -f

echo "Actualización completada y contenedor reiniciado."
