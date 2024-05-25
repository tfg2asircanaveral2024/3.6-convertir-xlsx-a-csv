#!/bin/bash

# convertir los archivos XSLX en CSV
pwsh /script-pwsh.ps1 &> /dev/null

# en cada vuelta del bucle se recorre una ruta
IFS=','
for RUTA_XLSX in $RUTAS_XLSX
do

	# obtener la ruta absoluta de todos los archivos CSV convertidos
	FICHEROS=$(find $RUTA_XLSX -type f -name '*.csv')

	# mostrar el contenido de todos los archivos CSV
	IFS='
'
	for FICHERO in $FICHEROS
	do
		echo -e "----------------------\n${FICHERO}\n---------------------\n"
		cat $FICHERO
	done
	IFS=','
done
