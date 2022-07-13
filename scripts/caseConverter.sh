#! /bin/bah

#valida que el archivo este cargado

source lib.sh
test_file $# $1


#Itera sobre cada linea cambiando mayùsculas a minùsculas y viceversa

while read -r line
do
	echo "${line~~}"

done < "${1}"	
