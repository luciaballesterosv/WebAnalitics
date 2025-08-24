# ------------------------------------------------------
# Punto 10 - Representación gráfica
# ------------------------------------------------------

library(readxl)
library(tidyverse)

ruta <- "C:/Users/LENOVO/OneDrive/Documentos/GitHub/WebAnalitics/Datos/Web_Analytics.xls"

# ==========================
# 1. Weekly Visits
# ==========================
visitas <- read_excel(ruta, sheet = "Weekly Visits", skip = 5)
colnames(visitas) <- c("Semana", "Visitas", "Visitas_Unicas", "Pageviews",
                       "Paginas_por_visita", "Tiempo_en_sitio", "Bounce_Rate", "Nuevas_Visitas")

# Línea para visitas semanales
ggplot(visitas, aes(x = Semana, y = Visitas)) +
  geom_line(color = "#2c7fb8", linewidth = 1) +
  labs(title = "Visitas semanales al sitio",
       x = "Semana", y = "Número de visitas") +
  theme_minimal(base_size = 14)

# Conclusión: Se observa una tendencia descendente en las visitas después de la promoción.


# ==========================
# 2. Financials
# ==========================
finanzas <- read_excel(ruta, sheet = "Financials", skip = 5)
colnames(finanzas) <- c("Semana", "Revenue", "Profit", "Lbs_Sold", "Inquiries")

# Línea para ingresos
ggplot(finanzas, aes(x = Semana, y = Revenue)) +
  geom_line(color = "#1a9850", linewidth = 1) +
  labs(title = "Ingresos semanales",
       x = "Semana", y = "Ingresos (USD)") +
  theme_minimal(base_size = 14)

# Conclusión: Los ingresos presentan picos tras la promoción, aunque no sostienen un crecimiento estable.


# ==========================
# 3. Lbs. Sold (Histórico)
# ==========================
lbs <- read_excel(ruta, sheet = "Lbs. Sold", skip = 4)
colnames(lbs) <- c("Semana", "Lbs_Sold")

# Línea para evolución histórica
ggplot(lbs, aes(x = Semana, y = Lbs_Sold)) +
  geom_line(color = "#d73027", linewidth = 0.8) +
  labs(title = "Libras vendidas por semana (2005–2010)",
       x = "Semana", y = "Libras vendidas") +
  theme_minimal(base_size = 14)

# Conclusión: Las ventas muestran altibajos y caídas notorias después de 2008.


# ==========================
# 4. Daily Visits
# ==========================
diario <- read_excel(ruta, sheet = "Daily Visits", skip = 4)
colnames(diario) <- c("Dia", "Visitas")

# Histograma de la distribución de visitas diarias
ggplot(diario, aes(x = Visitas)) +
  geom_histogram(bins = 30, fill = "#74add1", color = "white") +
  labs(title = "Distribución de visitas diarias",
       x = "Número de visitas", y = "Frecuencia") +
  theme_minimal(base_size = 14)

# Conclusión: La mayoría de los días el sitio recibe entre 150 y 250 visitas,
# con algunos picos poco frecuentes.


# ==========================
# 5. Demographics (Fuentes de tráfico)
# ==========================
demografia <- read_excel(ruta, sheet = "Demographics", skip = 6, n_max = 4)
colnames(demografia) <- c("Fuente", "Visitas")

# Barras por fuente
ggplot(demografia, aes(x = reorder(Fuente, -Visitas), y = Visitas, fill = Fuente)) +
  geom_bar(stat = "identity") +
  labs(title = "Fuentes de tráfico al sitio",
       x = "Fuente", y = "Número de visitas") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")

# Conclusión: La mayor parte del tráfico provino de sitios de referencia y buscadores,
# destacándose Google como principal motor.
