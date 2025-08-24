
# ------------------------------------------------------
# Punto 8 (A Y B)
# ------------------------------------------------------

# Cargar librerías
library(readxl)
library(tidyverse)
library(gt)

# Definir ruta del archivo (ajusta si tu archivo tiene otro nombre o ubicación)
ruta <- "C:/Users/LENOVO/OneDrive/Documentos/GitHub/WebAnalitics/Datos/Web_Analytics.xls"

#Importar hoja 
Datos <- read_excel(ruta, sheet = "Lbs. Sold", skip = 4)

# Verificar los datos 
glimpse(Datos)
head(Datos)


#---------PUNTO A--------------------------------------------------------

#Reenombrar data
colnames(Datos) <- c("Semana", "Lbs_Sold")

#Estadisticas ventas por producto

resumen_lbs <- Datos %>%
  summarise(
    media = mean(Lbs_Sold, na.rm = TRUE),
    mediana = median(Lbs_Sold, na.rm = TRUE),
    desviacion = sd(Lbs_Sold, na.rm = TRUE),
    minimo = min(Lbs_Sold, na.rm = TRUE),
    maximo = max(Lbs_Sold, na.rm = TRUE)
  )

print(resumen_lbs)

resumen_tabla <- resumen_lbs %>%
  gt() %>%
  tab_header(
    title = "Resumen Estadístico - Lbs Sold"
  ) %>%
  fmt_number(
    decimals = 2
  )

# Mostrar tabla
resumen_tabla

#---------PUNTO B--------------------------------------------------------

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

