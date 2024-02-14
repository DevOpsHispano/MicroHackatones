# 004 Jenkins Templating

En la actualidad, una de las prácticas más comunes en el mundo del desarrollo es la creación de Microservicios. El equipo de arquitectura valida las tecnología a usar en los Microservicios y crea el esqueleto. Una vez se libera a los desarrolladores, estos se vuelven locos y empiezan a crear microservicios como si no hubiera un mañana, y además… quieren Pipelines para todos los Micros de forma inmediata.

## Caso

Es necesario en Jenkins crear un sistema de gobernanza utilizando el plugin Jenkins Templating Engine (JTE). Habrá dos tipos de pipelines, uno de Java para el backend y otro de NodeJS (puede ser Angular) para el Frontend.
Los pipelines serán sencillos, tienen que tener tres stages con sus respectivos "echos" indicando el nombre del stage. Además, deben imprimir una variable (configServer, con el valor que queráis) en el stage de Deploy que tiene que ser definida a nivel de gobernanza. Estos serán los stages:
	- Checkout
	- Build
	- Deploy

Ya que habrá un sistema de Gobernanza para los pipelines, lo ideal sería que la lógica de los stages estuvieran en unas librerías que se pudieran compartir, por si en un futuro se pueden reutilizar en otros pipelines. Además, de esta forma, podemos cambiar la lógica para los 400 microservicios y 50 frontends que se van a desplegar, si tener que modificar 450 Jenkinsfile.

## Tips
JTE
pipeline_config.groovy
Shared Libraries
