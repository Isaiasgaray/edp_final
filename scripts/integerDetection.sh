#! /bin/bash

source lib.sh
test_file $# $1

# Se filtran los numeros y luego se ordenan
# de menor a mayor

grep -oE "\-?[0-9,\.]+" "${1}" \
	| grep -E "^\-?[0-9]+$" \
	| sort -un

