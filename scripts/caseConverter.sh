#!/bin/bash

source lib.sh
test_file $# $1

# Itera sobre cada línea cambiando mayúsculas a minúsculas y viceversa.
while read -r line; do
	echo "${line~~}"
done < "${1}"	
