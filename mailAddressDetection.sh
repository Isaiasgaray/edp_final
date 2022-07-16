#! /bin/bash

source lib.sh
test_file $# $1

# Regex para validar un mail.
EMAIL_VALIDO="[a-zA-Z0-9._-]{3,}@[a-z]{3,}\.[a-z]{2,}"

# Se usa la expresion regular y se omiten las repeticiones
# en el resultado final.
grep -oE "$EMAIL_VALIDO" "${1}" | sort -u


