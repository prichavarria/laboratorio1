#!/bin/bash 

#Comprueba si hay un archvo como argumento
if [ $# -eq 0 ] ; then
    echo "Error, debes proporcionar un archivo como argumento."
    exit 1
fi

#Almacenar el nombre del archivo
file=$1


#Verifica si el archivo existe
if [ ! -e "$file" ]; then
    echo "Error, el archivo $file no existe."
    exit 2
fi

#Permisos del archivo con el comando 'stat'
permissions=$(stat -c "%A" "$file")

#Funcion para obtener los Permisos
get_permissions_verbose() {
    local permString=$1

    userPerm=${permString:1:3}
    groupPerm=${permString:4:3}
    otherPerm=${permString:7:3}

    #Compara permisos del usuario

    echo -e "Permisos del usuario:\n"
    if [ "${userPerm:0:1}" == "r" ]; then
        echo "Lectura: Permitida"
    else
        echo "Lectura: Denegada"
    fi

    if [ "${userPerm:1:1}" == "w" ]; then
        echo "Escritura: Permitida"
    else
        echo "Escritura: Denegada"
    fi

    if [ "${userPerm:2:1}" == "x" ]; then
        echo -e "Ejecucion: Permitida\n"
    else
        echo -e "Ejecucion: Denegada\n"
    fi


    #Compara permisos del grupo

    echo -e "Permisos del grupo:\n"
    if [ "${groupPerm:0:1}" == "r" ]; then
        echo "Lectura: Permitida"
    else
        echo "Lectura: Denegada"
    fi

    if [ "${groupPerm:1:1}" == "w" ]; then
        echo "Escritura: Permitida"
    else
        echo "Escritura: Denegada"
    fi

    if [ "${groupPerm:2:1}" == "x" ]; then
        echo -e "Ejecucion: Permitida\n"
    else
        echo -e "Ejecucion: Denegada\n"
    fi


    #Compara permisos de otros usuarios

    echo   -e "Permisos de otros usuarios:\n"
    if [ "${otherPerm:0:1}" == "r" ]; then
        echo "Lectura: Permitida"
    else
        echo "Lectura: Denegada"
    fi

    if [ "${otherPerm:1:1}" == "w" ]; then
        echo "Escritura: Permitida"
    else
        echo "Escritura: Denegada"
    fi

    if [ "${otherPerm:2:1}" == "x" ]; then
        echo -e "Ejecucion: Permitida\n"
    else
        echo -e "Ejecucion: Denegada\n"
    fi

}


echo -e "Permisos del archivo $file:\n"
get_permissions_verbose "$permissions"