# 005: Kubernetes monitoring
Una empresa ha recibido quejas de sus usuarios sobre el rendimiento lento de su sitio web/aplicación en determinados momentos. El CISO ha solicitado al equipo DevOps que monitorice la web/aplicación para identificar el cuello de botella que causa la lentitud.

## Objetivos
Desplegar 3 o 4 pods utilizando la imagen https://github.com/cloudogu/hello-k8s, de forma similar a como se hizo en el taller 3.
Implementar un sistema de monitorización con Prometheus y Grafana para el cluster de minikube, utilizando Helm para su instalación.
Identificar las métricas más relevantes para detectar problemas de rendimiento.
Ver si es posible configurar alertas para notificar al equipo DevOps sobre problemas de rendimiento y caídas de pods.
Si es posible, configurar las alertas y simular la caída de algún pod.
 
## Tips:
  - alert-manager
  - kuberntes_sd_configs
  - alerting rules
