#!/bin/bash

source lib.sh
test_file $# $1

LONGEST=""
SHORTEST=""

while read -r line; do
  for word in $line; do
    # Si la variable SHORTEST está vacía se o si 
    # la variable word tiene menos caracteres que SHORTEST
    # le asigna el valor de word a SHORTEST
    if [ -z "$SHORTEST" ] || [ "${#word}" -lt "${#SHORTEST}" ]; then
      SHORTEST="$word"
    fi

    # Si la variable word tiene más caracteres que
    # LONGEST se le asigna el valor de word a LONGEST
    if [ "${#word}" -gt "${#LONGEST}" ]; then
      LONGEST="$word"
    fi
  done
done < "${1}"

# Se divide la cantidad de caracteres por la cantidad de palabras
# del archivo para obtener el promedio de longitud de palabras.
PROMEDIO=$(echo "scale = 2; $(wc -m < $1) / $(wc -w < $1)" | bc)

# Se imprimen en pantalla los resultados.
echo "$PROMEDIO"
echo "$LONGEST"
echo "$SHORTEST"
<<<<<<< HEAD
=======

>>>>>>> aeac51a887cc22684aa62347d0a33c6e7bf3e1e5
