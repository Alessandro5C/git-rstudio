clientes = c("Arturo", "Bill", "Jack")
fechas = c("2021-05-01", "2021-04-28", "2021-03-30")
pagos = c(315.1, 205.4,450.2)

#Convertir de string a fecha
fechas = as.Date(c("2021-05-01", "2021-04-28", "2021-03-30"))

pedidos = data.frame(clientes, fechas, pagos)
View(pedidos)

#Rdata files

#Guardar una vairbale en específico
save(pedidos, file = "data/pedidos.Rdata")

#Guardar una vairbale en específico
cliente.frec = c("Arturo", "Jack")
save(pedidos, cliente.frec, file = "data/pedidos.Rdata")

#Guardar todas los objetos a la vez
save.image(file = "data/all_data.Rdata")


#rds files
saveRDS(pedidos, file = "data/pedidos.rds")

remove(pedidos)

load("data/pedidos.Rdata")
attach("data/pedidos.Rdata")

orders = readRDS("data/pedidos.rds")
write.csv(pedidos, 'data/pedidos.csv', na="NA",row.names=FALSE)

write.csv(pedidos,'data/pedidos2.csv', na="NA")
View(read.csv("data/pedidos2.csv"))
