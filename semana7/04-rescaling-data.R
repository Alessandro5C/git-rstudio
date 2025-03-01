#Dependencias
#install.packages("scales")
#library(scales)

estudiantes = read.csv("data/data-conversion.csv")
View(estudiantes)
#Rescalar el valor Income de 0 a 1 
estudiantes$Income.rescaled = rescale(estudiantes$Income)
View(estudiantes)
#Esta l�nea hace lo mismo que la anterior mediante una f�rmula matem�tica
(estudiantes$Income - min(estudiantes$Income)) / (max(estudiantes$Income)- min(estudiantes$Income))
#A diferencia de la funci�n rescale, esta f�rmula no nos ofrece la 
# posibilidad de elegir nuestros l�mites como par�metros

#Funci�n para resacalar todas las columnas que no hayan sido rescaladas
rescalar.cols <- function(df, cols){
  nombres <- names(df)
  for (col in cols){
    nombre <- paste(nombres[col], 'rescaled', sep = '.')
    df[nombre] <- rescale(df[,col])
    }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  df
}

estudiantes = rescalar.cols(estudiantes, c(1,4))
View(estdiantes)