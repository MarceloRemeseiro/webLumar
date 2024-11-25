#!/bin/bash

# Nombres fijos
REPOSITORIO="weblumar"
CONTAINER_NAME=weblumar
IMAGE_NAME=weblumar
PORT=1010:8080
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

# Resto del script para Docker
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Deteniendo y eliminando el contenedor actual..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

if [ $(docker images -q $IMAGE_NAME) ]; then
    echo "Eliminando la imagen Docker..."
    docker rmi $IMAGE_NAME
fi

# Reconstruir la imagen Docker
echo "Construyendo la nueva imagen Docker..."
docker build -t $IMAGE_NAME .

# Iniciar el nuevo contenedor
echo "Iniciando el nuevo contenedor..."
docker run -d --name $CONTAINER_NAME --restart=always -p $PORT $IMAGE_NAME

# Limpiar imágenes
echo "Limpiando imágenes sin usar..."
docker image prune -f

echo "Actualización completada y contenedor reiniciado."
