#!/bin/bash

# Nombres fijos
REPOSITORIO="lumar"
CONTAINER_NAME=lumar # Nombre del contenedor
IMAGE_NAME=lumar # Nombre de la imagen
PORT=1010:8080  # Puerto de la aplicación
SCRIPT_DIR=$(dirname "$0")  # Obtiene el directorio del script

# Actualizar el código fuente
echo "Actualizando el código fuente desde Git..."
cd $SCRIPT_DIR
if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "Error: El token de GitHub no está configurado."
    exit 1
fi

# Usa el usuario y token directamente en la URL del repositorio
git config --local credential.username marceloremeseiro
git pull https://marceloremeseiro:${GITHUB_TOKEN}@github.com/MarceloRemeseiro/${REPOSITORIO}.git

# Verifica si el contenedor está corriendo y detenerlo si es necesario
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Deteniendo y eliminando el contenedor actual..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
else
    echo "No existe el contenedor $CONTAINER_NAME, se creará uno nuevo."
fi

# Verificar si la imagen existe y eliminarla si es necesario
if [ $(docker images -q $IMAGE_NAME) ]; then
    echo "Eliminando la imagen Docker..."
    docker rmi $IMAGE_NAME
else
    echo "No existe la imagen $IMAGE_NAME, se creará una nueva."
fi


# Reconstruir la imagen Docker
echo "Construyendo la nueva imagen Docker..."
docker build -t $IMAGE_NAME .

# Iniciar el nuevo contenedor
echo "Iniciando el nuevo contenedor..."
docker run -d --name $CONTAINER_NAME --restart=always -p $PORT $IMAGE_NAME

# Limpiar imágenes "dangling"
echo "Limpiando imágenes sin usar..."
docker image prune -f

echo "Actualización completada y contenedor reiniciado."
