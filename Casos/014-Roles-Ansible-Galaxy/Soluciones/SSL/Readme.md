# Instalación de Ansible y Podman
Si no tienes Ansible y Podman instalados, lo primero será instalarlos en tu máquina local.

## Para instalar Ansible:

"`sudo apt update
sudo apt install ansible -y`"

O si usas Red Hat/CentOS:

"`sudo yum install ansible -y`"

## Para instalar Podman:

"`sudo apt install podman -y`"

# Creación del archivo hosts.ini
Este archivo es necesario para definir el inventario, es decir, dónde se va a ejecutar el playbook. Dado que en este caso se trata de tu máquina local, lo definirás de la siguiente manera:

Crea un archivo hosts.ini:

"`[local]`"
"`localhost ansible_connection=local`"

## Estructura de un Rol en Ansible Galaxy
Ansible Galaxy facilita la creación de roles reutilizables. Para iniciar un nuevo rol:

Ejecuta el siguiente comando para crear la estructura de carpetas de un rol:

"`ansible-galaxy init install_podman`"
"`ansible-galaxy init deploy_jenkins`"

Esto creará una estructura de carpetas estándar en los directorios install_podman y deploy_jenkins:

install_podman/
├── defaults/
├── files/
├── handlers/
├── meta/
├── tasks/
├── templates/
├── tests/
└── vars/

# Crear el rol install_podman
El objetivo de este rol es instalar Podman en tu máquina local.

Ve a la carpeta tasks dentro del rol install_podman y edita el archivo main.yml:

"`---`"
"`#tasks/main.yml`"
"`- name: Instalar Podman`"
"`  package:`"
"`    name: podman`"
"`    state: present`"

Este archivo especifica que el rol debe instalar Podman utilizando el módulo package.

# Crear el rol deploy_jenkins
Este rol se encargará de desplegar Jenkins en un contenedor utilizando Podman.

Ve a la carpeta tasks dentro del rol deploy_jenkins y edita el archivo main.yml:

"`---`"
"`#tasks/main.yml`"
"`- name: Descargar imagen de Jenkins`"
"`  podman_image:`"
"`    name: jenkins/jenkins`"
"`    tag: lts`"
"`    state: present`"

"`- name: Crear y ejecutar el contenedor de Jenkins`"
"`  podman_container:`"
"`    name: jenkins`"
"`    image: jenkins/jenkins:latest`"
"`    state: started`"
"`    ports:`"
"`      - "8080:8080"`"
"`      - "50000:50000"`"

Este archivo contiene las tareas para descargar la imagen de Jenkins desde Docker Hub y ejecutar el contenedor en los puertos 8080 y 50000.

# Crear el Playbook que llame a los Roles
Ahora, crearemos un playbook que utilice ambos roles (install_podman y deploy_jenkins).

Crea un archivo site.yml con el siguiente contenido:

"`---`"
"`- hosts: local`"
"`  become: yes`"
"``"
"`  roles:`"
"`    - install_podman`"
"`    - deploy_jenkins`"

Este playbook ejecutará los dos roles en tu máquina local.

# Ejecución del Playbook
Para ejecutar el playbook y desplegar Jenkins en Podman, ejecuta el siguiente comando:

"`ansible-playbook -i hosts.ini site.yml`"

# Explicación de Conceptos
 - Roles: Los roles en Ansible son una forma de organizar el código en módulos reutilizables. Cada rol tiene una estructura de carpetas estándar que permite aislar la lógica de cada componente (por ejemplo, instalación de Podman o Jenkins).
 - Playbook: Un playbook es un archivo YAML que contiene un conjunto de tareas o roles a ejecutar.
 - Ansible Galaxy: Es una plataforma para compartir roles predefinidos que puedes reutilizar en tus proyectos.