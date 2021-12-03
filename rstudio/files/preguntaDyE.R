#DEPENDENCIAS
#install.packages("openxlsx")
#library(openxlsx)
data = read.xlsx("../data/hotel_bookings_miss.xlsx")

dtx = data
dtx$reservation_date =convertToDate(data$reservation_status_date)

x = dtx$reservation_date
origin = "1900-01-01"

#EN fomrato fecha
dtx$reservation_year[x>=as.Date("2014-01-01") & x<as.Date("2015-01-01")] = 2014
dtx$reservation_year[x>=as.Date("2015-01-01") & x<as.Date("2016-01-01")] = 2015
dtx$reservation_year[x>=as.Date("2016-01-01") & x<as.Date("2017-01-01")] = 2016
dtx$reservation_year[x>=as.Date("2017-01-01") & x<as.Date("2018-01-01")] = 2017

#Si estuviera como numero
dtx$reservation_year = format(as.Date(dtx$reservation_status_date, origin), "%Y")
dtx$reservation_year = as.numeric(dtx$reservation_year)
dtx$reservation_month = format(as.Date(dtx$reservation_status_date, origin), "%m")
dtx$reservation_month = as.numeric(dtx$reservation_month)
dtx$reservation_day = format(as.Date(dtx$reservation_status_date, origin), "%d")
dtx$reservation_day = as.numeric(dtx$reservation_day)


#La menor cantidad de reservas se ha realizado en el año 2016
barplot(table(dtx$reservation_year))
barplot(table(dtx$reservation_month))
barplot(table(dtx$reservation_day))

draw_pie = function(df_col, lbls) {
  df_col = table(dtx$reservation_year)
  pct  = round(df_col/sum(df_col)*100)
  lbls = paste(lbls, pct) # add percents to labels
  lbls = paste(lbls,"%",sep="") # ad % to labels
  pie(df_col, labels= lbls, col=rainbow(length(lbls)),
      main="Distribución de reservas por año")
}

lbls <- c("2014 -> ", "2015 -> ", "2016->", "2017 -> ")
draw_pie(dtx$reservation_year, lbls)

convertToDate(42589)
#[1] "2016-08-07"
convertToDate(42581)
#[1] "2016-07-30"
convertToDate(42401)
#[1] "2016-02-01"
convertToDate(42774)
#[1] "2017-02-08"
