# Transformación XML con XSLT

Este proyecto genera tres páginas web dinámicas a partir de un único documento XML mediante XSLT. Cada vista utiliza filtrado y transformaciones específicas para mostrar información del jardín botánico.

## Contenido del proyecto
* zonas.xml + zonas.xsl: Muestra las zonas abiertas antes o a las 10:00 y marca en azul las ubicaciones que contienen “Exterior”.
* plantas.xml + plantas.xsl: Muestra nombre común, imagen, luminosidad y enlace dinámico a Wikipedia. Añade un icono si la luminosidad es alta.
* actividades.xml + actividades.xsl: Filtra por mes usando una variable, ordena actividades por fecha, genera responsables y usa únicamente plantillas (apply-templates).

## Estructura
```aiignore
index.html
css/
img/
web/
  zonas.xml
  plantas.xml
  actividades.xml
  zonas.xsl
  plantas.xsl
  actividades.xsl
```

## Funcionamiento

Los archivos .xml incluyen la instrucción:
```<?xml-stylesheet type="text/xsl" href="archivo.xsl"?>```

Al abrir cada XML en un navegador, se aplica la transformación XSLT y se genera la página HTML resultante.

## Requisitos cumplidos
* Transformaciones XSLT independientes para zonas, plantas y actividades
* Filtrado y ordenación mediante XPath
* Uso de plantillas en la vista de actividades
* Cálculo del número de responsables
* Proyecto preparado para publicación en GitHub Pages