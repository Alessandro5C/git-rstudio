ozone_data = read.csv("data/ozone.csv", stringsAsFactors = FALSE)
View(ozone_data)

outliers_values = boxplot(ozone_data$pressure_height)$out
outliers_values

summary(ozone_data$pressure_height)

boxplot(ozone_data$pressure_height, main = "Pressure Heigh", boxwex = 0.5)

#boxwex es �til para a�adir un factor de escala que se aplica a la anchura de la caja 
#(menor a 1 la caja ser� m�s estrecha y mayor a 1 ser� m�s amplia)

boxplot(pressure_height ~ Month, data = ozone_data, main = "Pressure Height per Month")

boxplot(ozone_reading ~ Month, data = ozone_data, main = "Ozone reading per Month")

boxplot(ozone_reading ~ Month, data = ozone_data, main = "Ozone reading per Month")$out

fix_outliers <- function(x, removeNA = TRUE){
  #Calculamos los quantiles 1) por arriba del 5% y por debajo del 95%
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA)
  x
}

sin_outliers = fix_outliers(ozone_data$pressure_height)

#Visualizamos un par de boxplot
#Hay que especificar el n�mero de filas y columnas que tendr� el espacio donde se ver�n los boxplot
par(mfrow= c(1, 2))
boxplot(sin_outliers, main = "Presi�n sin Outliers")
boxplot(ozone_data$pressure_height, main = "Presi�n con Outliers")

replace_outliers <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  # si el outlier esta por debajo del cuartil 0.5 o por arriba de 0.95
  caps <- quantile(x, probs = c(.05, .95), na.rm = removeNA)
  # Calculamos el rango intercuartilico
  iqr <- qrts[2]-qrts[1]
  # Calculamos el 1.5 veces el rango intercuartiligo (iqr)
  altura <- 1.5*iqr
  #reemplazamos del vector los outliers por debajo de 0.05 y 0.095
  x[x<qrts[1]-altura] <- caps[1]
  x[x>qrts[2]+altura] <- caps[2]
  x
}

par(mfrow = c(1,2))
boxplot(ozone_data$pressure_height, main = "Presi�n con Outliers")
boxplot(replace_outliers(ozone_data$pressure_height), main = "Presi�n sin Outliers")
