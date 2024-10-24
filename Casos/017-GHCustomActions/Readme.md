# 017 Github Actions & Custom Actions

## Contexto:
Eres el Ingeniero DevOps de la famosa empresa TuEmpresa, una empresa de comercio electrónico en rápido crecimiento. La empresa dispone de varios microservicios que se despliegan con una Action de Github única.

## Problema:
La extensión de la Action única es considerable al ocuparse de configurar la infraestructura, construir la aplicación, hacer los test y desplegarla, lo que hace que sea compleja de mantener y debuguear.

## Solución:
Se propone externalizar la configuración de la infraestructura y los tests en dos actions custom que serán ejecutadas dentro del workflow de la aplicación.

## Implementación:
Crear un repositorio en GitHub para almacenar el código fuente de la aplicación de TuEmpresa (puedes reutilizar el de talleres anteriores).

### Crear dos custom actions:
 - InfraConfig: Contendrá un echo “Configurando la infraestructura necesaria para la aplicación”
 - Tests: Recibira dos parámetros y tendrá un echo “Ejecutando tests param1 y param2”

### Crear un workflow en el repositorio de la aplicación con los siguientes pasos:
 - InfraConfig(la action anteriormente desarrollada).
 - Build (un echo building).
 - Deploy (un echo Deploying).
 - Test (la action anteriormente desarrollada a la que se le pasaran los dos parámetros necesarios).

## Tips:
 - https://docs.github.com/en/actions/sharing-automations/creating-actions/about-custom-actions
 - https://resources.github.com/learn/pathways/automation/advanced/building-your-first-custom-github-action/
 - Repositorio de soluciones: https://github.com/DevOpsHispano/MicroHackatones
