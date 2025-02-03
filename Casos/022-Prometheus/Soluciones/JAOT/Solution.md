# Comandos para la realización del taller.
Comandos para la realización en Docker instalado en WSL.

## Descargamos las imagenes de Prometheus y Node Exporter
```bash
docker pull prom/prometheus
docker pull prom/node-exporter
```

## Arrancamos los contenedores
```bash
docker run --name prometheus -d -p 9090:9090 prom/prometheus
docker run --name node_exporter -d -p 9100:9100 prom/node-exporter
```

## Añadimos la configuración
Creamos el fichero **alert_rules.yml** y lo copiamos en la carpeta *etc/prometheus* del contenedor de Prometheus:
```bash
docker cp /ruta/en/tu/sistema/local prometheus:etc/prometheus
```

Modificamos el fichero *etc/prometheus/prometheus.yml* para añadir el scrape a Node Exporter y el fichero que contiene las reglas de las alarmas:
```bash
rule_files:
  - alert_rules.yml

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
  
  - job_name: "nodeExporter"
    scrape_interval: 5s
    static_configs:
      - targets: ["172.17.0.1:9100"]
```

Una vez añadida la configuración, reiniciamos el contenedor Prometheus.