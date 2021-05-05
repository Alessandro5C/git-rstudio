#Dependencias
#install.packages("dummies")
#library(dummies)

estudiantes = read.csv("data/data-conversion.csv")
View(estudiantes)

niveles = c(-Inf, 10000, 31000, Inf)
nom_nivel = c('Bajo', 'Medio', 'Alto')

estudiantes$Income_cut = cut(estudiantes$Income, breaks = niveles, labels = nom_nivel)
View(estudiantes)

str(estudiantes)

estudiantes$Income_cut2 = cut(estudiantes$Income, breaks = 4,labels = c("Nivel 1", "Nivel 2", "Nivel 3", "Nivel 4"))
                               
str(niveles)

#DO NOT RUN ALL THE SCRIPT AT THE SAME TIME

#variables ficticias
estudiantes = read.csv("data/data-conversion.csv")
estudiantes_dummy <- dummy.data.frame(estudiantes, sep = ".")

names(estudiantes_dummy)
View(estudiantes_dummy)

dummy(estudiantes$State, sep=".")
dummy.data.frame(estudiantes, names =  c("State"), sep =".")

dummy.data.frame(estudiantes, names = c("State", "Gender"), sep =".")

#END