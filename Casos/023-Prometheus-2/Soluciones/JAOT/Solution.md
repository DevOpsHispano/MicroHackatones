# Comandos para la realización del taller.
Comandos para la realización en Docker instalado en WSL.

## INSTALACION GRAFANA
Descargamos imagen docker de Grafana:
```bash
docker pull grafana/grafana
```
Arrancamos el contenedor:
```bash
docker run -d --name=grafana -p 3000:3000 --network=host grafana/grafana
```
Abrimos navegador, http://localhost:3000/ y nos logamos con *admin/admin* y luego nos solicita cambiar la contraseña

### Añadir fuente de datos
Para añadir la fuente de datos Prometheus, nos vamos a **Connections > Data sources > Add new data source**.
Seleccionamos la fuente Prometheus, le damos un nombre y ponemos la url de servidor: http://172.17.0.1:9090/
### Creación Dashboards
Para crear Dashboards, importamos el código 3662 (para monitorizar Prometheus) y el fichero json **1860_rev37.json** para monitorizar todas las métricas que proporciona Node Exporter.

## INSTALACION ALERTMANAGER
Descargamos imagen docker:
```bash
docker pull prom/alertmanager
```
Arrancamos el contenedor:
```bash
docker run -d --name=alertmanager -p 127.0.0.1:9093:9093 --network=host quay.io/prometheus/alertmanager
```

### Configuración Prometheus
En el fichero de configuración de Prometheus *etc/prometheus/prometheus.yml*, indicamos la url de Alert Manager:
```bash
alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - localhost:9093
```
Una vez añadida la configuración, reiniciamos el contenedor Prometheus.


### Configuración Alert Manager
En el fichero de configuración *etc/alertmanager/alertmanager.yml*, añadimos la configuración para el envío de las alertas a Slack al canal indicado en **channel**:
```bash
receivers:
  - name: 'web.hook'
    webhook_configs:
      - url: 'http://127.0.0.1:5001/'
  - name: 'slack-notifications'
    slack_configs:
      - channel: '#taller-prometheus'
        send_resolved: true
        api_url: 'https://hooks.slack.com/services/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'
        icon_url: 'https://avatars3.githubusercontent.com/u/3380462'
        title: "{{ range .Alerts }}[{{ .Status | toUpper }}] {{ .Annotations.summary }} - {{ .Labels.severity | toUpper }}\n{{ end }}"
        text: "{{ range .Alerts }}{{ .Annotations.description }}\n{{ end }}"  
```
Una vez añadida la configuración, reiniciamos el contenedor Alert Manager.