#!/bin/bash

source lib.sh
test_file $# $1

# Reemplaza los saltos de línea del archivo por espacios
# en blanco y los guarda en una variable.
SENTENCES=$(tr '\n' ' ' < ${1})

# Reemplaza los puntos seguidos de un espacio por un
# salto de línea. Luego con awk se computan los resultados.
echo -e ${SENTENCES//\. /\\n} \
  | awk '{TOTAL += length()}; # Se declara la variable que almacena el total de caracteres.
         NR == 1 {LONGEST = $0; SHORTEST = $0}; # Se declaran las variables para las oraciones.
         /^\s*$/ {next}; # Si la línea está vacía o solo espacios, se ignora.
         length($0) > length(LONGEST) {LONGEST = $0; next};   
         length($0) < length(SHORTEST) {SHORTEST = $0; next}; 
         END {printf "%.1f\n%s\n%s\n", TOTAL / NR, LONGEST, SHORTEST} # Se muestran los resultados'
