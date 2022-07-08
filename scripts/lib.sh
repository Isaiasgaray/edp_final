#!/bin/bash

function err {
  # Envia mensajes al stderr.
  echo "$1" 1>&2
}

function no_file {
  # Si no hay archivos de entrada devuelve 1.
  ! [ $1 -eq 0 ]
}

function no_file_err {
  # Mensaje de error genérico para funciones
  # que necesitan un archivo como input.
  err "Usage: ./$0 file.txt"
  exit 1
}
