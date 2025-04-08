# 🛠️ Taller de CI/CD: Clean Code 2 - La Carrera Contra el Caos de las Pipelines 🔥

¡Bienvenidos al segundo round de nuestro hackaton! En esta ocasión nos encontramos ante una plataforma de CI/CD avanzada utilizada para construir y desplegar todas las aplicaciones de la compañía. Y si pensabais que ya lo habíais visto todo... ¡esperad a ver lo que tenemos preparado para vosotros!

A continuación os presentamos el esquema de pipelines de la plataforma, que ya han sido mejoradas con algunas buenas prácticas de CI/CD, tal y como vimos en el Taller 1. Pero, ¿qué pasa cuando tenemos n pipelines para diferentes aplicaciones, todas con su propia versión personalizada? ¡El caos!

## 🎯 Objetivo

A pesar de que hemos mejorado la estructura, la claridad y las buenas prácticas de nuestras pipelines, te has dado cuenta de que adaptar las n pipelines de la compañía a esta nueva estructura es un trabajo titánico. Tras varios días (¡y noches!) de intentos y maldiciones, te preguntas: ¿será posible reducir al mínimo este tiempo y asegurar que los cambios se apliquen de forma simultánea?

La empresa dispone de varios repositorios de tipo frontend y varios de tipo backend, para resumir puedes ver un ejemplo de la estructura de un repo front y uno back en: [EJEMPLO](https://github.com/DevOpsHispano/MicroHackatones/tree/main/Casos/026-CICD-Clean-Code-2).

### 👹 ¿Qué hace que esta plataforma esté al borde del abismo?

n pipelines: Una pipeline por cada repositorio. Porque, claro, ¡¿qué podría ser más eficiente que tener 50 pipelines diferentes, todas haciendo cosas parecidas?!
Variables, actions reutilizables y scripts: Todos están repetidos n veces en cada uno de los repositorios. Como si copiar y pegar fuera la solución a todos nuestros problemas. 

¡Quién necesita DRY (Don't Repeat Yourself), verdad?!
El caos evolutivo: Aunque las pipelines empezaron siendo todas iguales, con el tiempo cada una ha ido modificándose para ajustarse a las necesidades específicas de cada aplicación. Ahora tenemos una buena mezcla de pipelines que parecen más una sopa de letras que un proceso eficiente.

Migración = Empezar de 0: Si algún día nos da por cambiar de herramienta de CI/CD (y no es que estemos esperando a eso, pero…), tendríamos que reconstruir todas las pipelines desde cero. Porque, claro, las buenas prácticas no siempre se aplican a todo el sistema, ¿verdad?

## 🚀 Tu misión

🔎 Analiza la estructura de los repos y busca una forma de reducir la redundancia y simplificar el trabajo. ¿Cómo podemos hacer que todo esto funcione sin tener que crear una nueva pipeline cada vez que alguien agregue una nueva app al proyecto?

🔨 Refactoriza las pipelines y crea las acciones reutilizables necesarias. Ya sabéis, aplicar buenas prácticas de CI/CD para que podamos dormir tranquilos sabiendo que el código sigue siendo limpio, escalable y eficiente.

🔬 Explica qué mejoras has implementado y por qué. Eso sí, sin olvidar que hay que hacer todo esto sin perder la cabeza. ¡La escalabilidad, la seguridad y la mantenibilidad son lo primero!

## 🏆 Criterios de éxito:

Evitar reescribir n veces el mismo cambio: Porque copiar y pegar no es una solución, es un modo de vida equivocado.

Evitar tener pipelines completamente diferentes para aplicaciones similares: Ya basta de tener una pipeline para front-end que hace 57 pasos y una para back-end que hace 60. ¡El equilibrio es la clave!

Optimizar la plataforma de CI/CD: Que todos los cambios se apliquen de forma simultánea, sin perder horas en modificaciones manuales.

Debate en el próximo hackaton: Comparte tus ideas y construye el consenso para que todos estemos de acuerdo. Recuerda, lo que hagas hoy afectará las vidas de muchos… ¡si no te peleas por hacerlo bien, nadie lo hará!

## 📌 Tip: 
Piensa en la escalabilidad, la seguridad y la mantenibilidad. Y no olvides que el futuro de tu plataforma depende de las decisiones de hoy. Así que no tomes atajos, ¡aunque la tentación sea grande!

### ¿Estás listo para enfrentarte a esta montaña de pipelines?
No te preocupes, ¡no estarás solo! Con tu ingenio y nuestras buenas prácticas, juntos podemos salvar esta plataforma y dejarla lista para los próximos años. ¡No dejes que el caos te venza!
