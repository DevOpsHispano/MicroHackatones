# 022 Prometheus 1
## Objetivo
Iniciarse en Prometheus configurando las métricas del sistema y creando una alerta de CPU.
## Tu primera configuración de Prometheus
Como CTO de TuEmpresa, buscas una herramienta de monitorización que sea fácil de usar, rentable y eficiente para monitorizar los sistemas de la empresa. Decides hacer una prueba de concepto utilizando Prometheus, aprovechando para configurarlo y desplegar utilizando Docker.
## Implementación
- Instala Prometheus :
- Instala Docker.
- Crea un archivo yaml con la configuración basia de Prometheus.
- Ejecuta el contenedor de Prometheus con ese archivo de configuración.
- Añade un contenedor de Node exporter:
-- Ejecuta un contenedor de NodeExporter para obtener las métricas del sistema.
-- Modifica la configuración de prometheus, su archivo yaml, para que tambien obtenga las métricas de NodeExporter.
-- Reinicia el contenedor de Prometheus.
- Verifica que las métricas se obtengan correctamente accediendo a la URL de Prometheus.  
- Crea una alerta de CPU:
-- Crea un archivo alert_rules.yml con la definición de la alerta que quieres monitorizar.
-- Agrega la alerta en la configuración de Prometheus, en su archivo yaml.
-- Reinicia el contenedor de Prometheus
- Verifica que en la web de Prometheus, bajo la pestaña de alertas, aparece la alerta creada.
## Tips
Documentación útil:
- https://prometheus.io/docs/prometheus/latest/getting_started/
- https://prometheus.io/docs/introduction/overview/
## Repositorio de soluciones
Puedes consultar una solución de referencia al final del taller en el siguiente repositorio: TuRepositorioDeSoluciones
