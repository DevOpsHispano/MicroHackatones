# Microhackaton19

# Contexto:
Eres el Release Manager de la famosa empresa TuEmpresa, una empresa de comercio electrónico en rápido crecimiento. 
 
# Problema:
Los desarrolladores de TuEmpresa están muy motivados y son muy proactivos a la hora de mejorar las aplicaciones. A veces esta motivación los lleva a realizar despliegues a preproducción o producción de forma autónoma, sin las autorizaciones necesarias y fuera de las fechas acordadas de despliegue, impactando significativamente al funcionamiento de la empresa.  
 
# Solución:
Se propone restringir la ejecución del workflow de despliegue cuando los entornos de destino sean productivos(Pre y Pro). Los despliegues a estos entornos deben ser autorizados por un miembro del equipo de DevOps. Además, únicamente los integrantes del equipo de devops deben poder editar los ficheros que se encuentren en la carpeta .github.
 
# Implementación y solución propuesta:
1.	Crear un repositorio en GitHub para almacenar el código fuente de la aplicación de TuEmpresa (puedes reutilizar el de talleres anteriores).
2.	Crear un workflow en el repositorio que tome como parámetro de entrada el entorno de destino, este se debe seleccionar en un desplegable entre los entornos existentes (dev, test, pre, pro). El workflow simplemente imprimirá, con un echo, “Desplegando en el entorno X”
3.	Configura los permisos para que la ejecución del workflow, cuando el entorno de destino sea pre o pro, deba ser aprobada por alguien del equipo de DevOps.

  - Crea una organización de GitHub gratuita y dos equipo dentro de ella.
    
    ![image](https://github.com/user-attachments/assets/18186281-2f6a-46da-948e-3708c395407d)

  - Invita a dos usuarios a la organización, uno a cada equipo.
    - En este ejemplo no hay usuarios en el equipo de Development pero se ha probado que es necesario la review de un miembro del equipo de DevOps para desplegar en PRE y PRO 
   
  - Crear los entornos de GitHub y la protection rule.

     ![image](https://github.com/user-attachments/assets/a3ed107f-91f9-46a4-87fa-b9d9c0a412cb)

   - Protection rule para PRE y PRO:
     
     ![image](https://github.com/user-attachments/assets/e4c551df-855d-4ef8-88ef-ce0ac68e1f7e)
 
  - Crea el archivo CODEOWNER con el equipo que pueda editar en .github. De esta forma se asegura que únicamente miembros del equipo de DevOps puedan editar esta carpeta

     ![image](https://github.com/user-attachments/assets/b3ff4bc5-f657-4a69-aff2-088b7b42fb76)

  - Restringir la forma de mergear código a main, permitiéndolo únicamente a través de Pull Request. Para ello se crea una branch protection rule:

    ![image](https://github.com/user-attachments/assets/24c7c14e-5a9b-4f63-96a0-bf9532ff7011)

  Si se ejecuta el workflow en pre o pro, el workflow se queda parado hasta que alguien del equipo de DevOps acepte la ejecución:

  ![image](https://github.com/user-attachments/assets/94e49010-be42-48bc-909f-1a3e9a68afa0)

  En este caso el miembro de DevOps sería mi mismo usuario:

  ![image](https://github.com/user-attachments/assets/093efe82-85f2-4d85-b290-d28bd78a292f)

  Aparecerá una notificación al usuario o usuarios que tengan que aceptar la ejecución (equipo DevOps):

  ![image](https://github.com/user-attachments/assets/cc1c11d2-ee5e-4055-8b18-6c2e0023699a)

  Se aprueba la ejecución:

  ![image](https://github.com/user-attachments/assets/310c09f1-2c76-4d48-8c9c-4e341f4298a2)

  Una vez aprobado el despliegue, el workflow se ejecuta correctamente:

  ![image](https://github.com/user-attachments/assets/277ece54-8e99-47e6-9abb-0cbc24e9bd85)
