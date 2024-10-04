# 015 GitHub Actions 1

## Objetivo
Iniciarse en GitHub Actions desarrollando nuestro primer pipeline básico y aprendiendo la utilidad de las matrices.
 
## Desarrollo de tu primer pipeline
Tras haber utilizado Jenkins como motor de integración continua durante años, como CTO de TuEmpresa, decides migrar los pipelines a GitHub, donde tiene almacenado el código, para reducir los gatos de mantenimiento e infraestructura. Para ello decides hacer una primer PoC con un microservicio, desarrollando su pipeline de Ci/CD en GitHub Actions.

## Implementación:
Crea un repositorio de GitHub que contendrá el código de tu aplicación(no es necesario añadir código), la pipeline que vas a desarrollar(dentro de la carpeta .github/workflows) y los tests de la aplicación(deberá haber 3 archivos test1.sh, test2.sh y test3.sh que simplemente contengan un echo “Soy el test x”).
Dentro del pipeline tendrá que haber tantos steps como tu consideres necesarios para completar el CI/CD de un microservicio.
Al menos uno de esos steps deberá ser el test de la aplicación, el ultimo step, que deberá ejecutar de forma paralela los 3 tests utilizando una matriz.
 
## Tips
https://docs.github.com/en/actions
https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow