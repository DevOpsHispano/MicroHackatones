# 🚀 Mejoras Implementadas en esta solución propuesta

Se recomienda mucho hacer los anteriores microhackatones de GitHub Actions, incluyendo el de roles y permisos. Obviamente, para replicar la solución deberás de configurar en tu repositorio los equipos y permisos, los secretos e incluir los archivos en el correspondiente .github

## 🔄 Código Repetido  
✔ Se ha unificado el proceso de despliegue, evitando código duplicado.  
✔ Dependiendo del **input**, el despliegue se realiza en el entorno correspondiente.  

## ⚙️ Separación de CI/CD  
✔ Se han creado **custom actions** para:  
  - 📦 **Instalación de paquetes**.  
  - ⚙ **Aplicación de configuraciones necesarias**.  

✔ No se ha creado una custom action para variables de entorno, ya que solo se necesitaba recuperar los secretos, lo cual no justificaba la complejidad adicional.  


## 🚢 Despliegues Automáticos  
✔ Se ha creado una **organización en GitHub** con las siguientes mejoras:  
  - 📜 Uso del archivo `CODEOWNERS` para restringir modificaciones en `.github` solo al equipo **DevOps**.  
  - 🌍 Separación de entornos de **desarrollo (DEV)** y **producción (PROD)**.  
  - 🚀 **Despliegue automático en DEV** sin necesidad de autorización.  
  - ❌ Restricción de `push` directo a `PROD`.  
  - 🏗 **Parámetro de entorno** en el workflow para definir dónde desplegar (por defecto en DEV).  


## 📂 Modularización de Scripts y Eliminación de Valores Hardcodeados  
✔ Se han agregado **inputs a la custom action de configuración**, permitiendo cambiar rutas y valores dinámicamente desde el workflow que la invoca.  


## 🔐 Gestión Segura de Secretos y Credenciales  
✔ Uso de **secretos de GitHub** para almacenar credenciales sensibles como:  
  - `DB_PASS_DEV`, `DB_PASS_PROD`, `API_KEY_DEV`.  
✔ **Cómo modificarlos:**  
  1. Ir a **Repositorio de la Organización**  
  2. `Settings` → `Secrets and variables` → `Actions` → `Repository secrets`.  
✔ **Restricción de credenciales de producción**, accesibles solo en su entorno correspondiente.  


## 🧪 Parametrización de Pruebas  
✔ Se ha permitido **parametrizar la versión de los tests**.  
✔ Se ha implementado una **custom action para la ejecución de pruebas**, facilitando su mantenimiento y adaptación a diferentes versiones.  
