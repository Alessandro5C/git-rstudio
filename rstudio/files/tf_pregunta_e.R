#DEPENDENCIAS
#install.packages("openxlsx")
#library(openxlsx)
data = read.xlsx("../data/hotel_bookings_miss.xlsx")

dtx = data

#U HAVE TO USE THE CLEANED DATA CAUSE THERE ARE NA

media.valor <- function (x){
  x <- ifelse(is.na(x), mean(x, na.rm = TRUE), x)
  x
}

data$children <- media.valor(data[ ,11])
data$babies <- media.valor(data[ ,12])

dtx$babies = fix_outliers(dtx$babies)
dtx$children = fix_outliers(dtx$children)
#OBTENGO UN VECTOR QUE ME INDICA SI EXISTE ALMENOS 1 NIÑO O 1 BEBE
dtx$babyORchildren = (dtx$children>0 | dtx$babies>0)
#SUMATORIA RESPUESTA
dtx$babyORchildren[dtx$babyORchildren==TRUE] = 1

dtx$babyORchildren = as.numeric(dtx$babyORchildren)
sum(na.omit(dtx$babyORchildren==1)) #ESTE COMANDO SOLO USAR POR AHORA
sum(dtx$babyORchildren==1) #USA ESTE CUANDO LOS DATOS ESTEN LIMPIOS



lbls <- c("NO INCLUYE -> ", "INCLUYE -> ")
titulo="Cantidad de reservas que incluyen niños y/o bebes"
draw_pie(dtx$babyORchildren, lbls, titulo)
