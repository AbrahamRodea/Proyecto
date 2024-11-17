### Prueba 1 - elegir elementos de cada facción ###


# P1

library(tidyverse) # Para usar stringr 
library(stringr)

puntos<-read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv")

Lista1<-list(
  u<-c(puntos[[1]]),
  m<-c(puntos[[2]]),
  p<-c(puntos[[3]]),
  t<-c(puntos[[4]])
)

Lista1

str_view(puntos, "Exterminador")

str_subset(Lista1, "extermi")

### P2

datos1<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv"))
datos1

str_subset(datos1[[1]], "[extermi]")

### P3

unidad<-df[grepl("exterm", df$Lista1),c("Unidad","Puntos")]
unidad           
