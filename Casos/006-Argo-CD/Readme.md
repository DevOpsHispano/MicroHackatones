# 006: Argo CD
De cara a mejorar el cluster de Kubernetes de la compañía, en el que ya se han ido desplegando aplicaciones y configurando la monitorización, 
el CTO decide que el siguiente paso será apostar por el framework GitOps. 

De esta manera, los cambios que se realice en el cluster estarán almacenados en un repositorio git y su despliegue se hará de forma automatizada, evitando asi el trabajo manual.

Para poder implementar este framework se apuesta por el uso de la herramienta Argo CD.

# Objetivos:
 - Instalar Argo CD.
 - Almacenar la aplicación de prueba https://github.com/cloudogu/hello-k8s en un repo git personal.
 - Utilizando Argo CD desplegar la aplicación desde este git.
 - Configurar el despliegue automático de la aplicación ante cualquier cambio realizado en el repositorio Git.
 - Una vez configurado, realizar un cambio a la aplicación, ver que se despliega correctamente y realizar un roll-back a la versión previa al cambio desde Argo CD.

# Bonus Track:
Probar a realizar desde Argo CD despliegues complejos del tipo: Canary deployment o Blue-Green deployment.

# Tips:
 - GitOps framework
 - Argo CD Installation
 
# Mejores Soluciones
TODO: Enlaces a las mejores soluciones
