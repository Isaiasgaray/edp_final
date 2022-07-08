#!/bin/bash

source lib.sh
test_file $# $1

# Encuentra las palabras que empiezen con una
# mayúscula seguida de almenos una minúscula.
grep -oE "[A-Z][a-z]+" ${1} | sort -u
