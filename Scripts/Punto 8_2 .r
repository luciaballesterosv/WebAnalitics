
# ------------------------------------------------------
# Punto 8 (D, E Y G)
# ------------------------------------------------------

# Cargar librerías

library(moments)
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


#---------PUNTO D--------------------------------------------------------

#Calculo 
media <- mean(Datos$`Lbs. Sold`, na.rm = TRUE)
desv  <- sd(Datos$`Lbs. Sold`, na.rm = TRUE)
n     <- nrow(Datos)


#Construir dataframe
teorico <- data.frame(
  Intervalo = c("mean ±1 sd", "mean ±2 sd", "mean ±3 sd"),
  Theoretical_pct = c(0.68, 0.95, 0.997),
  Theoretical_obs = c(0.68, 0.95, 0.997) * n
)

#Calcular z
Datos <- Datos %>% 
  mutate(z = (`Lbs. Sold` - media) / desv)


#Observaciones
obs_1 <- sum(Datos$z >= -1 & Datos$z <= 1, na.rm = TRUE)
obs_2 <- sum(Datos$z >= -2 & Datos$z <= 2, na.rm = TRUE)
obs_3 <- sum(Datos$z >= -3 & Datos$z <= 3, na.rm = TRUE)

real <- c(obs_1, obs_2, obs_3)

#Tabla
tabla_regla <- teorico %>%
  mutate(Actual_obs = real,
         Actual_pct = real / n) %>%
  gt() %>%
  tab_header(
    title = "Regla Empírica aplicada a Lbs"
  ) %>%
  fmt_number(
    columns = c(Theoretical_obs, Actual_obs),
    decimals = 0
  ) %>%
  fmt_percent(
    columns = c(Theoretical_pct, Actual_pct),
    decimals = 1
  )

tabla_regla

#---------PUNTO E--------------------------------------------------------

intervalos <- data.frame(
  Intervalo = c(
    "0 a +1 sd", "0 a -1 sd",
    "+1 sd a +2 sd", "-1 sd a -2 sd",
    "+2 sd a +3 sd", "-2 sd a -3 sd"
  ),
  Theoretical_pct = c(
    0.34, 0.34,   # de 0 a ±1σ
    0.135, 0.135, # de ±1σ a ±2σ
    0.022, 0.022  # de ±2σ a ±3σ
  )
)

# Calcular observaciones reales en cada intervalo
actual <- c(
  sum(Datos$z >= 0   & Datos$z <= 1, na.rm = TRUE),  # 0 a +1σ
  sum(Datos$z <= 0   & Datos$z >= -1, na.rm = TRUE), # 0 a -1σ
  sum(Datos$z > 1    & Datos$z <= 2, na.rm = TRUE),  # +1 a +2σ
  sum(Datos$z < -1   & Datos$z >= -2, na.rm = TRUE), # -1 a -2σ
  sum(Datos$z > 2    & Datos$z <= 3, na.rm = TRUE),  # +2 a +3σ
  sum(Datos$z < -2   & Datos$z >= -3, na.rm = TRUE)  # -2 a -3σ
)

# Completar tabla
tabla_E <- intervalos %>%
  mutate(
    Theoretical_obs = Theoretical_pct * n,
    Actual_obs = actual,
    Actual_pct = actual / n
  ) %>%
  gt() %>%
  tab_header(
    title = "Distribución por intervalos de desviación estándar"
  ) %>%
  fmt_number(
    columns = c(Theoretical_obs, Actual_obs),
    decimals = 0
  ) %>%
  fmt_percent(
    columns = c(Theoretical_pct, Actual_pct),
    decimals = 1
  )

tabla_E

#---------PUNTO G--------------------------------------------------------

# Calcular asimetría y curtosis
asimetria <- skewness(Datos$`Lbs. Sold`, na.rm = TRUE)
curtosis <- kurtosis(Datos$`Lbs. Sold`, na.rm = TRUE)

# Mostrar resultados
print(asimetria)
print(curtosis)
