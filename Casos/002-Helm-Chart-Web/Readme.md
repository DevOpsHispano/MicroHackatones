# 002 Helm Chart Web

Vas a crear un Helm Chart para desplegar una aplicación web llamada "WebAppX" (donde X será un número a elegir por vosotros). La aplicación es simple y consta de un servidor web que sirve una página HTML básica que podéis encontrar en esta imagen (usadla!): https://github.com/cloudogu/hello-k8s

## Requisitos de la Aplicación
	1. Servidor Web:
		○ La aplicación utiliza un servidor web https://github.com/cloudogu/hello-k8s.
		○ Haced por forwading para ver la ver la web.
	2. Página HTML:
		○ La imagen ya viene con un servidor web y un contenido customizable.

## Requisitos de Chart de Helm
	1. Valores Configurables:
		○ Nombre de la aplicación.
		○ Puerto donde escucha la aplicación.
		○ Mensaje (mirar documentación de la imagen hello-k8s).
		○ Posibilidad de cambiar el número de replicas.

Una vez desplegada la primera aplicación, desplegar 2 más con el mismo Chart solo cambiando el nombre, el mensaje y el puerto de la aplicación.

## TIPS
helm create

-f
	

