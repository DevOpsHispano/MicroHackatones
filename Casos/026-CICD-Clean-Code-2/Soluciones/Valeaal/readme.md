# Solución propuesta

Usaremos un workflow reusable ubicado en un repositorio llamado "infraestructura", de manera que este es usado por todos los repositorios. En cada uno de ellos, tendremos un pequeño workflow que llamará al principal (el reusable) pasándole ciertos parámetros que este gestionará. Es importante que el repositorio de "infraestructura" permita que su workflow sea llamado desde otros repositorios, esto es configurable desde los ajustes del repositorio.

El uso de custom actions proporciona modularidad, y el uso de reusar el mismo workflow para todos los repositorios proporciona escalabilidad y fácil mantenimiento.

## Escalabilidad:

Aquí tenemos la documentación sencilla y fácil de entender para crear un nuevo repositorio de manera escalable en nuestra organización.

Como hemos dicho, la modularidad en el workflow es proporcionada por las custom actions. Hay custom actions comunes para toda la organización que estarán ubicadas en el repositorio "infraestructura" y hay custom actions particualres para cada repositorio que estarán ubicadas en dichos repositorios.

### Creación del nuevo repositorio:

- Lo creamos dentro de la organización, en público.
- Añadimos los entornos DEV y PRO en el nuevo repositoro.
- Añadimos los equipos DevOps y Develop de la organización al repositorio.
- Añadimos al equipo DevOps de la organización como reviewer necesario para el entorno PRO nuevo repositorio.

### El nuevo repositorio deberá de tener...

- Una carpeta .github/actions/test, y dentro un action.yml que contiene los test a realizar por ese repositorio.
- Una carpeta .github/actions/build, y dentro un action.yml que contiene los test a realizar por ese repositorio.

## Gestión del control de acceso

- Usamos la estructura de roles, permisos, organizaciones y entornos de GitHub: tenemos los equipos Develop y DevOps en la organización.
- Usamos las organizaciones para controlar el despliegue a producción, en vez de usar los campos `authorization` y `Required`.
- Las claves de acceso de la BDD se almacenan en los secretos de entorno de los repositorios de GitHub. Pueden usarse en las actions de build y test.

## Gestión de errores

- El artifact solo se sube si se ha completado correctamente la build. Si no, se detiene el flujo de trabajo y, obviamente, no se despliega, ni el DEV ni el PROD. 

## Modularidad

- Cada repositorio tendrá su action que ejecuta sus test personalizados. Esta action es recuperada y ejecutada automáticamente por el workflow general ubicado en el repositorio "infraestructura"
- Cada repositorio tendrá su action que ejecuta el build personalizado. Esta action es recuperada y ejecutada automáticamente por el workflow general ubicado en el repositorio "infraestructura"

## Optimización

- El workflow general "infraestructura" despliega en un entorno u otro dependiendo del imput que le proporciona el repositorio que lo llama. No hay código duplicado en esta acción, lo hacemos solo en un step.

# Links útiles

- [text](https://docs.github.com/es/actions/sharing-automations/reusing-workflows)