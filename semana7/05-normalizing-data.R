casas = read.csv("data/BostonHousing.csv")
View(casas)

#Normaliza (por defecto parametro center & scale = TRUE)
casas_z = scale(casas)
View(casas_z)

#Habilita la resta de la media
casas_mean = scale(casas, center = TRUE, scale = FALSE)
#Ajusta la normalización al promedio
View(casas_mean)

#Habilita la división entre la desviación estándar
casas_sd = scale(casas, center = FALSE, scale = TRUE)
#Ajusta la normalización a la desviación estándar
View(casas_sd)

normalizar.cols <- function(df, cols){
  nombres <- names(df)
  for (col in cols){
    nombre <- paste(nombres[col], "z", sep = ".")
    df[nombre]<- scale(df[,col])
    }
  cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
  df
}


casas = normalizar.cols(casas, c(1, 3, 5, 8))
View(casas)
