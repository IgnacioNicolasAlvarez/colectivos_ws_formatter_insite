#!/bin/bash

ruta_script="/home/ina/Coding/colectivos_ws_formatter_insite/run_main.sh"
hora="17"
minuto="15"

linea_cron="${minuto} ${hora} * * * ${ruta_script}"

(crontab -l 2>/dev/null; echo "$linea_cron") | crontab -

echo "Se ha programado la ejecución de ${ruta_script} a las ${hora}:${minuto} todos los días."
echo "Puedes verificar la entrada en tu crontab con el comando: crontab -l"