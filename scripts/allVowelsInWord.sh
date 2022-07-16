#! /bin/bash

source lib.sh
test_file $# $1

# Primer filtro. se quedan las palabras que tienen al menos
# cinco caracteres
WORDS=$(grep -oE "[a-zA-Z]{5,}" "${1}")

# Itera sobre las vocales para filtrar las palabras
for vowel in {aá,eé,ií,oó,uú}; do
   WORDS=$(echo "$WORDS" | grep -i "[$vowel]")
done

# Si la variable está vacia despues del filtrado,
# sale del script
[ -z "$WORDS" ] && exit 0

# Ordena y formatea la salida final
echo $WORDS \
	| tr ' ' '\n' \
	| sort \
	| uniq -c \
	| sed -E 's/^ * 1 //; s/^ *([0-9]+) (.*)/\2 (\1)/'

	 


