# 014 Roles Ansible Galaxy

## Objetivo
Iniciarse en Ansible Galaxy Roles aprendiendo los conceptos básicos y la estructura de carpetas.
 
## Creación de Roles
Tras haber desplegado exitosamente Jenkins utilizando playbooks de Ansible, como CTO de TuEmpresa, buscas la forma de reutilizar parte de la configuración de Ansible para desplegar futuras herramientas. Investigando, decides utilizar roles de Ansible Galaxy, de forma que cada una de las partes de la instalación de Jenkins sea un rol de Ansible que pueda ser reutilizado posteriormente en otras instalaciones.

## Implementación:
 - Creación de un archivo host.ini con la dirección del servidor de producción donde Podman y Jenkins serán instalados (tu propio PC) junto con las credenciales necesarias para su instalación.
 - Creación del rol install_podman en el que se llevara a cabo la instalación de podman en tu maquina local.
 - Creación del rol deploy_jenkins en el que se construirá y desplegará en podman un contenedor de Jenkins.
 - Creación de un playbook que llame a estos dos roles.
 
## Tips
 - https://galaxy.ansible.com/ui/ (Pagina oficial)
 - https://galaxy.ansible.com/ui/standalone/roles/ (Roles ya desarrollados)
 - https://docs.ansible.com/ansible/latest/cli/ansible-galaxy.html (Documentación sobre Ansible Galaxy)
 - https://github.com/DevOpsHispano/MicroHackatones/tree/main/Casos/012-Ansible-Playbook