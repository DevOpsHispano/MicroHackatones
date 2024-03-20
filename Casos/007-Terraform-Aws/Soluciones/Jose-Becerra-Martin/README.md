# 007: Terraform

Despliega una aplicación web estática en AWS

NOTA: Este taller se realizará por parejas para que quienes no tengan cuenta de AWS o Cloud Gurú puedan realizarla.

## Situación:

Eres un ingeniero de DevOps que trabaja en una empresa que necesita una aplicación web estática simple para mostrar información a sus clientes. La empresa no tiene experiencia con Terraform y busca una solución que automatice la creación y gestión de la infraestructura en AWS.

## Objetivo:

En este taller, aprenderás a utilizar Terraform para:

- Desplegar una aplicación web estática "Hello World" en AWS.
- Almacenar la aplicación en un bucket S3.
- Distribuir la aplicación a través de CloudFront.
- Generar una URL temporal para que los clientes puedan acceder a la aplicación.

## Requisitos:

- Cuenta de AWS o acceso a Cloud Guru (uno por pareja).
- Terraform instalado.

Al final del taller, serás capaz de:

- Utilizar Terraform para definir la infraestructura de la aplicación.
- Implementar la infraestructura en AWS de forma automatizada.
- Compartir la aplicación con los clientes de forma segura.

## Pasos

### Paso 1: Instalación de Terraform

```bash
sudo apt update 
sudo apt install curl software-properties-common 
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg 
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list 
sudo apt update && sudo apt install terraform 
terraform version
```

### Paso 2: Instala AWS CLI

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
rm awscliv2.zip
```

### Paso 3: Crear Cloud Sanbox de CloudGuru

[Cloud Playground](https://learn.acloud.guru/cloud-playground)

### Paso 4: Configurar credenciales de AWS

Crear un archivo ~/.aws/credentials y añadir credenciales:

```
[default]
aws_access_key_id = tu_access_key_id
aws_secret_access_key = tu_secret_access_key
```

## Paso 5: Configurar el Proyecto Terraform

Crear los archivos de Terraform.

## Paso 6: Crea el bucket para el backend

Lanzando el script `create_backend_bucket.sh`

## Paso 7: Iniciar Terraform

Ejecutar el comando `terraform init` en el directorio del proyecto para inicializar el proyecto.

## Paso 8: Plan y Apply

Ejecutar el comando `terraform plan` para generar un plan de despliegue. 

Si todo va bien, ejecutar el comando `terraform apply` para aplicar el plan de despliegue.
