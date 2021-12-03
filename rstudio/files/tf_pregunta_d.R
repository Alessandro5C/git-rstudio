#DEPENDENCIAS
#install.packages("openxlsx")
#library(openxlsx)
data = read.xlsx("../data/hotel_bookings_miss.xlsx")

dtx = data
dtx$reservation_date =convertToDate(data$reservation_status_date)

x = dtx$reservation_date
origin = "1900-01-01"

#SEPARAR LAS RESERVAS POR AÑOS
dtx$reservation_year = format(as.Date(dtx$reservation_status_date, origin), "%Y")
dtx$reservation_year = as.numeric(dtx$reservation_year)

#FUNCION PARA DIBUJAR
draw_pie = function(df_col, lbls) {
  df_col = table(df_col)
  pct  = round(df_col/sum(df_col)*100)
  lbls = paste(lbls, pct) # add percents to labels
  lbls = paste(lbls,"%",sep="") # ad % to labels
  pie(df_col, labels= lbls, col=rainbow(length(lbls)),
      main="Demenda de reservas por año")
}

#DIBUJAR EL GRAFICO
lbls <- c("2014 -> ", "2015 -> ", "2016->", "2017 -> ")
draw_pie(dtx$reservation_year, lbls)

#EL SUMMARY CONFIRIMA LO DEL GRAFICO
summary(dtx$reservation_year)

#USANDO LOS VALORES ORIGINALES (FECHA EN NUMERO)
summary(dtx$reservation_status_date)

#NON USEFUL
#CONVERTIR LOS NUMEROS DE ( 1st Qu. | Median | Mean | 3rd Qu. )
convertToDate(42589) #RPTA "2016-08-07"
convertToDate(42581) #RPTA "2016-07-30"
convertToDate(42401) #RPTA "2016-02-01"
convertToDate(42774) #RPTA "2017-02-08"

#BUT LOOKING FOR OUTLIERS
boxplot(dtx$reservation_year, main="Reservas por año")
boxplot(dtx$reservation_date, main="Reservas por año")
boxplot(dtx$reservation_status_date, main="Reservas por año")

summary(dtx$reservation_year)

