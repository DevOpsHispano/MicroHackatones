# 023 Prometheus 2
## Objetivo
Ampliar la configuración de Prometheus integrándolo con Grafana y configurando el envío de alertas por correo electrónico y/o Slack.
## Integración de Grafana con Prometheus
Como CTO de TuEmpresa, tras una exitosa prueba de concepto con Prometheus, decides mejorar la visibilidad de los datos utilizando Grafana para crear dashboards personalizados y facilitar el análisis de métricas. Además, configuras alertas para recibir notificaciones en Slack o por correo electrónico cuando una métrica crítica supere un umbral determinado.
## Implementación
### Instalación de Grafana
- Ejecuta un contenedor de Grafana usando Docker.
- Accede a la interfaz web de Grafana en http://localhost:3000.
- Configura Prometheus como fuente de datos en Grafana.
- Crea un dashboard básico con gráficos basados en métricas de NodeExporter.
### Configuración de Alertmanager para el envío de alertas
- Crea un archivo alertmanager.yml con la configuración necesaria para enviar alertas por correo electrónico y/o Slack.
- Ejecuta un contenedor de Alertmanager con la configuración creada.
- Modifica el archivo prometheus.yml para incluir la integración con Alertmanager.
- Reinicia el contenedor de Prometheus.
- Verifica que las alertas se envíen correctamente generando una condición de prueba.
## Tips
- **Configuración en WSL:** Si usas WSL, es posible que necesites habilitar el modo host de Docker para que los contenedores se comuniquen correctamente. Puedes hacerlo agregando la opción --network=host al ejecutar los contenedores o configurando las interfaces de red en WSL.
- **Recursos útiles:**
  - [Documentación Grafana](https://grafana.com/docs/grafana/latest/fundamentals/)
  - [Guía para dummies](https://grafana.com/es/blog/2020/02/25/guia-paso-a-paso-para-configurar-prometheus-alertmanager-con-slack-pagerduty-y-gmail/)
## Repositorio de soluciones
Puedes consultar una solución de referencia del taller anterior, para usarlo como base para este, en el siguiente repositorio: [Tu repositorio de soluciones](https://github.com/DevOpsHispano/MicroHackatones)
