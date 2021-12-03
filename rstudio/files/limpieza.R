#DEPENDENCIAS
#install.packages("openxlsx")
#library(openxlsx)
dataX = read.xlsx("../data/hotel_bookings_miss.xlsx")

dtx = data
n = names(dtx)

#DETECTAR LOS NA's
for (i in n) {
  print(paste(sum(is.na(dtx[i])), i, sep=" -> "))
}
print(paste("TOTAL DE NA's ", sum(is.na(dtx)), sep=" = "))

# c(3,4,6, 7, 32)

#ENCONTRAR OUTLIERS EN ...
for (i in n[c(3, 8:12, 17:19, 22, 26, 30)]) {
    boxplot(dtx[i], main=i)
    print(i)
}

#TDV NO SE QUE HACER CON LOS OUTLIERS Y NA


###NA
funcion.NA <- function(x){
  sum = 0
  for(i in 1:ncol(x)){
    cntNA <- colSums(is.na(x[i]))
    if(cntNA> 0){
      cat("Hay", cntNA, "\tvalores NA en la columna ", colnames(x[i]), "\n")  
    }
  }
}
print(paste("TOTAL DE NA's ", sum(is.na(dtx)), sep=" = "))

funcion.Vacios <- function(x){
  for(i in 1:ncol(x)){
    cat("Hay", colSums(x[i]==""), "\tvalores NA en la columna ", colnames(x[i]), "\n")
  }
}

comparar.outliers = function(x_col) {
  sinOutliers<-fix_outliers(x_col)
  par(mfrow=c(1,2))
  boxplot(x_col,main="Con outliers")
  boxplot(sinOutliers,main="Sin outliers")
}


