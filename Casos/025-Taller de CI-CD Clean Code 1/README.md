# 🛠️ Taller de CI/CD: Clean Code 1 🔥  


Bienvenidos al reto de hoy, nos encontramos ante una plataforma de CI/CD básica utilizada para construir y desplegar una aplicación.  
A continuación, os presentamos un pipeline que haría temblar a cualquier DevOps con experiencia. Una joya del anti-patrón. Un monumento a las malas prácticas.  

## 🎯 Objetivo  

Este pipeline está mal… **muy mal**.  
Vuestro reto es identificar los problemas y transformarlo en un pipeline robusto, eficiente y alineado con las buenas prácticas de CI/CD.  


## 🔥 El pipeline original  

```yaml
name: "Bad Pipeline"
on:  
  push:
    branches:
       - main
jobs:  
  build-and-deploy:    
    runs-on: ubuntu-latest    
    steps:
      - name: Checkout código        
        uses: actions/checkout@v3
      - name: A Produccion
        run: |
          echo "Instalando hackaton cli y dependencias"
          sudo apt update          
          sudo apt install -y hackaton          
          hackaton install  
          echo "Declarar variables"
          export DB_USER_DEV="admin"
          export DB_PASS_DEV="supersecreto"
          export API_KEY_DEV="123456789"
          echo "Aplicando configuraciones necesarias"
          sudo apt-get update -y
          sudo apt-get install -y nginx
          sudo apt-get install -y curl
          sudo systemctl enable nginx
          sudo systemctl start nginx
          sudo ufw allow 'Nginx Full'
          sudo ufw enable
          sudo systemctl stop apache2
          sudo systemctl disable apache2
          sudo rm -rf /var/www/html/*
          sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/backup
          sudo sed -i 's/root \/var\/www\/html;/root \/var\/www\/app;/' /etc/nginx/sites-available/default
          sudo systemctl restart nginx
          sudo chmod -R 755 /var/www/app
          sudo chown -R www-data:www-data /var/www/app
          sudo systemctl restart nginx
          echo "Construyendo aplicación..."
          hackaton run build
          echo "Probando aplicación"
          hackaton test
          echo "Desplegando aplicación en DEV..."
          hackaton deploy --DEV
          hackaton restart app --DEV
          export DB_USER_PROD="admin"
          export DB_PASS_PROD="supersecreto"
          export API_KEY_PROD="123456789"
          echo "Desplegando aplicación en PROD..."
          hackaton deploy --PROD
          hackaton restart app --PROD
          echo "🚀 Despliegue completado en desarrollo y producción"
```

## 👹 ¿Qué hace que este pipeline sea un desastre?
Código repetido hasta el infinito y más allá.
CI y CD mezclados en una misma ejecución, sin control ni orden.
Despliegues automáticos sin ningún tipo de control o autorización.
Dependencia total de valores hardcodeados (adiós variables externas).
Scripts de Bash embebidos sin modularización ni reutilización.
Sin secretos ni gestión segura de credenciales (¡ups!).
Pruebas escritas a fuego sin posibilidad de parametrización.

## 🚀 Tu misión
🔎 Analiza el pipeline y detecta sus fallos.
🔨Refactorízala o crea las que consideres necesarias, aplicando buenas prácticas de CI/CD.
🔬Explica qué mejoras has implementado y por qué. Además, ¿Instalarías alguna herramienta adicional que consideres critica?
 
## 🏆 Criterios de éxito
- Sigue las buenas prácticas de Clean CI/CD.
- Crea cuantas ramas consideres necesarias en el repo.
- Sugiere la instalación de aquellas herramientas que consideres criticas para la plataforma de CI/CD.
- Debate en el próximo hackaton tus propuestas para llegar a un acuerdo.

## 📌 Tip: Piensa en la escalabilidad, la seguridad y la mantenibilidad.
¿Listos para demostrar vuestras habilidades y salvar este pipeline del desastre? 🔧💡
