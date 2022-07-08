#!/bin/bash

source lib.sh
test_file $# $1

# Detecta líneas vacías mediante una expresión regular.
# Luego con una opción de grep las cuenta.
grep -c "^$" ${1}
