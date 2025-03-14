# Taller #024: Autoescalado con Prometheus y Docker

## Objetivo

Mejorar la resiliencia y escalabilidad de contenedores en Docker mediante la integración de Prometheus, Alertmanager y un mecanismo automatizado de respuesta ante altos consumos de recursos. El sistema reiniciará contenedores con alto consumo de CPU o memoria, y si estos superan tres reinicios fallidos en una hora, se desplegará una nueva instancia para simular el autoescalado en AWS.

## Arquitectura del sistema

- **Prometheus:** Monitoreo de métricas de contenedores.
- **Node Exporter:** Exposición de métricas de los contenedores.
- **Alertmanager:** Gestión de alertas y ejecución de acciones de remediación.
- **Webhook Flask:** Recepción de alertas y activación del script de autoremediación.
- **Script Bash:** Reinicio de contenedores y escalado si persisten los problemas.
- **Grafana:** Visualización de métricas (opcional pero recomendado).

## Instalación y configuración

1. **Levantamiento de contenedores:**

No olvidemos añadir la misma red para todos si se ha creado una para el taller.

```bash
docker run -d --name prometheus -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -v $(pwd)/alert_rules.yml:/etc/prometheus/alert_rules.yml prom/prometheus
```
```bash
docker run -d --name alertmanager -p 9093:9093 -v $(pwd)/alertmanager.yml:/etc/alertmanager/alertmanager.yml prom/alertmanager
```
```bash
docker run -d --name node_exporter -p 9100:9100 prom/node-exporter
```
```bash
docker run -d --name webhook -p 5000:5000 -v $(pwd)/autoremediate.sh:/autoremediate.sh -v $(pwd)/webhook.py:/webhook.py python:3.9-slim bash -c "pip install flask && python webhook.py"
```

2. **Configurar Prometheus:** (prometheus.yml)

- Monitoreo de contenedores con Node Exporter.
- Carga de reglas de alertas (alert\_rules.yml).

3. **Configurar Alertmanager:** (alertmanager.yml)

- Envío de alertas a Slack.
- Webhook para ejecutar la autoremediación.

4. **Configurar el Webhook:** (webhook.py)

- Flask escucha en el puerto 5000.
- Ejecuta el script de remediación ante alertas críticas.

5. **Configurar las reglas de alerta:** (alert\_rules.yml)

- **CPU:** Si el uso supera el 80% durante 1 minuto.
- **Memoria:** Si el uso supera el 80% durante 5 minutos.

Si un contenedor supera el 80% de CPU o memoria, Alertmanager activa el webhook.
El webhook ejecuta autoremediate.sh para intentar reiniciarlo.
Si falla más de 3 veces en una hora, se despliega una nueva instancia.

## Respuesta automática y escalado

1. **Reinicio de contenedores:**

- Primer fallo: espera 1 minuto.
- Segundo fallo: espera 5 minutos.
- Tercer fallo: espera 10 minutos.

2. **Despliegue de nueva instancia:**

Si los 3 reinicios fallan en menos de 1 hora, se escala desplegando un nuevo contenedor.

### 🟩 Cambios necesarios para el autoescalado:

- **Actualizar webhook.py:**

Agregar un contador de reinicios y ejecutar un nuevo contenedor si se superan los intentos:

TODO

```python
restart_count += 1
if restart_count > 3:
    subprocess.Popen(["docker", "run", "-d", "--name", f"{container_name}_new", "imagen_del_contenedor"])
```

- **Persistir los reinicios:**

Guardar los reinicios en Redis o un archivo temporal para hacer seguimiento.

- **Actualizar alertmanager.yml:**

Agregar una alerta para más de 3 contenedores fallidos en 1 hora.
