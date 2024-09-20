FROM jenkins/jenkins:lts

# Configura el contenedor para ejecutarse como el usuario `jenkins`
USER root

# Instalar dependencias adicionales si es necesario
RUN apt-get update && apt-get install -y sudo

# Añadir el usuario jenkins al grupo sudoers
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Cambiar al usuario jenkins
USER jenkins

# Establecer el directorio de trabajo
WORKDIR /var/jenkins_home

# Exponer puertos necesarios
EXPOSE 8080 50000
