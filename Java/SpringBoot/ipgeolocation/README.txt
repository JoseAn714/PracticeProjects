# Proyecto de Spring Boot. Por José Antonio Lizarraga Urzaiz  

## Generalidades  

El proyecto consiste en la obtención de la dirección IP del usuario para poder obtener su geolocalización y desplegarla en un mapa de OpenStreetMap.  

El proyecto usa las herramientas de Spring Boot y está basado en la tecnología de Maven.  

## Archivos dentro de src\main\java\com\springbootproject

* **Carpeta service:** En esta carpeta se encuentra el archivo LocationService.jar, en el cual se encuentran los servicios empleados con los que se obtienen: la IP, información que conlleva la IP, la URL que redirige a la ubicación en OpenStreetMap y la URL que redirige a la ubicación en OpenStreetMap en un formato de HTML embebido.
* **Carpeta controller:** En esta carpeta se encuentra el archivo WebController.jar, en donde se generan los modelos que se emplearán en el archivo HTML para el despliegue gráfico en el navegador.
* **Archivo IpgeolocationApplication.jar:** A través de este archivo es que se realiza la ejecución del código y se inicia el programa.

## Dependencias utilizadas

Dentro de pom.xml se incluyeron las dependencias:

* Starter Test
* Starter Web
* Thymeleaf  
* DevTools
* org.json
* commons-io

## src\main\java\resources\templates\map.html

Con este archivo HTML se ejecutan las siguientes acciones generales:

* Despliegue de la siguiente información: IP, localización (latitud y longitud) y URL del HTML embebido.  
* Despliegue de botón, con la leyenda "Where Am I?", vinculado a una función de jQuery que habilitará la presentación del mapa.
* Despliegue del marco para la presentación del mapa de OpenStreetMap.
* Nota: La información se obtiene de los atributos añadidos al modelo en el controlador WebController.java.

## Operación del programa

1. Al iniciar el programa se muestra inmediatamente en pantalla:

* IP.
* Latitud y longitud.
* URL de HTML embebido.
* Botón "Where Am I?".
* Espacio en blanco del *iframe*.

2. Tras darle *click* al botón "Where Am I?" se realiza el despliegue del mapa embebido de OpenStreetMap.

* El mapa incluye en la parte inferior un hipervínculo "View Larger Map" para acceder a la página de OpenStreetMap con el marcador de la ubicación exacta.

## Levantamiento y prueba del código

* Iniciar una interfaz de línea de comandos.
* Dirigirse a la carpeta del proyecto **ipgeolocation/**.
* Ejecutar el comando **mvn clean install**.
  * Es necesario tener instalado Maven
* Ejecutar el comando **java -jar .\target\ipgeolocation-0.0.1-SNAPSHOT.jar** para iniciar el servicio.
* En el buscador del algún navegador insertar [http://localhost:8080/](http://localhost:8080/).
* La terminación del proceso se realiza a tarvés de la línea de comandos.
* **Nota:** En caso de marcar error, recargar la página del navegador.
