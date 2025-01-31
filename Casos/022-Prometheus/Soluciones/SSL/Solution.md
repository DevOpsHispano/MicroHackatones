# Comandos para la realización del taller.

## Creamos carpeta de proyecto y añadimos configuración de Prometheus
```bash
mkdir PrometheusHK
cd PrometheusHK/
nano prometheus.yml
docker network create monitoring2
docker run -d --name=node_exporter -p 9100:9100 --network monitoring2 prom/node-exporter
sudo docker run -d --name=prometheus -p 9090:9090 --network monitoring2 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```

## Para los que trabajan con WSL, necesitamos saber la IP de WSL y usarla en la configuración de Prometheus en lugar de localhost
```bash
ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1
curl http://172.27.164.211:9100/metrics
```

## Añadimos configuración del Alert Rule al archivo de configuración de Prometheus y creamos la config para Alert Rules. 
```bash
nano prometheus.yml
nano alert_rules.yml
docker stop prometheus
docker rm prometheus
sudo docker run -d --name=prometheus -p 9090:9090 --network monitoring2 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -v $(pwd)/alert_rules.yml:/etc/prometheus/alert_rules.yml prom/prometheus
```

## Instalamos la herramienta de stress para forzar la CPU por encima del umbral de la alerta.
```bash
sudo apt update && sudo apt install -y stress
sudo apt install stress-ng
stress-ng --cpu $(nproc) --cpu-load 95 --timeout 120
```
