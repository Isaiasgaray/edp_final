#!/bin/bash

# Consideramos a la 'y' como consonante.

# Crea un string con las letras del alfabeto.
abc=$(echo {a..z})
abc=$(echo ${abc//\ /})

# String de vocales.
vowels="aeiou"

# String vacío que será una expresión regular.
regex=""

# Se itera sobre cada vocal para crear una expresión regular.
for vowel in {a,e,i,o,u}; do
  regex="$regex\b[$(echo $abc | sed "s/[${vowels/$vowel/}]//g")]{4,}\b|"
done

# Se filtran las letras con tildes y se muestran las palabras
# con una única vocal.
sed 'y/ÁÉÍÓÚáéíóú/AEIOUaeiou/' "${1}" | grep -oE $(echo "${regex%?}") | sort -u
