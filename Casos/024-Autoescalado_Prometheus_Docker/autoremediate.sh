#!/bin/bash

container_name=$1
log_file="./container_restart.log"

attempts=0
max_attempts=3
wait_times=(60 300 600)  # Espera 1 min, 5 min, 10 min

echo "$(date) - Alerta de alto uso de memoria. Iniciando remediación para contenedor: $container_name" >> $log_file

while [ $attempts -lt $max_attempts ]; do
    echo "$(date) - Intento $(($attempts + 1)): Reiniciando contenedor $container_name..." >> $log_file
    docker restart "$container_name"

    sleep 30

    if [ "$(docker inspect -f '{{.State.Running}}' "$container_name")" == "true" ]; then
        echo "$(date) - Contenedor $container_name reiniciado con éxito." >> $log_file
        exit 0
    fi

    echo "$(date) - Falló el reinicio del contenedor $container_name." >> $log_file

    sleep ${wait_times[$attempts]}
    attempts=$((attempts + 1))
done

echo "$(date) - El contenedor $container_name no se pudo recuperar tras $max_attempts intentos. Escalando alerta." >> $log_file
