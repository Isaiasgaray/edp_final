#! /bin/bash

source lib.sh
test_file $# $1

# Filtra las palabras y elimina las repeticiones
grep -E "\b[A-ZÁÉÍÓÚ]+\b" "${1}" | sort -u

