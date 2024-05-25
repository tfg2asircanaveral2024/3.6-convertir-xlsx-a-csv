# obtiene los ficheros con extensión XLSX de las rutas indicadas en la variable de entorno 
# RUTAS_XLSX, separadas por comas, y los convierte a CSV, dejándolos en la misma ruta

foreach ($RUTA_XLSX in ($env:RUTAS_XLSX -split ',')) {
	# si la ruta no existe o no es un directorio, se continua con la siguiente
	if (-not (Test-Path $RUTA_XLSX -PathType Container)) {
		continue
	}

	foreach ($FICHERO in (Get-ChildItem -Path $RUTA_XLSX/*.xlsx)) {
		Import-Excel -Path $FICHERO.fullname -Worksheet "Hoja1" `
				-WarningAction SilentlyContinue |
			ConvertTo-Csv | Out-File "$RUTA_XLSX/$($FICHERO.basename).csv"
	}
}
