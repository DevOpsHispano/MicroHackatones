# 009 Github Actions & Monorepos

## Contexto – Caso real:
Tras muchos años de operar una aplicación monolítica para su negocio el CTO de la famosa empresa "TuEmpresa" decide transformar esa aplicación monolítica en una serie de microservicios desplegados sobre una plataforma de contenedores para adaptarse a los nuevos tiempos tecnológicos, mejorar la eficiencia, escalabilidad y reducir costes.
Debido a los años trabajando con una aplicación monolítica se opta por disponer de un único repositorio de Github para almacenar todos los microservicios(en lugar de un repositorio para cada microservicio) así como una Github Action encargada de construir y desplegar los microservicios. 

## En este repositorio único existe esta estructura de:
 - Doc: Documentación sobre los microservicios
 - .github: Información sobre las GithubActions.
 - Micros: Carpeta que contiene todos los microservicios existentes, cada uno de ellos almacenados en una carpeta con su nombre (Micro1, Micro2, Micro3,…)

## Este enfoque de repositorio único tiene los siguientes inconvenientes:
 - Ante el cambio en un microservicio todos los existentes en el repositorio serán construidos y desplegados, aun cuando no hayan sufrido cambios.
 - Duración excesiva de los procesos de integración o despliegue continuos.

## Ante esta situación el CTO de “TuEmpresa” solicita la creación de una nueva Action de Github que sea capaz de:
 - Detectar que microservicios han sufrido cambios, que carpetas han sido modificadas en el ultimo commit sobre el que actúa la action.
 - Aplicar el proceso de CI/CD solo para los modificados.
 - Los procesos de CI/CD deberán ejecutarse en paralelo para varios microservicios, de forma que se reduzca la duración de estos.

## Tips:
 - GitHub Matrix
 - tj-actions/changed-files
 - Para facilitar la simulación de los microservicios bastara con añadir el siguiente script bash dentro de cada una de las carpetas de los microservicios y ejecutarlo en la pipeline cuando haya sido modificado.
