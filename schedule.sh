#!/bin/bash

ruta_script="$PWD/run_main.sh"
hora="01"
minuto="00"

linea_cron="${minuto} ${hora} * * * ${ruta_script}  >> $PWD/colectivos_ws_formatter_insite.log 2>&1"

(crontab -l 2>/dev/null; echo "$linea_cron") | crontab -

echo "Se ha programado la ejecución de ${ruta_script} a las ${hora}:${minuto} todos los días."
echo "Puedes verificar la entrada en tu crontab con el comando: crontab -l"
