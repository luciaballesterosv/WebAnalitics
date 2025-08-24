# Analítica Web en Quality Alloys, Inc.

POR DANIELA PLATA Y LUCÍA BALLESTEROS

## Afiliación académica  
Estudiante, Pontificia Universidad Javeriana  
Estudiante, Pontificia Universidad Javeriana  

## Agradecimientos
Este trabajo fue desarrollado como parte del curso Analítica de Negocios en la Pontificia Universidad Javeriana.

## Derechos de autor
©2025 Daniela Plata & Lucía Ballesteros. Este repositorio ha sido creado con fines académicos y no representa un aval ni un juicio sobre el material incluido.

# RESUMEN
Quality Alloys, Inc. (QA) es una empresa estadounidense de distribución de aleaciones industriales con ventas anuales menores a 75 millones de dólares. Su propuesta de valor se centra en vender en pequeñas cantidades, cortar materiales a medida con gran precisión y realizar envíos rápidos, lo que le permite atender a pequeñas compañías que no pueden comprar directamente a los productores. En 2008, QA lanzó su página web con el objetivo de ampliar su alcance comercial en Estados Unidos, Europa y Asia, generar nuevas ventas y fortalecer su marca. El reto principal de la empresa es evaluar la efectividad de sus iniciativas digitales —como Google Analytics, Google Ads y campañas promocionales tradicionales— para determinar el impacto real en visitas, consultas, ventas y rentabilidad.

# CONTENIDO
* _Carpeta Datos:_
        Contiene archivo de base de datos Web_Analytics.xls y archivo con los puntos a desarrollar Web_Analytics.pdf.

* _Carpeta Resultados:_
        Contiene Caso1_Web Analytics.docx y Caso1_Web Analytics.pdf con el informe de resultados de cada uno de los puntos del caso justificados.

* _Carpeta Graficas:_
  Contiene imagenes .png de cada una de las graficas pedidas en Web_Analytics.pdf:
  + Distibucion_Intervalos_Desviacion_Estandar_Lbs_Sold.PNG (Correspondiente al punto 8a)
  + Histograma_Lbs_Sold.PNG (Correspondiente al punto 8b)
  + Regla_Empirica_Lbs_Sold.PNG (Correspondiente al punto 8d)
  + Resumen_Estadistico_Lbs_Sold.PNG (Correspondiente al punto 8e)

* _Carpeta Scripts:_
        Contiene un archivo .r para cada uno de los puntos propuestos en Web_Analytics.pdf.

## Lenguaje
El proyecto está desarrollado en R, un lenguaje y entorno de programación especializado en análisis estadístico, visualización de datos y modelado.
En este repositorio, R se utilizó principalmente para:
+ Calcular medidas descriptivas de los datos (media, desviación estándar).
+ Estimar intervalos y porcentajes teóricos de la distribución normal.
+ Comparar los resultados observados contra los teóricos.
+ Medir ajuste a la normalidad mediante asimetría y curtosis.
+ Visualizar resultados en tablas y gráficos.

## Librerias 
El repositorio contiene las siguientes librerias:
    1. library(moments): 
    Proporciona funciones para calcular medidas de forma estadística, como la asimetría y la curtosis, que ayudan a evaluar la distribución de los datos.
    2. library(readxl): 
    Permite leer archivos de Excel (.xls y .xlsx) directamente en R sin necesidad de programas externos. Es muy útil para importar bases de datos en hojas de cálculo.
    3. library(tidyverse): 
    Es un conjunto de paquetes integrados (como dplyr, ggplot2, tidyr) diseñados para el manejo, transformación y visualización de datos de forma ordenada, clara y eficiente.
    4. library(gt): 
    Facilita la creación de tablas bien formateadas y estéticamente agradables directamente desde R, útiles para reportes y presentación de resultados.
