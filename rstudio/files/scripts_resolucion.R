#DEPENDENCIAS NECESARIAS PARA ESTOS SCRIPTS

#install.packages("dplyr")
library(dplyr)
#install.packages("openxlsx")
library(openxlsx)


data = read.csv("../data/hotel_bookings_cleaned.csv", sep=";")



#### A
ClientesPorHotel=table(data$hotel,data$arrival_date_year)
barplot(ClientesPorHotel,
        main="Clientes en cada hotel por a�o",
        col=c("red","blue"),legend=c("City hotel","Resort hotel"),
        xlab = ("a�o"),ylab = ("numero de clientes"),args.legend = list(x = "topright", inset = c(- 0.00, -0.05)))

#### B
demanda.hotel = table(data$arrival_date_year, data$arrival_date_month)

barplot(demanda.hotel, 
        main="Demanda de habitaciones por mes en cada a�o",
        col=c("red", "blue", "green"), legend=c("2015", "2016", "2017"),
        xlab = "Meses del a�o", ylab="N�mero de reservaciones")
demanda.hotel

#### C
dtx = read.xlsx("../data/hotel_bookings_miss.xlsx")
dtx$reservation_date =convertToDate(data$reservation_status_date)


origin = "1900-01-01"
dtx$reservation_month = format(as.Date(dtx$reservation_status_date, origin), "%m")
dtx$reservation_month = as.numeric(dtx$reservation_month)


dtx$reservation_temporary = dtx$reservation_month
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 1, 1, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 2, 1, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 3, 1, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 4, 2, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 5, 2, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 6, 2, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 7, 3, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 8, 3, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 9, 3, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 10, 4, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 11, 4, dtx$reservation_temporary)
dtx$reservation_temporary = ifelse(dtx$reservation_temporary == 12, 4, dtx$reservation_temporary)

dtx$reservation_temporary

dtx$reservation_temporary                                   
dtx$reservation_year = format(as.Date(dtx$reservation_status_date, origin), "%Y")
dtx$reservation_year = as.numeric(dtx$reservation_year)

reservaciones = table(dtx$reservation_year, dtx$reservation_temporary)

reservaciones
barplot(reservaciones, 
        main="Reserva de habitacionespor trimestre en cada a�o",
        col=c("gray", "red", "blue", "green"), legend=c("2014","2015", "2016", "2017"),
        xlab = "N� de trimestre", ylab="N�mero de reservaciones",
        args.legend = list(x = "topright",
                           inset = c(- 0.0, -0.05)))

#### D
data$reservation_date =as.Date(data$reservation_status_date, format="%d/%m/%Y")

#En caso de haber cargado los datos como .xlsx
# data$reservation_date =convertToDate(data$reservation_status_date)

x = data$reservation_date
origin = "1900-01-01"

data$reservation_year[x>=as.Date("2014-01-01") & x<as.Date("2015-01-01")] = 2014
data$reservation_year[x>=as.Date("2015-01-01") & x<as.Date("2016-01-01")] = 2015
data$reservation_year[x>=as.Date("2016-01-01") & x<as.Date("2017-01-01")] = 2016
data$reservation_year[x>=as.Date("2017-01-01") & x<as.Date("2018-01-01")] = 2017


titulo="Distribuci�n de demanda de reservas por a�o"
lbls = c("2014 -> ", "2015 -> ", "2016->", "2017 -> ")
draw_pie(data$reservation_year, lbls, titulo)

sum(data$reservation_year==2014)
summary(data$reservation_date[data$reservation_year==2014])
sum(data$reservation_date=="2014-10-17")


####  E
data$babyORchildren = (data$children>0 | data$babies>0)
data$babyORchildren[data$babyORchildren==TRUE] = 1

data$babyORchildren = as.numeric(data$babyORchildren)
sum(data$babyORchildren==1)

data$babies=fix_outliers(data$babies)
data$children=fix_outliers(data$children)

data$children <- media.valor(data[ ,11])
data$babies <- media.valor(data[ ,12])

lbls <- c("NO INCLUYE -> ", "INCLUYE -> ")
titulo="Cantidad de reservas que incluyen ni�os y/o bebes"
draw_pie(data$babyORchildren, lbls, titulo)

#### F
estacionamiento=table(data$required_car_parking_spaces)
density(data$required_car_parking_spaces)
plot(estacionamiento,main="estacionamientos requeridos",xlab=("estacionamientos pedidos"),ylab = ("estacionamientos"))

#### G
cancelados<-data%>%filter(is_canceled!=0)
tablaCancelado<-table(cancelados$arrival_date_month)
tablaCancelado1
porcentaje<- round(100*tablaCancelado/44224,1)
porcentaje
cols<-rainbow(12)
pie(tablaCancelado,radius = 0.5,main=("Cancelados por mes"),porcentaje,col=rainbow(12))
legend("topright",names(tablaCancelado),fill = cols)

#### H
canceladosPorAnio=table(data$is_canceled,data$arrival_date_year)
barplot(canceladosPorAnio,
        main="Reservas por a�o",
        col=c("red","blue"),legend=c("no cancelado","cancelado"),
        xlab = ("a�o"),ylab = ("numero de reservas"),args.legend = list(x = "topright",inset = c(- 0.05, -0.25)))