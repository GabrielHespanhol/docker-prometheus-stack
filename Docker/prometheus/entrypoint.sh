#!/bin/sh

if [ -z "$RETENTION_TIME" ]; then
    echo "storage.tsdb.retention.time não definido!"
    echo "Aplicando o valor padrão de 15d para storage.tsdb.retention.time"
    export RETENTION_TIME=15d
else
    echo "storage.tsdb.retention.time definido com o valor de: $RETENTION_TIME"
fi

/etc/prometheus/prometheus --config.auto-reload-interval=60s \
         --storage.tsdb.retention.time=$(expr $RETENTION_TIME)