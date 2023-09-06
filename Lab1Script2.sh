#!/bin/bash

#Recibe nombre de usuario y nombre de grupo
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombreUsuario> <nombreGrupo>"
    exit 1
fi

nombreUsuario=$1
nombreGrupo=$2

#Comprobar si existe nombre de usuario
if id "$nombreUsuario" &>/dev/null; then
    echo  "El usuario $nombreUsuario ya existe."
else
    if sudo useradd "$nombreUsuario" &>/dev/null; then
        echo "Se ha creado el usuario $nombreUsuario."
    fi
fi

#Comprobar si existe nombre deL grupo
if grep -q "$nombreGrupo" /etc/group; then
    echo "El grupo $nombreGrupo ya existe."
else 
    sudo groupadd "$nombreGrupo"
    echo "Se ha creado el grupo $nombreGrupo."
fi

#Agregar usuarios al grupo
sudo usermod -aG "$nombreGrupo" "prichavarria"
sudo usermod -aG "$nombreGrupo" "$nombreUsuario"

echo "El usuario $nombreUsuario ha sido agregado al grupo $nombreGrupo."