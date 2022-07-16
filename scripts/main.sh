#!/bin/bash

# Cambia el prompt del select.
PS3="> "

# Archivo de texto a analizar.
FILE=$(ls *.txt)

# Prepara la lista de scripts.
LIST=$(ls *.sh | grep -vE "(lib\.sh|main\.sh)")
LIST="$LIST Exit"

select opt in $LIST; do
  case $opt in
    *.sh) bash $opt $FILE          ;;
    Exit|q) exit 0                 ;;
    *)    echo "Opción inválida"   ;;
  esac
done
