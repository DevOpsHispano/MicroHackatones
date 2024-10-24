# GitHub Actions & Custom Actions

## Descripción del Taller

Este taller tiene como objetivo externalizar la configuración de infraestructura y la ejecución de tests dentro de un flujo de trabajo de GitHub Actions. Actualmente, la empresa **TuEmpresa** dispone de varios microservicios que se despliegan mediante una única Action de GitHub, lo que dificulta su mantenimiento y debug. Para simplificar el flujo de trabajo, se propone dividir el proceso en diferentes Actions personalizadas, mejorando así la modularidad y la capacidad de depuración.

### Estructura del Proyecto

La estructura de carpetas del proyecto es la siguiente:

```yaml
.
├── .github
│   └── workflows
│       └── main.yml
├── actions
│   ├── infra-config
│   │   ├── action.yml
│   │   └── entrypoint.sh
│   └── tests
│       ├── action.yml
│       └── entrypoint.sh
└── README.md
```

### 1. Action Custom: InfraConfig
La Action **InfraConfig** se encarga de configurar la infraestructura necesaria para la aplicación. Su única funcionalidad es imprimir un mensaje que indica que la infraestructura está siendo configurada.

#### Estructura de archivos:
- **`action.yml`**: Define los metadatos de la Action y establece el entorno en que se ejecutará.
- **`entrypoint.sh`**: Contiene el script que imprime el mensaje de configuración de la infraestructura.

#### Comportamiento:
```bash
echo "Configurando la infraestructura necesaria para la aplicación"
```

### 2. Action Custom: Tests
La Action Tests permite ejecutar tests en la aplicación, recibiendo dos parámetros de entrada. Estos parámetros serán utilizados para personalizar los tests a ejecutar.

#### Estructura de archivos:
 - action.yml: Define los metadatos de la Action, así como los parámetros param1 y param2 que se pasan al ejecutar la Action.
 - entrypoint.sh: Contiene el script que imprime un mensaje indicando los tests que se están ejecutando.

#### Comportamiento:
```bash
echo "Ejecutando tests $1 y $2"
```

#### 3. Workflow de GitHub Actions:
El flujo de trabajo `main.yml` está en la carpeta `.github/workflows` y define los siguientes pasos:

   - **InfraConfig**: Ejecuta la Action que configura la infraestructura.
   - **Build**: Construye la aplicación (simulado con un echo).
   - **Deploy**: Despliega la aplicación (simulado con un echo).
   - **Tests**: Ejecuta la Action personalizada para los tests con dos parámetros.

#### Workflow YAML:
```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Configurar infraestructura
        uses: ./actions/infra-config

      - name: Build
        run: echo "Building"

      - name: Deploy
        run: echo "Deploying"

      - name: Ejecutar tests
        uses: ./actions/tests
        with:
          param1: 'Test1'
          param2: 'Test2'
```

Este taller tiene como propósito mejorar la modularidad del pipeline de GitHub Actions y facilitar su mantenimiento al externalizar la lógica de configuración y tests en Actions personalizadas.
