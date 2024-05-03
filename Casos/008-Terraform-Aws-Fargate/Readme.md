# 008 Modernización de una aplicación web con Terraform, AWS y Fargate

## Contexto:
Imagina que eres un consultor de nube para una empresa llamada "TuEmpresa" que ha estado operando una aplicación web crítica para su negocio durante varios años. La aplicación se ejecuta actualmente en servidores EC2 tradicionales, lo que genera una serie de desafíos:
 - Escalabilidad limitada: La infraestructura actual no puede adaptarse fácilmente a los picos de tráfico, lo que puede provocar tiempos de inactividad y una mala experiencia del usuario.
 - Alta complejidad: La gestión manual de los servidores EC2, incluyendo parches de seguridad, actualizaciones de software y escalado, consume mucho tiempo y recursos.
 - Falta de automatización: El proceso de implementación de nuevas versiones de la aplicación es manual y propenso a errores.

## Para abordar estos desafíos, proponemos una solución basada en Terraform, AWS y Fargate:
 - Infraestructura como código (IaC) con Terraform: Automatiza la creación y gestión de la infraestructura en AWS mediante plantillas de Terraform.
 - Contenedores con Fargate: Ejecuta la aplicación web en contenedores sin necesidad de administrar servidores EC2. Usa la siguiente imagen si quieres: https://github.com/cloudogu/hello-k8s
 - Escalabilidad elástica: Aprovecha la capacidad de escalado automático de Fargate para adaptar la infraestructura a los cambios en la demanda.

## BONUS: 
 - CI/CD: Implementa un flujo de trabajo de CI/CD para automatizar la implementación de nuevas versiones de la aplicación.
 
## Tips:
 - Route 53
 - Load Balancer
 - Security Groups
 - VPC
 - Subnets
 - Jenkins
