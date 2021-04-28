rand.valor <- function(x){ 
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}
# Reemplaza el valor de las varibales
# categóricas como Phone_type, en caso de
# ser NA, se reemplaza con un valor aleatorio


random.df <- function(df, cols){ 
  nombres <- names(df) 
  for (col in cols) {
    nombre <- paste(nombres[col], "valorado", sep = ".")
    df[nombre] <- rand.valor(df[,col])
    }
  df
}
