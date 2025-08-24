# Using data in the Weekly Visits and Financials worksheets, create four column charts 
# (like Figure 1: Visits to the QA Website per Week) for unique visits over time, 
# revenue over time, profit over time, and pounds sold over time. You do not have to indicate 
# on these charts the cutoffs for the four periods.

setwd("/Users/Lucia/Documents/Analítica de datos")
getwd()

install.packages("tidyverse")
library(tidyverse)  

install.packages("readxl")
library(readxl)

caso <- read_excel("Web_Analytics-2.xls", sheet = "Weekly Visits")
glimpse(caso)
head(caso)  

colnames(caso)

caso %>%
  group_by(semana) %>%
  summarize(
    visitas_unicas = sum(visitas_unicas, na.rm = TRUE),
    ingresos = sum(ingresos, na.rm = TRUE),
    ganancias = sum(ganancias, na.rm = TRUE),
    libras_vendidas = sum(libras_vendidas, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = c(visitas_unicas, ingresos, ganancias, libras_vendidas), 
               names_to = "Métrica", values_to = "Valor") %>%
  ggplot(aes(x = Fecha, y = Valor, fill = Métrica)) +
  geom_col(position = "dodge") +
  labs(title = "Métricas a lo largo del tiempo",
       x = "Fecha",
       y = "Valor") +
  theme_minimal() +
  theme(legend.position = "top")

tabla1 = caso %>%
  group_by(semana) %>%
  summarize(
    visitas_unicas = sum(visitas_unicas, na.rm = TRUE),
    ingresos = sum(ingresos, na.rm = TRUE),
    ganancias = sum(ganancias, na.rm = TRUE),
    libras_vendidas = sum(libras_vendidas, na.rm = TRUE)
  )

print(tabla1)

# Cuatro gráficos de barras separados

# Gráfico de visitas únicas
ggplot(tabla1, aes(x = semana, y = visitas_unicas)) +
  geom_col(fill = "steelblue") +
  labs(title = "Visitas Únicas por Semana",
       x = "Semana",
       y = "Visitas Únicas") +
  theme_minimal()   

# Gráfico de ingresos
ggplot(tabla1, aes(x = semana, y = ingresos)) +
  geom_col(fill = "forestgreen") +
  labs(title = "Ingresos por Semana",
       x = "Semana",
       y = "Ingresos") +
  theme_minimal()   

# Gráfico de ganancias
ggplot(tabla1, aes(x = semana, y = ganancias)) +
  geom_col(fill = "darkorange") +
  labs(title = "Ganancias por Semana",                      
       x = "Semana",
       y = "Ganancias") +
  theme_minimal()  

# Gráfico de libras vendidas
ggplot(tabla1, aes(x = semana, y = libras_vendidas)) +
  geom_col(fill = "purple") +
  labs(title = "Libras Vendidas por Semana",
       x = "Semana",
       y = "Libras Vendidas") +
  theme_minimal()

# ------------------------------------------------------------

# 2) Using the same data, calculate the following summary statistics for visits, unique visits, revenue,
# profit, and pounds sold: mean, median, standard deviation, minimum, and maximum, for the initial, 
# pre-promotion, promotion, and post-promotion periods. So, for each period you should provide 25 values: 
# five summary measures for each of five variables, as per the table below for the initial period.

tabla_inicial <- caso %>%
  summarise(
    media_visitas = mean(visitas_inicial, na.rm = TRUE),
    mediana_visitas = median(visitas_inicial, na.rm = TRUE),
    desviacion_visitas = sd(visitas_inicial, na.rm = TRUE),
    minimo_visitas = min(visitas_inicial, na.rm = TRUE),
    maximo_visitas = max(visitas_inicial, na.rm = TRUE), 

    media_visitasu = mean(visitas_unicas_inicial, na.rm = TRUE),
    mediana_visitasu = median(visitas_unicas_inicial, na.rm = TRUE),
    desviacion_visitasu = sd(visitas_unicas_inicial, na.rm = TRUE),
    minimo_visitasu = min(visitas_unicas_inicial, na.rm = TRUE),
    maximo_visitasu = max(visitas_unicas_inicial, na.rm = TRUE),

    media_ingresos = mean(ingresos_inicial, na.rm = TRUE),
    mediana_ingresos = median(ingresos_inicial, na.rm = TRUE),
    desviacion_ingresos = sd(ingresos_inicial, na.rm = TRUE),
    minimo_ingresos = min(ingresos_inicial, na.rm = TRUE),
    maximo_ingresos = max(ingresos_inicial, na.rm = TRUE),

    media_ganancias = mean(ganancias_inicial, na.rm = TRUE),
    mediana_ganancias = median(ganancias_inicial, na.rm = TRUE),
    desviacion_ganancias = sd(ganancias_inicial, na.rm = TRUE),
    minimo_ganancias = min(ganancias_inicial, na.rm = TRUE),
    maximo_ganancias = max(ganancias_inicial, na.rm = TRUE),

    media_libras = mean(libras_vendidas_inicial, na.rm = TRUE),
    mediana_libras = median(libras_vendidas_inicial, na.rm = TRUE),
    desviacion_libras = sd(libras_vendidas_inicial, na.rm = TRUE),
    minimo_libras = min(libras_vendidas_inicial, na.rm = TRUE),
    maximo_libras = max(libras_vendidas_inicial, na.rm = TRUE)


  )

print (tabla_inicial)

tabla_pre <- caso %>%
  summarise(
    media_visitas = mean(visitas_pre, na.rm = TRUE),
    mediana_visitas = median(visitas_pre, na.rm = TRUE),
    desviacion_visitas = sd(visitas_pre, na.rm = TRUE),
    minimo_visitas = min(visitas_pre, na.rm = TRUE),
    maximo_visitas = max(visitas_pre, na.rm = TRUE), 

    media_visitasu = mean(visitas_unicas_pre, na.rm = TRUE),
    mediana_visitasu = median(visitas_unicas_pre, na.rm = TRUE),
    desviacion_visitasu = sd(visitas_unicas_pre, na.rm = TRUE),
    minimo_visitasu = min(visitas_unicas_pre, na.rm = TRUE),
    maximo_visitasu = max(visitas_unicas_pre, na.rm = TRUE),

    media_ingresos = mean(ingresos_pre, na.rm = TRUE),
    mediana_ingresos = median(ingresos_pre, na.rm = TRUE),
    desviacion_ingresos = sd(ingresos_pre, na.rm = TRUE),
    minimo_ingresos = min(ingresos_pre, na.rm = TRUE),
    maximo_ingresos = max(ingresos_pre, na.rm = TRUE),

    media_ganancias = mean(ganancias_pre, na.rm = TRUE),
    mediana_ganancias = median(ganancias_pre, na.rm = TRUE),
    desviacion_ganancias = sd(ganancias_pre, na.rm = TRUE),
    minimo_ganancias = min(ganancias_pre, na.rm = TRUE),
    maximo_ganancias = max(ganancias_pre, na.rm = TRUE),

    media_libras = mean(libras_vendidas_pre, na.rm = TRUE),
    mediana_libras = median(libras_vendidas_pre, na.rm = TRUE),
    desviacion_libras = sd(libras_vendidas_pre, na.rm = TRUE),
    minimo_libras = min(libras_vendidas_pre, na.rm = TRUE),
    maximo_libras = max(libras_vendidas_pre, na.rm = TRUE)


  )
print (tabla_pre)

tabla_promo <- caso %>%
  summarise(
    media_visitas = mean(visitas_promo, na.rm = TRUE),
    mediana_visitas = median(visitas_promo, na.rm = TRUE),
    desviacion_visitas = sd(visitas_promo, na.rm = TRUE),
    minimo_visitas = min(visitas_promo, na.rm = TRUE),
    maximo_visitas = max(visitas_promo, na.rm = TRUE), 

    media_visitasu = mean(visitas_unicas_promo, na.rm = TRUE),
    mediana_visitasu = median(visitas_unicas_promo, na.rm = TRUE),
    desviacion_visitasu = sd(visitas_unicas_promo, na.rm = TRUE),
    minimo_visitasu = min(visitas_unicas_promo, na.rm = TRUE),
    maximo_visitasu = max(visitas_unicas_promo, na.rm = TRUE),

    media_ingresos = mean(ingresos_promo, na.rm = TRUE),
    mediana_ingresos = median(ingresos_promo, na.rm = TRUE),
    desviacion_ingresos = sd(ingresos_promo, na.rm = TRUE),
    minimo_ingresos = min(ingresos_promo, na.rm = TRUE),
    maximo_ingresos = max(ingresos_promo, na.rm = TRUE),

    media_ganancias = mean(ganancias_promo, na.rm = TRUE),
    mediana_ganancias = median(ganancias_promo, na.rm = TRUE),
    desviacion_ganancias = sd(ganancias_promo, na.rm = TRUE),
    minimo_ganancias = min(ganancias_promo, na.rm = TRUE),
    maximo_ganancias = max(ganancias_promo, na.rm = TRUE),

    media_libras = mean(libras_vendidas_promo, na.rm = TRUE),
    mediana_libras = median(libras_vendidas_promo, na.rm = TRUE),
    desviacion_libras = sd(libras_vendidas_promo, na.rm = TRUE),
    minimo_libras = min(libras_vendidas_promo, na.rm = TRUE),
    maximo_libras = max(libras_vendidas_promo, na.rm = TRUE)


  )
print (tabla_promo)

tabla_post_promo <- caso %>%
  summarise(
    media_visitas = mean(visitas_post_promo, na.rm = TRUE),
    mediana_visitas = median(visitas_post_promo, na.rm = TRUE),
    desviacion_visitas = sd(visitas_post_promo, na.rm = TRUE),
    minimo_visitas = min(visitas_post_promo, na.rm = TRUE),
    maximo_visitas = max(visitas_post_promo, na.rm = TRUE), 

    media_visitasu = mean(visitas_unicas_post_promo, na.rm = TRUE),
    mediana_visitasu = median(visitas_unicas_post_promo, na.rm = TRUE),
    desviacion_visitasu = sd(visitas_unicas_post_promo, na.rm = TRUE),
    minimo_visitasu = min(visitas_unicas_post_promo, na.rm = TRUE),
    maximo_visitasu = max(visitas_unicas_post_promo, na.rm = TRUE),

    media_ingresos = mean(ingresos_post_promo, na.rm = TRUE),
    mediana_ingresos = median(ingresos_post_promo, na.rm = TRUE),
    desviacion_ingresos = sd(ingresos_post_promo, na.rm = TRUE),
    minimo_ingresos = min(ingresos_post_promo, na.rm = TRUE),
    maximo_ingresos = max(ingresos_post_promo, na.rm = TRUE),

    media_ganancias = mean(ganancias_post_promo, na.rm = TRUE),
    mediana_ganancias = median(ganancias_post_promo, na.rm = TRUE),
    desviacion_ganancias = sd(ganancias_post_promo, na.rm = TRUE),
    minimo_ganancias = min(ganancias_post_promo, na.rm = TRUE),
    maximo_ganancias = max(ganancias_post_promo, na.rm = TRUE),

    media_libras = mean(libras_vendidas_post_promo, na.rm = TRUE),
    mediana_libras = median(libras_vendidas_post_promo, na.rm = TRUE),
    desviacion_libras = sd(libras_vendidas_post_promo, na.rm = TRUE),
    minimo_libras = min(libras_vendidas_post_promo, na.rm = TRUE),
    maximo_libras = max(libras_vendidas_post_promo, na.rm = TRUE)


  )
print (tabla_post_promo)

# crear graficos de barras para la media de cada variable en cada periodo

ggplot() +
  geom_col(data = tabla_inicial, aes(x = "Inicial", y = mean(visitas_inicial, na.rm = TRUE)), fill = "steelblue") +
  geom_col(data = tabla_pre, aes(x = "Pre-Promoción", y = mean(visitas_pre, na.rm = TRUE)), fill = "forestgreen") +
  geom_col(data = tabla_promo, aes(x = "Promoción", y = mean(visitas_promo, na.rm = TRUE)), fill = "darkorange") +
  geom_col(data = tabla_post_promo, aes(x = "Post-Promoción", y = mean(visitas_post_promo, na.rm = TRUE)), fill = "purple") +
  labs(title = "Media de Visitas por Periodo",
       x = "Periodo",
       y = "Media de Visitas") +
  theme_minimal()

# scatter plots y coeficiente de correlación relacion entre ingresos y libras vendidas

ggplot(caso, aes(x = ingresos, y = libras_vendidas)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(title = "Relación entre Ingresos y Libras Vendidas",
       x = "Ingresos",
       y = "Libras Vendidas") +
  theme_minimal()

correlacion <- cor(caso$ingresos, caso$libras_vendidas, use = "complete.obs")

caso%>%
correlacion = cor(ingresos, libras_vendidas)

# scatter plots y coeficiente de correlación relacion entre visitas e ingresos

ggplot(caso, aes(x = visitas, y = ingresos)) +
  geom_point(color = "red", alpha = 0.6) +
  labs(title = "Relación entre Visitas e Ingresos",
       x = "Visitas",
       y = "Ingresos") +
  theme_minimal()

  correlacion1 <- cor(caso$ingresos, caso$visitas, use = "complete.obs")
  print(correlacion1)