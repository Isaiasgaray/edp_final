#!/bin/bash

function err {
  # Envia mensajes al stderr.
  echo "$1" 1>&2
}

function file_err {
  # Mensaje de error genérico para funciones
  # que necesitan un archivo como input.
  err "Usage: ./$0 file.txt"
  exit 1
}

function test_file {
  # Valida que la función reciba al menos un argumento
  # y que ese primer argumento sea un archivo de texto
  # con permisos de lectura.
  if [ $1 -eq 0 ] || [ ! -f $2 ] || [ ! -r $2 ]; then
    file_err
  fi
}
