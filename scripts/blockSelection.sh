#!/bin/bash

source lib.sh
test_file $# $1

FILE="${1}"

read -p "Seleccione párrafos u oraciones [O|p]: " OPT

# Si el usuario no ingresó una opción se setea la variable a 'o'.
# Si el usuario ingresó algo solo se toma el primer caracter del string.
if [ -z $OPT ]; then
  OPT="o"
else
  OPT=${OPT::1}
fi

function parrafos {
  # Caso párrafo, hasta un punto y aparte.
  # Cantidad de párrafos
  CANT_PARR=$(sed '/^$/d' $FILE | grep -c '\.$')
  
  # Si hay menos de dos párrafos se imprime el archivo completo.
  if [ $CANT_PARR -lt 2 ]; then
    cat $FILE
    exit 0
  fi

  # Si hay mas de dos párrafos el usuario puede elegir cuál imprimir.
  echo "Hay $CANT_PARR párrafos disponibles"
  read -p "Seleccione un número de párrafo: " N
  sed '/^$/d' $FILE | sed -n "${N}p"
}

function oraciones {
  # Caso oración, hasta un punto.
  # Función análoga a `parrafos`
  CANT_ORAC=$(sed '/^$/d; s/\. /.\n/g' $FILE | wc -l)

  if [ $CANT_ORAC -lt 2 ]; then
    cat $FILE
    exit 0
  fi

  echo "Hay $CANT_ORAC oraciones disponibles"
  read -p "Seleccione un número de oración: " N

  sed '/^$/d; s/\. /.\n/g' $FILE  | sed -n "${N}p"
}

if [ ${OPT,,} = "o" ]; then
  oraciones
elif [ ${OPT,,} = "p" ]; then
  parrafos
fi
