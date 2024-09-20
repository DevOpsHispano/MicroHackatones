#012 Ansible in a nutshell-1

##Objetivo
Iniciarse en Ansible aprendiendo los conceptos básicos de playbook, inventario e interiorizando su filosofía.
Instalación de Docker y ejecución de Jenkins con Ansible
Como CTO de “TuEmpresa”, y fiel defensor de la filosofía DevOps, decides que la herramienta que se utilizará como motor de integración continua(Jenkins) deberá ser instalada utilizando una herramienta CaC (Configuration as Code), para lo que ha seleccionado Ansible como herramienta.

##Implementación:
Creación de un archivo host.ini con la dirección del servidor de producción donde Podman y Jenkins serán instalados(tu propio PC) junto con las credenciales necesarias para su instalación.
Creación de un Dockerfile para Jenkins (Proporcionado en los tips).
Creación de un playbook de Ansible que instale Podman en el servidor de producción.
Creación de un playbook que, en base al Dockerfile proporcionado en los tips, lo construya y ejecute.
 
##Tips
https://www.ansible.com/how-ansible-works/
 
##Educational tip: 
¿Sabes a que se refiere la palabra idempotencia cuando hablamos de Ansible? Prueba a crear un directorio utilizando el modulo de ansible de creación de directorios y utilizando el modulo de bash con el comando mkdir /mydirectory. ¿Qué ocurre si ejecutamos ambos dos veces? ¿Cuál produce mejores resultados?
 
###Dockerfile de Jenkins:
 
FROM jenkins/jenkins:lts
 
# Configurar el entorno para Jenkins
USER root
RUN apt-get update && apt-get install -y sudo
 
# Volver al usuario jenkins
USER Jenkins