# 018 Github Actions & Docker Custom Actions

Resolución propuesta para este microhackaton

En la raíz del repositorio se crea el fichero action.yml que será el encargado de activar la lógica de la customaction definida en el fichero Dockerfile localizado también en la raíz, en el Dockerfile se realizan los siguientes pasos:

  - Se crea un contenedor con la última imagen de Alpine (alpine:latest)
  - Se instalan bash y curl por si se quiere usar algún comando
  - Se realiza un echo "Ejecutando tests"
  
  ![image](https://github.com/user-attachments/assets/5059a45e-56ff-4618-b6e1-66774b56fe5b)

Posteriormente, desde uno de los steps (InfraConfig) del workflow creado en /.github/workflows, se llama al fichero action.yml de la raíz del repositorio, que ejecuta la custom action:

![image](https://github.com/user-attachments/assets/7fff7418-dc01-42f5-850a-5f83d693f29d)

Se ejectuta el workflow y se comprueba que se ejecuta correctamente la custom action dentro de Alpine.

![image](https://github.com/user-attachments/assets/b4b7ce7b-403d-4b24-b876-58cefe301eb0)

![image](https://github.com/user-attachments/assets/c95dc5b5-387a-4deb-8bba-e80c7915ca61)

Workflow ejecutado correctamente:

![image](https://github.com/user-attachments/assets/c8691a61-fc79-4d74-8d5e-c61e1340ddbe)
