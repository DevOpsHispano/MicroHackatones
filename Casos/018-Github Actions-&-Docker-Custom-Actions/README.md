# 018 Github Actions & Docker Custom Actions

## Contexto:
Eres el Arquitecto DevSecOps de la famosa empresa TuEmpresa, una empresa de comercio electrónico en rápido crecimiento. La empresa dispone de varios microservicios que se despliegan con una Action de Github única.
 
## Problema:
La custom Actions desarrolladas para construir y desplegar las aplicaciones de TuEmpresa descargan código, secretos y configuraciones en el runner de GitHub abriendo la puerta a posibles ataques de hackers contra esos runners. Como DevSecOps Architect deseas averiguar la forma de cerrar esa puerta e incrementar la seguridad.
 
## Solución:
Se propone modificar el tipo de custom action de Composite a Docker para que así toda la información sobre configuraciones y secretos se descargue en un docker volátil que desaparezca una vez la Action ha finalizado.
 
## Implementación:
1. Crear un repositorio en GitHub para almacenar el código fuente de la aplicación de TuEmpresa (puedes reutilizar el de talleres anteriores).
2. Crear una custom action de tipo Docker:
  - InfraConfig: Ejecuta un echo “Ejecutando tests”
3. Crea un Dockerfile que herede de la imagen de alpine donde se ejecutará la custom Action (FROM alpine:latest).
4. Crear un workflow en el repositorio de la aplicación con los siguientes pasos:
  - InfraConfig(la action anteriormente desarrollada).
  - Build (un echo building).
  - Deploy (un echo Deploying).
  - Test (un echo Test).
 
## Tips:
https://docs.github.com/en/actions/sharing-automations/creating-actions/about-custom-actions
https://resources.github.com/learn/pathways/automation/advanced/building-your-first-custom-github-action/
https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action
