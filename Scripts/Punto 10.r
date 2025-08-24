# ------------------------------------------------------
# Graficas para todas las hojas del Excel
# ------------------------------------------------------
# Cargar librerías
library(readxl)
library(tidyverse)

# Definir ruta del archivo (ajusta si tu archivo tiene otro nombre o ubicación)
ruta <- "C:/Users/LENOVO/OneDrive/Documentos/GitHub/WebAnalitics/Datos/Web_Analytics.xls"

#Importar hoja 
Datos <- read_excel(ruta, sheet = "Lbs. Sold", skip = 4)

# Verificar los datos 
glimpse(Datos)
head(Datos)

#-----------Libras vendidas

# Revisar valores faltantes
sum(is.na(Datos$Lbs_Sold))

# Filtrar filas sin NA
datos_filtrado <- Datos |> 
  filter(!is.na(Lbs_Sold))

# Crear histograma
ggplot(Datos, aes(x = Lbs_Sold)) +
  geom_histogram(
    bins = ceiling(sqrt(nrow(Datos))),  # regla de Sturges aproximada
    fill = "#bebef3",
    color = "white"
  ) +
  labs(
    title = "Distribución de Libras Vendidas por Semana",
    x = "Libras vendidas",
    y = "Frecuencia"
  ) +
  theme_minimal(base_size = 14)



# -----------Demographics

#Importar hoja
demografia <- read_excel(ruta, sheet = "Demographics", skip = 6) 

# 1) All Traffic Sources
trafico <- tibble(
  Fuente = c("Referring Sites", "Search Engines", "Direct Traffic", "Other"),
  Visitas = c(38754, 20964, 9709, 4)
)

ggplot(trafico, aes(x = reorder(Fuente, -Visitas), y = Visitas, fill = Fuente)) +
  geom_bar(stat = "identity") +
  labs(title = "Fuentes de tráfico",
       x = "Fuente", y = "Número de visitas") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")

# Conclusión: La mayoría del tráfico provino de sitios de referencia,
# seguido por motores de búsqueda.


# 2) Top Ten Referring Sites
referring <- tibble(
  Sitio = c("googleads.g.doubleclick.net", "pagead2.googlesyndication.com", 
            "sedoparking.com", "globalspec.com", "searchportal.information.com",
            "freepatentsonline.com", "thomasnet.com", "mu.com",
            "mail.google.com", "psicofxp.com"),
  Visitas = c(15626, 8044, 3138, 693, 582, 389, 379, 344, 337, 310)
)

ggplot(referring, aes(x = reorder(Sitio, -Visitas), y = Visitas, fill = Sitio)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 sitios de referencia",
       x = "Sitio", y = "Número de visitas") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Conclusión: Google Ads fue el sitio de referencia más importante.


# 3) Top Ten Search Engines
search_engines <- tibble(
  Motor = c("google", "yahoo", "search", "msn", "aol", "ask", "live", "bing", "voila", "netscape"),
  Visitas = c(17681, 1250, 592, 424, 309, 268, 145, 122, 63, 26)
)

ggplot(search_engines, aes(x = reorder(Motor, -Visitas), y = Visitas, fill = Motor)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 motores de búsqueda",
       x = "Motor de búsqueda", y = "Número de visitas") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Conclusión: Google fue el motor de búsqueda dominante.


# 4) Geographic Sources
geografia <- tibble(
  Region = c("South America", "Northern America", "Central America", "Western Europe",
             "Eastern Asia", "Northern Europe", "Southern Asia", "South-Eastern Asia",
             "Southern Europe", "Eastern Europe"),
  Visitas = c(22616, 17509, 6776, 5214, 3228, 2721, 2589, 1968, 1538, 1427)
)

ggplot(geografia, aes(x = reorder(Region, -Visitas), y = Visitas, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 regiones geográficas",
       x = "Región", y = "Número de visitas") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Conclusión: La mayor parte del tráfico provino de Sudamérica y Norteamérica.


# 5) Browsers
browsers <- tibble(
  Navegador = c("Internet Explorer", "Firefox", "Opera", "Safari", "Chrome", 
                "Mozilla", "Netscape", "Konqueror", "SeaMonkey", "Camino"),
  Visitas = c(53080, 13142, 938, 850, 792, 478, 47, 31, 24, 9)
)

ggplot(browsers, aes(x = reorder(Navegador, -Visitas), y = Visitas, fill = Navegador)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 navegadores usados",
       x = "Navegador", y = "Número de visitas") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Conclusión: Internet Explorer fue el navegador más utilizado con amplia diferencia.


# 6) Operating Systems
os <- tibble(
  Sistema = c("Windows", "Macintosh", "Linux", "(not set)", "iPhone", 
              "SymbianOS", "FreeBSD", "iPod", "Playstation 3", "PSP"),
  Visitas = c(67063, 1184, 1045, 48, 29, 20, 18, 8, 4, 3)
)

ggplot(os, aes(x = reorder(Sistema, -Visitas), y = Visitas, fill = Sistema)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 sistemas operativos",
       x = "Sistema operativo", y = "Número de visitas") +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Conclusión: Windows fue, por mucho, el sistema operativo más común.


# ------------- Weekly Visits

#Importar hoja
weekly <- read_excel(ruta, sheet = "Weekly Visits", skip = 5)

colnames(weekly) <- c("Semana", "Visitas", "Visitas_Unicas", "Pageviews",
                      "Paginas_por_visita", "Tiempo_en_sitio",
                      "Bounce_Rate", "Nuevas_Visitas")

# Histograma de visitas semanales
ggplot(weekly, aes(x = Visitas)) +
  geom_histogram(bins = 30, fill = "#4575b4", color = "white") +
  labs(title = "Distribución de visitas semanales",
       x = "Número de visitas", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de páginas vistas
ggplot(weekly, aes(x = Pageviews)) +
  geom_histogram(bins = 30, fill = "#74add1", color = "white") +
  labs(title = "Distribución de páginas vistas por semana",
       x = "Pageviews", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de tiempo en sitio
ggplot(weekly, aes(x = Tiempo_en_sitio)) +
  geom_histogram(bins = 20, fill = "#fdae61", color = "white") +
  labs(title = "Distribución del tiempo promedio en el sitio (segundos)",
       x = "Segundos", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de tasa de rebote
ggplot(weekly, aes(x = Bounce_Rate)) +
  geom_histogram(bins = 20, fill = "#d73027", color = "white") +
  labs(title = "Distribución de la tasa de rebote (%)",
       x = "Bounce Rate", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de % de visitas nuevas
ggplot(weekly, aes(x = Nuevas_Visitas)) +
  geom_histogram(bins = 20, fill = "#1a9850", color = "white") +
  labs(title = "Distribución de % de visitas nuevas",
       x = "% Nuevas visitas", y = "Frecuencia") +
  theme_minimal(base_size = 14)


# ------------Finalcials
#Importar hoja
finanzas <- read_excel(ruta, sheet = "Financials", skip = 5)
colnames(finanzas) <- c("Semana", "Revenue", "Profit", "Lbs_Sold", "Inquiries")

# Histograma de ingresos
ggplot(finanzas, aes(x = Revenue)) +
  geom_histogram(bins = 30, fill = "#4575b4", color = "white") +
  labs(title = "Distribución de ingresos semanales",
       x = "Ingresos (USD)", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de ganancias
ggplot(finanzas, aes(x = Profit)) +
  geom_histogram(bins = 30, fill = "#1a9850", color = "white") +
  labs(title = "Distribución de ganancias semanales",
       x = "Profit (USD)", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de libras vendidas
ggplot(finanzas, aes(x = Lbs_Sold)) +
  geom_histogram(bins = 30, fill = "#d73027", color = "white") +
  labs(title = "Distribución de libras vendidas por semana",
       x = "Libras vendidas", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Histograma de solicitudes
ggplot(finanzas, aes(x = Inquiries)) +
  geom_histogram(bins = 10, fill = "#fdae61", color = "white") +
  labs(title = "Distribución de solicitudes semanales",
       x = "Número de solicitudes", y = "Frecuencia") +
  theme_minimal(base_size = 14)

#------------------Daily visits
#Importar hoja
diario <- read_excel(ruta, sheet = "Daily Visits", skip = 4)
colnames(diario) <- c("Dia", "Visitas")

ggplot(diario, aes(x = Visitas)) +
  geom_histogram(bins = 30, fill = "#74add1", color = "white") +
  labs(title = "Histograma - Visitas diarias",
       x = "Número de visitas", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Conclusión: La mayoría de los días el tráfico se concentró en un rango bajo-medio,
# con pocos picos de visitas excepcionales.

#-----------Weekly visits
# Importar la hoja
weekly_visits <- read_excel(ruta, sheet = "Weekly Visits", skip = 4)

# Renombrar columnas para que no tengan caracteres raros
colnames(weekly_visits) <- c("Week", "Visits", "Unique_Visits", "Pageviews",
                             "Pages_per_Visit", "Avg_Time_on_Site",
                             "Bounce_Rate", "Pct_New_Visits")

# Revisar los datos
glimpse(weekly_visits)


# Visits
ggplot(weekly_visits, aes(x = Visits)) +
  geom_histogram(bins = 20, fill = "#69b3a2", color = "white") +
  labs(title = "Histograma de Visits",
       x = "Número de visitas",
       y = "Frecuencia") +
  theme_minimal()

# Unique Visits
ggplot(weekly_visits, aes(x = Unique_Visits)) +
  geom_histogram(bins = 20, fill = "#ffcc66", color = "white") +
  labs(title = "Histograma de Unique Visits",
       x = "Visitas únicas",
       y = "Frecuencia") +
  theme_minimal()

# Pageviews
ggplot(weekly_visits, aes(x = Pageviews)) +
  geom_histogram(bins = 20, fill = "#9370db", color = "white") +
  labs(title = "Histograma de Pageviews",
       x = "Número de páginas vistas",
       y = "Frecuencia") +
  theme_minimal()

# Pages per Visit
ggplot(weekly_visits, aes(x = Pages_per_Visit)) +
  geom_histogram(bins = 20, fill = "#ff7f7f", color = "white") +
  labs(title = "Histograma de Pages per Visit",
       x = "Páginas por visita",
       y = "Frecuencia") +
  theme_minimal()

# Avg. Time on Site
ggplot(weekly_visits, aes(x = Avg_Time_on_Site)) +
  geom_histogram(bins = 20, fill = "#4db8ff", color = "white") +
  labs(title = "Histograma de Tiempo Promedio en el Sitio",
       x = "Tiempo (segundos)",
       y = "Frecuencia") +
  theme_minimal()

# Bounce Rate
ggplot(weekly_visits, aes(x = Bounce_Rate)) +
  geom_histogram(bins = 20, fill = "#90ee90", color = "white") +
  labs(title = "Histograma de Bounce Rate",
       x = "Porcentaje de rebote",
       y = "Frecuencia") +
  theme_minimal()

# % New Visits
ggplot(weekly_visits, aes(x = Pct_New_Visits)) +
  geom_histogram(bins = 20, fill = "#ffa07a", color = "white") +
  labs(title = "Histograma de % New Visits",
       x = "Porcentaje de nuevas visitas",
       y = "Frecuencia") +
  theme_minimal()