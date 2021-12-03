data = read.csv("files/missing-data.csv", na.strings = "" )
data.limpia = na.omit(data) #Elimina los NA
is.na(data[4, 2])
is.na(data[4, 1])
is.na(data$Income) #Hay NAs en Income?
data.income.limpio <- data[!is.na(data$Income),]
data.phone_type.limpio <- data[!is.na(data$Phone_type),]
complete.cases(data) #V o F si un registro esta sin ningún NA
data.limpia2 <- data[complete.cases(data),]
data$Income[data$Income == 0]
data$Income[data$Income == 0] = NA
data$Income[data$Income == 0]
mean(data$Income) #Hallar promedio, retorna NA si hay minimo un valor nulo
mean(data$Income, na.rm=TRUE) #Halla promedio e ignora los NA
sd(data$Income) #standard deviation
sd(data$Income, na.rm=TRUE)
sum(data$Income)
sum(data$Income, na.rm=TRUE)