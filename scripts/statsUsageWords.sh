#!/bin/bash

source lib.sh
test_file $# $1

# Las palabras filtradas se guardan
# en una variable.
PALABRAS_FILTRADAS=$(
# Itera sobre cada línea del archivo.
while read -r line; do
  # Itera sobre cada palabra de la línea.
  for word in $line; do
    # Filtra palabras con menos de cuatro caracteres.
    [ ${#word} -lt 4 ] && continue
    echo "$word"
  done
done < "${1}"
)

# Ordena las palabras alfabéticamente y muestra las diez más usadas.
echo "$PALABRAS_FILTRADAS" \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -10 \
  | tr -s ' ' \
  | cut -c 2-
