#!/bin/bash

# Valida que el archivo exista.
source lib.sh
test_file $# $1

# Busca en el texto la cadena ingresada y la reemplaza ignorando acentos.
read -p "Ingrese cadena a buscar: "     CADENA1
read -p "Ingrese cadena de reemplazo: " CADENA2

sed 'y/ÁÉÍÓÚáéíóú/AEIOUaeiou/' $1 | sed "s/$CADENA1/$CADENA2/g"
