#DEPENDENCIAS
#install.packages("openxlsx")
#library(openxlsx)
data = read.csv("../data/hotel_bookings_miss.csv", sep=";")

dtx = data
dtx$reservation_date =as.Date(data$reservation_status_date, format="%d/%m/%Y")

x = dtx$reservation_date
origin = "1900-01-01"

dtx$reservation_year[x>=as.Date("2014-01-01") & x<as.Date("2015-01-01")] = 2014
dtx$reservation_year[x>=as.Date("2015-01-01") & x<as.Date("2016-01-01")] = 2015
dtx$reservation_year[x>=as.Date("2016-01-01") & x<as.Date("2017-01-01")] = 2016
dtx$reservation_year[x>=as.Date("2017-01-01") & x<as.Date("2018-01-01")] = 2017