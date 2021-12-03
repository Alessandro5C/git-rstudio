data = read.csv("files/missing-data.csv", na.strings = "" )
data$Income[data$Income == 0] = NA
data$Income.mean = 
  ifelse(is.na(data$Income),
    mean(data$Income, na.rm = TRUE), #si se cumple la condición
    data$Income) #si no se cumple la condición

source("replace_missing_data.R")
data.limpio <- random.df(data, c(1,2))
View(data.limpio)
