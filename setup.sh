#!/bin/bash

set -e

# Instalar Hugo y Make si no están instalados
if ! command -v hugo &> /dev/null; then
    apt-get update
    apt-get install -y hugo
fi

if ! command -v make &> /dev/null; then
    apt-get update
    apt-get install -y make
fi

# Limpiar directorio dist si existe previamente
if [ -d "./dist" ]; then
    rm -rf "./dist"
fi

# Ejecutar make build
make build

# Verificar que el directorio dist existe después de la construcción
if [ ! -d "./dist" ]; then
    echo "Error: El directorio ./dist no fue creado correctamente."
    exit 1
fi

# Finalizar con éxito
echo "El sitio web fue generado exitosamente en ./dist."
exit 0

