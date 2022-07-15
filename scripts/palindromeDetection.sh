#!/bin/bash

#Valida la existencia del archivo
source lib.sh
test_file $# $1

# Función auxiliar para detectar palíndromos.
function es_palindromo {
  [ "${1,,}" = $(echo ${1,,} | rev) ]
}

# Filtra palabras que tenga tres caractres o más.
FILE=$(grep -oE "\b[a-zA-Z]{3,}\b" ${1})

# Si hay algún caracter con tilde en el archivo, filtra todas las tildes.
if echo $FILE | grep -iq "[áéíóú]"; then
  FILE=$(echo $FILE | sed 'y/ÁÉÍÓÚáéíóú/AEIOUaeiou/')
fi

# Itera sobre cada palabra, si la palabra es un
# palíndromo la imprime.
for word in $(echo $FILE); do
  if es_palindromo $word; then
    echo $word
  fi
done
