#! /bin/bah

#valida que el archivo este cargado

source lib.sh
test_file $# $1

FILE=$(cat $1)

echo ${FILE~~} 
	
